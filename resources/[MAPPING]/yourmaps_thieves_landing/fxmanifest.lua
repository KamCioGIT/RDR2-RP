fx_version "adamant"

game "rdr3"

lua54 "yes"

this_is_map "yes"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

author "YourMAPS"

version "1.0 - April 2023"

files {

    'stream/objects/bar_counter01.ytyp',

}

data_file 'DLC_ITYP_REQUEST' 'stream/bar_counter01.ytyp'

escrow_ignore {
    'stream/*.ydr'   
}
dependency '/assetpacks'