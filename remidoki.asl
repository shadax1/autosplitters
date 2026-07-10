state("remidoki")
{
    byte game_state: "remidoki.exe", 0x5D834C;
    byte floor_id: "remidoki.exe", 0x5D891D;
    byte room_id: "remidoki.exe", 0x5D891E;
    byte west_junction_key: "remidoki.exe", 0x5D84F1;
    byte spear_the_gungnir: "remidoki.exe", 0x5D891A;
    byte training_room_key: "remidoki.exe", 0x5D84F2;
    byte super_jump: "remidoki.exe", 0x5D8918;
    byte dining_hall_key: "remidoki.exe", 0x5D84F3;
    byte kitchen_key: "remidoki.exe", 0x5D84F4;
    byte entrance_key: "remidoki.exe", 0x5D84F5;
    byte magic_room_key: "remidoki.exe", 0x5D84F6;
    byte fly: "remidoki.exe", 0x5D8919;
    byte green_orb: "remidoki.exe", 0x5D84FB;
    byte red_orb: "remidoki.exe", 0x5D84F7;
    byte silver_orb: "remidoki.exe", 0x5D84FC;
    byte demon_lord: "remidoki.exe", 0x5D891B;
    byte blue_orb: "remidoki.exe", 0x5D84F8;
    byte purple_orb: "remidoki.exe", 0x5D84FA;
    byte yellow_orb: "remidoki.exe", 0x5D84F9;
    byte study_key: "remidoki.exe", 0x5D84FD;
    byte remilia_key: "remidoki.exe", 0x5D84FE;
}

init
{
    refreshRate = 60;
    vars.triggeredSplits = new bool[20];
}

start
{
    if(old.game_state == 12 && current.game_state == 20) //when going from title screen to map
    {
        vars.triggeredSplits = new bool[20];
        return true;
    }
}

reset
{
    if((old.game_state == 20 && current.game_state == 10) || (old.game_state == 70 && current.game_state == 10))
    {
        vars.triggeredSplits = new bool[20];
        return true;
    }
    return false;
}

startup
{
    settings.Add("SplitWestJunctionKey", true, "West Junction Key");
    settings.Add("SplitSpearTheGungnir", true, "Spear the Gungnir");
    settings.Add("SplitTrainingRoomKey", true, "Training Room Key");
    settings.Add("SplitSuperJump", true, "Super Jump");
    settings.Add("SplitDiningHallKey", true, "Dining Hall Key");
    settings.Add("SplitKitchenKey", true, "Kitchen Key");
    settings.Add("SplitEntranceKey", true, "Entrance Key");
    settings.Add("SplitMagicRoomKey", true, "Magic Room Key");
    settings.Add("SplitFly", true, "Fly");
    settings.Add("SplitGreenOrb", true, "Green Orb");
    settings.Add("SplitRedOrb", true, "Red Orb");
    settings.Add("SplitSilverOrb", true, "Silver Orb");
    settings.Add("SplitDemonLord", true, "Demon Lord");
    settings.Add("SplitBlueOrb", true, "Blue Orb");
    settings.Add("SplitPurpleOrb", true, "Purple Orb");
    settings.Add("SplitYellowOrb", true, "Yellow Orb");
    settings.Add("SplitStudyKey", true, "Study Key");
    settings.Add("SplitRemiliaKey", true, "Remilia's Key");
    settings.Add("SplitMarisa", true, "Marisa");
    settings.Add("SplitCredits", true, "Credits");
}

update
{
    return true;
}

split
{
    if(settings["SplitWestJunctionKey"] && !vars.triggeredSplits[0] && old.west_junction_key == 0 && current.west_junction_key == 1) { return vars.triggeredSplits[0] = true; }
    if(settings["SplitSpearTheGungnir"] && !vars.triggeredSplits[1] && old.spear_the_gungnir == 0 && current.spear_the_gungnir == 1) { return vars.triggeredSplits[1] = true; }
    if(settings["SplitTrainingRoomKey"] && !vars.triggeredSplits[2] && old.training_room_key == 0 && current.training_room_key == 1) { return vars.triggeredSplits[2] = true; }
    if(settings["SplitSuperJump"]       && !vars.triggeredSplits[3] && old.super_jump == 0 && current.super_jump == 1)               { return vars.triggeredSplits[3] = true; }
    if(settings["SplitDiningHallKey"]   && !vars.triggeredSplits[4] && old.dining_hall_key == 0 && current.dining_hall_key == 1)     { return vars.triggeredSplits[4] = true; }
    if(settings["SplitKitchenKey"]      && !vars.triggeredSplits[5] && old.kitchen_key == 0 && current.kitchen_key == 1)             { return vars.triggeredSplits[5] = true; }
    if(settings["SplitEntranceKey"]     && !vars.triggeredSplits[6] && old.entrance_key == 0 && current.entrance_key == 1)           { return vars.triggeredSplits[6] = true; }
    if(settings["SplitMagicRoomKey"]    && !vars.triggeredSplits[7] && old.magic_room_key == 0 && current.magic_room_key == 1)       { return vars.triggeredSplits[7] = true; }
    if(settings["SplitFly"]             && !vars.triggeredSplits[8] && old.fly == 0 && current.fly == 1)                             { return vars.triggeredSplits[8] = true; }
    if(settings["SplitGreenOrb"]        && !vars.triggeredSplits[9] && old.green_orb == 0 && current.green_orb == 1)                 { return vars.triggeredSplits[9] = true; }
    if(settings["SplitRedOrb"]          && !vars.triggeredSplits[10] && old.red_orb == 0 && current.red_orb == 1)                    { return vars.triggeredSplits[10] = true; }
    if(settings["SplitSilverOrb"]       && !vars.triggeredSplits[11] && old.silver_orb == 0 && current.silver_orb == 1)              { return vars.triggeredSplits[11] = true; }
    if(settings["SplitDemonLord"]       && !vars.triggeredSplits[12] && old.demon_lord == 0 && current.demon_lord == 1)              { return vars.triggeredSplits[12] = true; }
    if(settings["SplitBlueOrb"]         && !vars.triggeredSplits[13] && old.blue_orb == 0 && current.blue_orb == 1)                  { return vars.triggeredSplits[13] = true; }
    if(settings["SplitPurpleOrb"]       && !vars.triggeredSplits[14] && old.purple_orb == 0 && current.purple_orb == 1)              { return vars.triggeredSplits[14] = true; }
    if(settings["SplitYellowOrb"]       && !vars.triggeredSplits[15] && old.yellow_orb == 0 && current.yellow_orb == 1)              { return vars.triggeredSplits[15] = true; }
    if(settings["SplitStudyKey"]        && !vars.triggeredSplits[16] && old.study_key == 0 && current.study_key == 1)                { return vars.triggeredSplits[16] = true; }
    if(settings["SplitRemiliaKey"]      && !vars.triggeredSplits[17] && old.remilia_key == 0 && current.remilia_key == 1)            { return vars.triggeredSplits[17] = true; }

    //from marisa fight to cutscene
    if(settings["SplitMarisa"] && !vars.triggeredSplits[18] && current.floor_id == 2 && current.room_id == 3 && old.game_state == 20 && current.game_state == 230)
    { return vars.triggeredSplits[18] = true; }

    //from custscene to credits
    if(settings["SplitCredits"] && !vars.triggeredSplits[19] && current.floor_id == 2 && current.room_id == 3 && old.game_state == 230 && current.game_state == 200)
    { return vars.triggeredSplits[19] = true; }

    return false;
}

isLoading
{
    return true;
}
