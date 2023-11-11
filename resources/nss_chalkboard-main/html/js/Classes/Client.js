class Client {

    /**
     * @static
     * @type {string}
     */
    static XHR_TYPE_POST = 'POST';

    /**
     * @static
     * @type {number}
     * @private
     */
    static _response_type_uid = 0;

    /**
     * @static
     * @type {Object.<string,function>}
     * @private
     */
    static _response_type_cb_list = {};

    /**
     * @constructor
     * @param {ChalkboardOnShowCallback} on_init
     * @param {function} on_show
     * @param {function} on_hide
     * @param {Chalkboard} chalkboard
     */
    constructor(on_init, on_show, on_hide, chalkboard) {

        /**
         * @type {string}
         * @private
         */
        this._resource_name = 'nss_chalkboard';

        /**
         * @type {function}
         * @protected
         */
        this._on_init = on_init || function () {
            console.error('Please specify on_init callback.');
        };

        /**
         * @type {function}
         * @protected
         */
        this._on_show = on_show || function () {
            console.error('Please specify on_show callback.');
        };

        /**
         * @type {function}
         * @protected
         */
        this._on_hide = on_hide || function () {
            console.error('Please specify on_hide callback.');
        };

        /**
         * @type {Chalkboard}
         * @protected
         */
        this._chalkboard = chalkboard;

        this._setupClientEventListener();
    }

    /**
     * @param {string} event_name
     * @param {*} [data]
     * @param {function} [cb]
     * @return {Client}
     */
    post(event_name, data, cb) {
        this._xhr(event_name, data, cb, Client.XHR_TYPE_POST);
        return this;
    }

    /**
     * @return {Client}
     */
    close() {
        this.post('close');
        return this;
    }

    /**
     * @param {function} cb
     * @return {string}
     * @private
     */
    _uniqueResponseType(cb) {
        Client._response_type_uid++;
        const response_type_uid = 'rtuid_' + Client._response_type_uid;
        Client._response_type_cb_list[response_type_uid] = cb;
        return response_type_uid;
    }

    /**
     * @param {string} event_name
     * @param {*} [data]
     * @param {function} [cb]
     * @param {string} [method]
     * @private
     */
    _xhr(event_name, data, cb, method) {

        if (this._resource_name === '') {
            console.error('Resource name is not set - waiting for first client message.');
        }

        method = method || Client.XHR_TYPE_POST;

        if (typeof data !== 'object') {
            data = {};
        }

        const url = 'http://' + this._resource_name + '/' + event_name

        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.setRequestHeader('Content-Type', 'application/json');

        if (typeof cb === 'function') {
            data.response_event_type = this._uniqueResponseType(cb);
        }

        xhr.send(JSON.stringify(data));
    }

    /**
     * @private
     */
    _setupClientEventListener() {
        window.addEventListener('message', this._onClientMessage.bind(this))
    }

    /**
     * @param {MessageEvent} event
     * @private
     */
    _onClientMessage(event) {

        /**
         * @type {ChalkboardMessageResponse}
         */
        const data = event.data || {};
        const type = data.type = data.type || 'unknown_type';

        const response_callback = Client._response_type_cb_list[type] || null;

        if (typeof response_callback === 'function') {
            response_callback(data);
            return;
        }

        switch (type) {

            case 'init':
                this._onMessageInit(data);
                return;

            case 'show':
                this._onMessageShow(data.message || '');
                return;

            case 'hide':
                this._onMessageHide();
                return;
        }

        console.error('Unknown client message type:', type, data);
    }

    /**
     * @param {ChalkboardMessageResponse} data
     * @protected
     */
    _onMessageInit(data) {

        this._resource_name = data.resourceName;

        /**
         * @type {ChalkboardConfig}
         */
        const config = data.config || {};

        /**
         * @type {ChalkboardLanguage}
         */
        const language = data.language || {error: 'No language given!'};

        if (language.error) {
            console.error(this._resource_name + ': ' + language.error);
            this._on_hide();
            return;
        }

        this._on_init(language, config);
    }

    /**
     * @param {string} message
     * @protected
     */
    _onMessageShow(message) {
        this._on_show(message);
    }

    /**
     * @protected
     */
    _onMessageHide() {
        this._on_hide();
    }
}

export {Client};