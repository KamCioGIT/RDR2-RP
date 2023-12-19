fx_version "adamant"
game "rdr3"

this_is_a_map "yes"


rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."


files {
    'stream/counter.ytyp'

}

client_scripts {
    'client_bakery.obfuscated.lua',
  }

data_file 'DLC_ITYP_REQUEST' 'stream/counter.ytyp' 

name "Blackwater Bakery"
author "Nello"


escrow_ignore {'stream/*', }

lua54 "yes"

files {'qtas.xml'}

  data_file "TIMECYCLEMOD_FILE" "qtas.xml"
dependency '/assetpacks'