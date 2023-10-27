state("rks_fs", "og")
{
	uint igt: "rks_fs.exe", 0x0750BB0;
	uint stage: "rks_fs.exe", 0x03AD924;
	uint fanfare: "rks_fs.exe", 0x072748C; //around 20 just before touching the ground then goes to 401 and up
}

state("rksf", "steam")
{
	uint igt: "rksf.exe", 0x0CE4450;
	uint stage: "rksf.exe", 0x076B940;
	uint fanfare: "rksf.exe", 0x0CBAD04;
}

init
{
	refreshRate = 60;

	vars.triggeredSplits = new bool[17];

	if (modules.First().ModuleMemorySize == 8593408)
		version = "og";
	else if (modules.First().ModuleMemorySize == 14446592)
		version = "steam";
} 

start
{
	if(current.igt != 0 && old.igt == 0)
	{
		vars.triggeredSplits = new bool[17];
		return true;
	}
}

reset
{
	if(current.igt == 0 && old.igt != 0)
	{
		vars.triggeredSplits = new bool[17];
		return true;
	}
	return false;
} 

startup
{
	settings.Add("SplitPrologue", false, "Prologue");
	settings.Add("SplitLuste", true, "Luste"); //850
	settings.Add("SplitTrauare", true, "Trauare"); //48
	settings.Add("SplitSchwer", true, "Schwer"); //99
	settings.Add("SplitZorne", true, "Zorne"); //831
	settings.Add("SplitDolis", true, "Dolis"); //29
	settings.Add("SplitLiebea", true, "Liebea"); //801
	settings.Add("SplitSichte", true, "Sichte"); //872
	settings.Add("SplitGrolla", true, "Grolla"); //69
	settings.Add("SplitEifer", true, "Eifer"); //931 503
	settings.Add("SplitPamela", true, "Pamela"); //913
	settings.Add("SplitSchirach", true, "Schirach"); //942
	settings.Add("SplitLechtRink", true, "Lecht & Rink"); //228 
	settings.Add("SplitSepperin", true, "Sepperin"); //950
	settings.Add("SplitDarkDevil", true, "Dark Devil"); //262
	settings.Add("SplitBossRush", true, "Boss Rush"); //0 493
	settings.Add("SplitIris", true, "Iris"); //981
}

update
{
	return true;
}

split
{
	if(settings["SplitPrologue"] && !vars.triggeredSplits[0] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 1) { return vars.triggeredSplits[0] = true; }
	if(settings["SplitLuste"] && !vars.triggeredSplits[1] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 5) { return vars.triggeredSplits[1]  = true; }
	if(settings["SplitTrauare"] && !vars.triggeredSplits[2] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 4) { return vars.triggeredSplits[2] = true; }
	if(settings["SplitSchwer"] && !vars.triggeredSplits[3] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 9) { return vars.triggeredSplits[3] = true; }
	if(settings["SplitZorne"] && !vars.triggeredSplits[4] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 3) { return vars.triggeredSplits[4] = true; }
	if(settings["SplitDolis"] && !vars.triggeredSplits[5] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 2) { return vars.triggeredSplits[5] = true; }
	if(settings["SplitLiebea"] && !vars.triggeredSplits[6] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 8) { return vars.triggeredSplits[6] = true; }
	if(settings["SplitSichte"] && !vars.triggeredSplits[7] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 7) { return vars.triggeredSplits[7] = true; }
	if(settings["SplitGrolla"] && !vars.triggeredSplits[8] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 6) { return vars.triggeredSplits[8] = true; }
	if(settings["SplitEifer"] && !vars.triggeredSplits[9] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 11) { return vars.triggeredSplits[9] = true; }
	if(settings["SplitPamela"] && !vars.triggeredSplits[10] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 10) { return vars.triggeredSplits[10] = true; }
	if(settings["SplitSchirach"] && !vars.triggeredSplits[11] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 12) { return vars.triggeredSplits[11] = true; }
	if(settings["SplitLechtRink"] && !vars.triggeredSplits[12] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 13) { return vars.triggeredSplits[12] = true; }
	if(settings["SplitSepperin"] && !vars.triggeredSplits[13] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 14) { return vars.triggeredSplits[13] = true; }
	if(settings["SplitDarkDevil"] && !vars.triggeredSplits[14] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 15) { return vars.triggeredSplits[14] = true; }
	if(settings["SplitBossRush"] && !vars.triggeredSplits[15] && current.fanfare > 410 && current.fanfare < 500 && current.stage == 16) { return vars.triggeredSplits[15] = true; }
	if(settings["SplitIris"] && !vars.triggeredSplits[16] && old.stage == 17 && current.stage == 18) { return vars.triggeredSplits[16] = true; }
	return false;
}

gameTime
{
	if(current.igt != old.igt)
		return TimeSpan.FromMilliseconds(current.igt*16.66666666666667);
}

isLoading
{
	return true;
}
