state("MEGAMARI")
{
	uint stage: "megamari.exe", 0xDD6C4;
	uint sprite: "megamari.exe", 0xDB0D4, 0x90;
	uint boss_hp: "megamari.exe", 0xCF708;
}

init
{
	refreshRate = 60;
	vars.triggeredSplits = new bool[14];
}

start
{
	if(old.sprite == 18 && current.sprite == 19)
	{
		vars.triggeredSplits = new bool[14];
		return true;
	}
}

reset
{
	if(current.sprite == 18)
	{
		vars.triggeredSplits = new bool[14];
		return true;
	}
	return false;
}

startup
{
	settings.Add("SplitCirno", true, "Cirno");
	settings.Add("SplitEirin", true, "Eirin");
	settings.Add("SplitYuyuko", true, "Yuyuko");
	settings.Add("SplitReisen", true, "Reisen");
	settings.Add("SplitReimu", true, "Reimu");
	settings.Add("SplitYoumu", true, "Youmu");
	settings.Add("SplitRemilia", true, "Remilia");
	settings.Add("SplitSakuya", true, "Sakuya");
	settings.Add("SplitPatchouli1", true, "Patchouli 1");
	settings.Add("SplitPatchouli2", true, "Patchouli 2");
	settings.Add("SplitPatchouli3", true, "Patchouli 3");
	settings.Add("SplitPatchouli4", true, "Patchouli 4");
	settings.Add("SplitPatchouli5", true, "Patchouli 5");
	settings.Add("SplitPatchouli6", true, "Patchouli 6");
}

update
{
	return true;
}

split
{
	if(settings["SplitCirno"] && !vars.triggeredSplits[0] && current.sprite == 20 && current.stage == 1) { return vars.triggeredSplits[0] = true; }
	if(settings["SplitEirin"] && !vars.triggeredSplits[1] && current.sprite == 20 && current.stage == 7) { return vars.triggeredSplits[1] = true; }
	if(settings["SplitYuyuko"] && !vars.triggeredSplits[2] && current.sprite == 20 && current.stage == 5) { return vars.triggeredSplits[2] = true; }
	if(settings["SplitReisen"] && !vars.triggeredSplits[3] && current.sprite == 20 && current.stage == 6) { return vars.triggeredSplits[3] = true; }
	if(settings["SplitReimu"] && !vars.triggeredSplits[4] && current.sprite == 20 && current.stage == 0) { return vars.triggeredSplits[4] = true; }
	if(settings["SplitYoumu"] && !vars.triggeredSplits[5] && current.sprite == 20 && current.stage == 4) { return vars.triggeredSplits[5] = true; }
	if(settings["SplitRemilia"] && !vars.triggeredSplits[6] && current.sprite == 20 && current.stage == 3) { return vars.triggeredSplits[6] = true; }
	if(settings["SplitSakuya"] && !vars.triggeredSplits[7] && current.sprite == 20 && current.stage == 2) { return vars.triggeredSplits[7] = true; }
	if(settings["SplitPatchouli1"] && !vars.triggeredSplits[8] && current.sprite == 20 && current.stage == 8) { return vars.triggeredSplits[8] = true; }
	if(settings["SplitPatchouli2"] && !vars.triggeredSplits[9] && current.sprite == 20 && current.stage == 9) { return vars.triggeredSplits[9] = true; }
	if(settings["SplitPatchouli3"] && !vars.triggeredSplits[10] && current.sprite == 20 && current.stage == 12) { return vars.triggeredSplits[10] = true; }
	if(settings["SplitPatchouli4"] && !vars.triggeredSplits[11] && current.sprite == 20 && current.stage == 13) { return vars.triggeredSplits[11] = true; }
	if(settings["SplitPatchouli5"] && !vars.triggeredSplits[12] && current.sprite == 20 && current.stage == 10) { return vars.triggeredSplits[12] = true; }
	if(settings["SplitPatchouli6"] && !vars.triggeredSplits[13] && old.boss_hp > 0 && current.boss_hp == 0 && current.stage == 11) { return vars.triggeredSplits[13] = true; }
	return false;
}

isLoading
{
	return true;
}
