fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

shared_script 'cfg.lua'

dependency 'ox_lib'

client_scripts {
	'@uiprompt/uiprompt.lua',
	'@ox_lib/init.lua',
	'cfg.lua',
	'client.lua',
}


server_scripts {
	'server.lua',
	'@mysql-async/lib/MySQL.lua'
}

lua54 'yes'