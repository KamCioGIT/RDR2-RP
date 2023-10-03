fx_version "adamant"
game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

shared_script 'cfg.lua'

client_scripts {
	"@uiprompt/uiprompt.lua",
	'cfg.lua',
	'client.lua',
}

server_scripts {
	'server.lua',
	'@mysql-async/lib/MySQL.lua',
}