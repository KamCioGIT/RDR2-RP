AnimConfig = {}
AnimConfig.Radius = 250.0
AnimConfig.Animations = {
    ["conveyor-top"] = {
        dict = "props_misc@annesburg_coal",
        anim = "conveyor01x_full",
        model = "p_annconveyor01x",
    },
    ["conveyor-mid-slide"] = {
        dict = "props_misc@annesburg_coal",
        anim = "annconvmid1x_full",
        model = "p_annconvmid1x_belt",
    },
    ["conveyor-mid"] = {
        dict = "props_misc@annesburg_coal",
        anim = "annconvey03_full",
        model = "p_annconveyor03x",
    },
    ["conveyor-lower"] = {
        dict = "props_misc@annesburg_coal",
        anim = "annconvey04_full",
        model = "p_annconveyor04x",
    },
    ["conveyor-sifter"] = {
        dict = "props_misc@annesburg_coal",
        anim = "annsifter01_full",
        model = "p_annsifter01x",
    },
    ["conveyor-steamengine"] = {
        dict = "props_misc@annesburg_coal",
        anim = "steameng01_full",
        model = "p_annsteameng01x",
    },
    ["conveyor-coalbin"] = {
        dict = "props_misc@annesburg_coal",
        anim = "coalbin01_full",
        model = "p_anncoalbin01x",
    },
    ["conveyor-pulleys3"] = {
        dict = "props_misc@annesburg_coal",
        anim = "anngears03_full",
        model = "p_annpulleys03x",
    },
    ["conveyor-pulleys4"] = {
        dict = "props_misc@annesburg_coal",
        anim = "anngears04_full",
        model = "p_annpulleys04x",
    },
    ["church-bell"] = {
        dict = "props_misc@church_bells", 
        anim = "loop",
        model = "p_churchbell01x",
        bell = true
    },
    ["trapdoor-strgen"] = {
        dict = "script_proc@robberies@shop@strgen@player_open_trapdoor", 
        anim = "trapdoor_base_trapdoor",
        model = "p_trapdoor01x",
    },
}


-- ["script_proc@robberies@shop@strgen@player_open_trapdoor"] = {
--     "trapdoor_base_floorboard",
--     "trapdoor_base_trapdoor",
--     "enter_lf",
--     "enter_rf_trapdoor",
--     "enter_rf",
--     "trapdoor_base",
--     "enter_lf_trapdoor",
--     "enter_rf_floorboard",
--     "enter_lf_floorboard",
-- },