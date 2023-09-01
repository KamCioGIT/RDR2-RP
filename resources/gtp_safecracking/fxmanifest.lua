lua54 'yes'
fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script {"client.lua", "config.lua"}

description 'Safe Cracking Script by GTP Development'

ui_page "ui/index.html"

files {'ui/index.html', 'ui/*.png', 'ui/*.js', 'ui/*.css', 'ui/*.wav'}

escrow_ignore {"config.lua"}

dependency '/assetpacks'