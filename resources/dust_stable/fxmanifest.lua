fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server.lua',
	'config.lua'
}
 
client_script {
	"@uiprompt/uiprompt.lua",
	'@ox_lib/init.lua',
	'client.lua',
	'config.lua'
}

lua54 'yes'