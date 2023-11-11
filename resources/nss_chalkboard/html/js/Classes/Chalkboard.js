import {Client} from "./Client.js";

class Chalkboard {

    constructor() {

        /**
         * @type {ChalkboardConfig}
         * @private
         */
        this._config = {};

        /**
         * @type {Client}
         * @private
         */
        this._client = new Client(
            this._onInit.bind(this),
            this._onShow.bind(this),
            this._onHide.bind(this),
            this
        );

        window.addEventListener('keydown', (event) => {
            if (event.key === 'Backspace') {
                this._client.close();
            }
        });

        this._client.post('init');
    }

    /**
     * @param {ChalkboardLanguage} language
     * @param {ChalkboardConfig} config
     * @private
     */
    _onInit(language, config) {
        this._config = config;
        this._language = language;
    }

    /**
     * @param {string} message
     * @private
     */
    _newBoard(message) {
        this._el = document.createElement('div');
        this._el.classList.add('nss-chalkboard');

        this._text_el = document.createElement('div');
        this._text_el.classList.add('nss-chalkboard__text');
        this._el.appendChild(this._text_el);

        if (this._language.close_text) {
            this._close_hint_el = document.createElement('div');
            this._close_hint_el.classList.add('nss-chalkboard__close-hint');
            this._close_hint_el.innerHTML = this._language.close_text;
            this._el.appendChild(this._close_hint_el);
        }

        document.body.appendChild(this._el);

        this._text_el.innerHTML = message;
    }

    /**
     * @private
     */
    _removeExistingBoard() {

        if (false === this.isShowing()) {
            return;
        }

        const old_board = this._el;
        delete this._el;

        old_board.classList.add('nss-chalkboard--out');

        window.setTimeout(() => {
            old_board.remove();
        }, 500);
    }

    /**
     * @param {string} message
     * @private
     */
    _onShow(message) {

        message = message.toString().trim();


        if (message.length > 100) {
            message = message.slice(0, 125) + '...';
        }

        let words = message.split(' ');
        let optimized_words = [];

        words.forEach((word) => {
            word = word.replace(/(.{20})/g, "$1&shy;");
            optimized_words.push(word);
        });

        message = optimized_words.join(' ');

        this._removeExistingBoard();

        this._newBoard(message);
    }

    _onHide() {
        this._removeExistingBoard();
    }

    /**
     * @return {boolean}
     */
    isShowing() {
        return typeof this._el !== "undefined";
    }
}

export {Chalkboard};