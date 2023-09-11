fx_version "adamant"
game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


client_scripts {
	"@uiprompt/uiprompt.lua",
	'wepsharedcomp.lua',
	'wepspecomp.lua',
	'config.lua',
	'client.lua',
	
}

server_scripts {
	'wepsharedcomp.lua',
	'wepspecomp.lua',
	'server.lua',
	
}