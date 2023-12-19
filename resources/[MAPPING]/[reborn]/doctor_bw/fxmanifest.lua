fx_version "adamant"
game "rdr3"

this_is_a_map "yes"


rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."


client_scripts {
    'client_doctor.obfuscated.lua',
  }



name "Doctor blackwater"
author "Nello"




escrow_ignore {'stream/*', }

lua54 "yes"


files {'qtas.xml'}

  data_file "TIMECYCLEMOD_FILE" "qtas.xml"
dependency '/assetpacks'