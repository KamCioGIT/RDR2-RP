fx_version "adamant"

game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

this_is_a_map "yes"

lua54 "yes"

 escrow_ignore {
     'stream/*/*.ydr', 
 }

client_scripts {
    'load_unload_interiors.lua',
}

files {
    'test_timecycle.xml',
    'stream/ytyp/*.ytyp',
}

data_file "TIMECYCLEMOD_FILE" "test_timecycle.xml"
data_file 'DLC_ITYP_REQUEST' 'stream/[tribune]/bar_counter01.ytyp'

author "YourMAPS Tafé"
dependency '/assetpacks'