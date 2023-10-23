Config = {}
    Config.Logs = {
        ['default'] = '', -- Webhok link
        ['inventory'] = 'https://discord.com/api/webhooks/1165342681795411988/2srjLmkd5dmO81zNqz-lmKq-jYtMhph4nYj4c6MwcZtiT9dp2wKMIc_LNmOm-TSxIKCc',
        ['money'] = 'https://discord.com/api/webhooks/1165342737026003095/evCk6e8RcAVyXqMU3CW8WgQFvDTBDaDDE4Q6RefQB43PJElqZekN0SKDbGhu-u9p1f2T',
        ['telegram'] = 'https://discord.com/api/webhooks/1165342804906623066/XHOUBDOMn2KUxViy2MUhIHWS_h1vtIefZC-hProf6jye3N9LkqrGt-NCoLap0cr-bO--',
        ['rumors'] = 'https://discord.com/api/webhooks/1165342863245185117/XBCiEgSkVaBOMJMuDFbvvnnCBkS91dN0DC_VHQ0Fs99_X-_oS207ohhOExckebfyXfnA',
    }


Config.Colors = {
    ["default"] = 16711680,
    ["blue"] = 25087,
    ["green"] = 762640,
    ["white"] = 16777215,
    ["black"] = 0,
    ["orange"] = 16743168,
    ["lightgreen"] = 65309,
    ["yellow"] = 15335168,
    ["turqois"] = 62207,
    ["pink"] = 16711900,
    ["red"] = 16711680,
}

--[[
    Usage:
    local data = {
        ['Player'] = nil, -- You need to set source here
        ['Target'] = nil, -- You need to set source here
        ['Log'] = 'default', -- Log name
        ['Title'] = 'Title', -- Title
        ['Message'] = 'Message' -- Message
        ['Color'] = 'blue', -- Set your color here check Config.Colors for available colors
    }

    TriggerEvent('Boost-Logs:SendLog', data)

]]--
