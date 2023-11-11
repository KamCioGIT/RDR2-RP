/**
 * @callback ChalkboardOnShowCallback
 * @param {ChalkboardLanguage} language
 * @param {ChalkboardConfig} config
 */

/**
 * @typedef {Object} ChalkboardMessageResponse
 * @property {string} type
 * @property {ChalkboardConfig} [config]
 * @property {ChalkboardLanguage} [language]
 * @property {string} [resourceName]
 * @property {string} [message]
 */

/**
 * @typedef {Object} ChalkboardConfig
 * @property {boolean} [sender_see_message]
 * @property {number} [message_range]
 * @property {number} [close_key]
 * @property {string} [command]
 * @property {string} [item_id]
 */

/**
 * @typedef {Object.<string,string|number>} ChalkboardLanguage
 * @property {string} [close_text]
 * @property {string} [nobody_nearby]
 * @property {string} [chalkboard_updated]
 * @property {string} [your_are_dead]
 * @property {string} [no_chalkboard_item]
 * @property {string} [hint]
 * @property {boolean} [error]
 */