fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

ui_page('html/ui.html') 
client_scripts {
    "@uiprompt/uiprompt.lua",
	'@ox_lib/init.lua',
    'config.lua',
    'client.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}
files {
	'html/ui.html', 
    'html/style.css',
    'html/script.js',
    'html/bg.png',
    'html/back_gen.png',
    'html/barre_elem.png',
    'html/btn_select.png',
    'html/btn.png',
    'html/close_select.png',
    'html/close.png',
    'html/machine.ttf',
    'html/script.ttf',
}

lua54 'yes'