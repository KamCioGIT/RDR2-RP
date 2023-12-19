fx_version "adamant"
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

files {
    'stream/[lady]/lady.ytyp';
    'stream/[obrazy]/obrazy.ytyp';
    'stream/[dywany]/dywany.ytyp';
    'stream/[rozne]/rozne.ytyp';
    'stream/[ladyv2]/ladyv2.ytyp';
    'stream/[ladyv3]/ladyv3.ytyp';
    'stream/[obrazyv2]/obrazyv2.ytyp';
    'stream/[dywanyv2]/dywanyv2.ytyp';
    'stream/[roznev2]/roznev2.ytyp';
}

data_file 'DLC_ITYP_REQUEST' 'stream/[lady]/lady.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[obrazy]/obrazy.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[dywany]/dywany.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[rozne]/rozne.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[ladyv2]/ladyv2.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[ladyv3]/ladyv3.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[obrazyv2]/obrazyv2.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[dywanyv2]/dywanyv2.ytyp';
data_file 'DLC_ITYP_REQUEST' 'stream/[roznev2]/roznev2.ytyp';

name "Blackwater Props"
author "Snail"


escrow_ignore {'stream/*', }
escrow_ignore {'stream/[dywany]/*', }
escrow_ignore {'stream/[lady]/*', }
escrow_ignore {'stream/[ladyv2]/*', }
escrow_ignore {'stream/[obrazy]/*', }
escrow_ignore {'stream/[obrazyv2]/*', }
escrow_ignore {'stream/[rozne]/*', }
escrow_ignore {'stream/[roznev2]/*', }

lua54 "yes"
dependency '/assetpacks'