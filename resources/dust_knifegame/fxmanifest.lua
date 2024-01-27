fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

lua54 'yes'


exports {
		"DataViewNativeGetEventData"
}

files {
  'config.lua'
}

client_scripts {
  'config.lua',
  'client.lua',
}

server_scripts {
  'config.lua',
  'server.lua'
}