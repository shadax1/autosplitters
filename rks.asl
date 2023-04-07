state("rks", "og1.05c")
{
    uint igt_sec: "rks.exe", 0x04130A4;
    uint fanfare: "rks.exe", 0x03A03C4; //around 20 just before touching the ground then goes to 401 and up
    uint stage: "rks.exe", 0x021D498; //1 = prologue, 2 = freudia, ... , 10 = sep 1, 14 = iris 1, 17 = final stage
}

state("rks_e", "og_en1.05c")
{
    uint igt_sec: "rks_e.exe", 0x04130A4;
    uint fanfare: "rks_e.exe", 0x03A03C4;
    uint stage: "rks_e.exe", 0x021D498;
}

state("rks", "og1.06a")
{
    uint igt_sec: "rks.exe", 0x040E7EC;
    uint fanfare: "rks.exe", 0x039BB04;
    uint stage: "rks.exe", 0x0218498;
}

state("rks", "steam")
{
    uint igt_sec: "rks.exe", 0x0802D2C;
    uint fanfare: "rks.exe", 0x078E7D8;
    uint stage: "rks.exe", 0x03AF344;
}

init
{
	refreshRate = 60;

	vars.triggeredSplits = new bool[17];
	if (modules.First().ModuleMemorySize == 8200192)
        version = "og1.05c";
    else if (modules.First().ModuleMemorySize == 7774208)
        version = "og1.06a";
    else if (modules.First().ModuleMemorySize == 14884864)
        version = "steam";
} 

start
{
    if(current.igt_sec != 0)
    {
		vars.triggeredSplits = new bool[17];
		return true;
    }
}

reset
{
	if(current.igt_sec == 0)
	{
		vars.triggeredSplits = new bool[17];
		return true;
	}
	return false;
} 

startup
{
	settings.Add("SplitPrologue", false, "Prologue"); //4481
	settings.Add("SplitFreudia", true, "Freudia"); //5761
	settings.Add("SplitGrolla", true, "Grolla"); //897
	settings.Add("SplitLiebea", true, "Liebea"); //1043
	settings.Add("SplitLuste", true, "Luste"); //737
	settings.Add("SplitZorne", true, "Zorne"); //1345
	settings.Add("SplitSchwer", true, "Schwer"); //1921
	settings.Add("SplitSichte", true, "Sichte"); //885
	settings.Add("SplitTrauare", true, "Trauare"); //1761
	settings.Add("SplitCrossWall", true, "Cross Wall"); //801
	settings.Add("SplitPoltergeist", true, "Poltergeist"); //2549
	settings.Add("SplitRaimund", true, "Raimund"); //801
	settings.Add("SplitSepperin", true, "SplitSepperin"); //3329
	settings.Add("SplitBosspider", true, "Bosspider"); //2042
	settings.Add("SplitDeviledEgg", true, "Deviled Egg"); //865
	settings.Add("SplitBossRush", true, "Boss Rush"); //2049
	settings.Add("SplitIris", true, "Iris"); //769
}

update
{
	return true;
}

split
{
	if(settings["SplitPrologue"] && !vars.triggeredSplits[16] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 1) { return vars.triggeredSplits[16] = true; }
	if(settings["SplitFreudia"] && !vars.triggeredSplits[0] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 2) { return vars.triggeredSplits[0] = true; }
	if(settings["SplitGrolla"] && !vars.triggeredSplits[1] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 6) { return vars.triggeredSplits[1] = true; }
	if(settings["SplitLiebea"] && !vars.triggeredSplits[2] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 8) { return vars.triggeredSplits[2] = true; }
	if(settings["SplitLuste"] && !vars.triggeredSplits[3] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 5) { return vars.triggeredSplits[3] = true; }
	if(settings["SplitZorne"] && !vars.triggeredSplits[4] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 3) { return vars.triggeredSplits[4] = true; }
	if(settings["SplitSchwer"] && !vars.triggeredSplits[5] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 9) { return vars.triggeredSplits[5] = true; }
	if(settings["SplitSichte"] && !vars.triggeredSplits[6] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 7) { return vars.triggeredSplits[6] = true; }
	if(settings["SplitTrauare"] && !vars.triggeredSplits[7] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 4) { return vars.triggeredSplits[7] = true; }
	if(settings["SplitCrossWall"] && !vars.triggeredSplits[8] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 10) { return vars.triggeredSplits[8] = true; }
	if(settings["SplitPoltergeist"] && !vars.triggeredSplits[9] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 11) { return vars.triggeredSplits[9] = true; }
	if(settings["SplitRaimund"] && !vars.triggeredSplits[10] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 12) { return vars.triggeredSplits[10] = true; }
	if(settings["SplitSepperin"] && !vars.triggeredSplits[11] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 13) { return vars.triggeredSplits[11] = true; }
	if(settings["SplitBosspider"] && !vars.triggeredSplits[12] && current.fanfare> 410 && current.fanfare < 500 && current.stage == 14) { return vars.triggeredSplits[12] = true; }
	if(settings["SplitDeviledEgg"] && !vars.triggeredSplits[13] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 15) { return vars.triggeredSplits[13] = true; }
	if(settings["SplitBossRush"] && !vars.triggeredSplits[14] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 16) { return vars.triggeredSplits[14] = true; }
	if(settings["SplitIris"] && !vars.triggeredSplits[15] && old.stage == 17 && current.stage == 18) { return vars.triggeredSplits[15] = true; }
	return false;
}