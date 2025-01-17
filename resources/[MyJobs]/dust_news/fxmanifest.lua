fx_version 'adamant'

game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'

files {
  'config.lua'
}

client_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@ox_lib/init.lua',
  'config.lua',
  'client.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  '@ox_lib/init.lua',
  'config.lua',
  'server.lua',
}
ui_page 'html/index.html'

files {
    'html/index.js',
    'html/index.css',
    'html/index.html',
    'html/crock.ttf',
    'html/images/*.png',
}
