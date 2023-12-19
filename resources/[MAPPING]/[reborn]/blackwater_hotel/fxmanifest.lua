fx_version "adamant"
game "rdr3"

this_is_a_map "yes"


rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."


files {
    'stream/customobjects/dywan.ytyp';

}

data_file 'DLC_ITYP_REQUEST' 'stream/customobjects/dywan.ytyp' ;

escrow_ignore {'stream/*', }
escrow_ignore {'stream/customobjects/*', }



client_scripts {
    'client_hotel.obfuscated.lua',
  }

name "Blackwater Hotel"
author "Nello"



escrow_ignore {'stream/*', }

lua54 "yes"

files {'qtas.xml'}

  data_file "TIMECYCLEMOD_FILE" "qtas.xml"


dependency '/assetpacks'