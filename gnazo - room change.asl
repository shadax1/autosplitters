state("gnazo")
{
    uint ReimuInParty:	"gnazo.exe",	0x0853400;
    uint YukariInParty:	"gnazo.exe",	0x085363C;
    uint KanakoInParty:	"gnazo.exe",	0x08537F4;
    short RoomID:		"gnazo.exe",	0x033C690;
    byte Flag:			"gnazo.exe",	0x0409776;
}

init
{
    refreshRate = 60;
    vars.triggeredSplits = new bool[23];
	vars.frames = 0;
}

start
{
    if(old.ReimuInParty == 0 && current.ReimuInParty == 1)
	{
		vars.triggeredSplits = new bool[23];
		return true;
	}
}

reset
{
	if(old.ReimuInParty == 1 && current.ReimuInParty == 0)
	{
		vars.triggeredSplits = new bool[23];
		return true;
	}
	return false;
}

startup
{
	settings.Add("SplitAlice",		true,	"Alice");
	settings.Add("SplitCirno",		true,	"Cirno");
	settings.Add("SplitMeiling",	true,	"Meiling");
	settings.Add("SplitPatchouli",	true,	"Patchouli");
	settings.Add("SplitSakuya",		true,	"Sakuya");
	settings.Add("SplitRemilia",	true,	"Remilia");
	settings.Add("SplitYoumu",		true,	"Youmu");
	settings.Add("SplitYuyuko",		true,	"Yuyuko");
	settings.Add("SplitRumia",		true,	"Rumia");
	settings.Add("SplitDaiyousei",	true,	"Daiyousei");
	settings.Add("SplitFlandre",	true,	"Flandre");
	settings.Add("SplitYukari",		true,	"Yukari");
	settings.Add("SplitKeine",		true,	"Keine");
	settings.Add("SplitTewi",		true,	"Tewi");
	settings.Add("SplitReisen",		true,	"Reisen");
	settings.Add("SplitEirin",		true,	"Eirin");
	settings.Add("SplitKaguya",		true,	"Kaguya");
	settings.Add("SplitMokou",		true,	"Mokou");
	settings.Add("SplitNitori",		true,	"Nitori");
	settings.Add("SplitAya",		true,	"Aya");
	settings.Add("SplitSanae",		true,	"Sanae");
	settings.Add("SplitKanako",		true,	"Kanako");
	settings.Add("SplitSuwako",		true,	"Suwako");
	settings.Add("SplitGameover",	true,	"Game over");
}

update
{
	if(old.Flag != 223 && current.Flag == 223)
		vars.frames = 0;
	vars.frames++;
	return true;
}

split
{
	if(settings["SplitAlice"]		&&	!vars.triggeredSplits[0]	&&	old.RoomID == 161	&&	current.RoomID != 161)			{ return vars.triggeredSplits[0]  = true; }
	if(settings["SplitCirno"]		&&	!vars.triggeredSplits[1]	&&	old.RoomID == 252	&&	current.RoomID != 252)			{ return vars.triggeredSplits[1]  = true; }
	if(settings["SplitMeiling"]		&&	!vars.triggeredSplits[2]	&&	old.RoomID == 301	&&	current.RoomID != 301)			{ return vars.triggeredSplits[2]  = true; }
	if(settings["SplitPatchouli"]	&&	!vars.triggeredSplits[3]	&&	old.RoomID == 401	&&	current.RoomID != 401)			{ return vars.triggeredSplits[3]  = true; }
	if(settings["SplitSakuya"]		&&	!vars.triggeredSplits[4]	&&	old.RoomID == 671	&&	current.RoomID != 671)			{ return vars.triggeredSplits[4]  = true; }
	if(settings["SplitRemilia"]		&&	!vars.triggeredSplits[5]	&&	old.RoomID == 1131	&&	current.RoomID != 1131)			{ return vars.triggeredSplits[5]  = true; }
	if(settings["SplitYoumu"]		&&	!vars.triggeredSplits[6]	&&	old.RoomID == 921	&&	current.RoomID != 921)			{ return vars.triggeredSplits[6]  = true; }
	if(settings["SplitYuyuko"]		&&	!vars.triggeredSplits[7]	&&	old.RoomID == 1291	&&	current.RoomID != 1291)			{ return vars.triggeredSplits[7]  = true; }
	if(settings["SplitRumia"]		&&	!vars.triggeredSplits[8]	&&	old.RoomID == 91	&&	current.RoomID != 91)			{ return vars.triggeredSplits[8]  = true; }
	if(settings["SplitDaiyousei"]	&&	!vars.triggeredSplits[9]	&&	old.RoomID == 241	&&	current.RoomID != 241)			{ return vars.triggeredSplits[9]  = true; }
	if(settings["SplitFlandre"]		&&	!vars.triggeredSplits[10]	&&	old.RoomID == 1481	&&	current.RoomID != 1481)			{ return vars.triggeredSplits[10]  = true; }
	if(settings["SplitYukari"]		&&	!vars.triggeredSplits[11]	&&	current.YukariInParty == 1	&&	old.YukariInParty == 0)	{ return vars.triggeredSplits[11]  = true; }
	if(settings["SplitKeine"]		&&	!vars.triggeredSplits[12]	&&	old.RoomID == 512	&&	current.RoomID != 512)			{ return vars.triggeredSplits[12]  = true; }
	if(settings["SplitTewi"]		&&	!vars.triggeredSplits[13]	&&	old.RoomID == 1351	&&	current.RoomID != 1351)			{ return vars.triggeredSplits[13]  = true; }
	if(settings["SplitReisen"]		&&	!vars.triggeredSplits[14]	&&	old.RoomID == 1391	&&	current.RoomID != 1391)			{ return vars.triggeredSplits[14]  = true; }
	if(settings["SplitEirin"]		&&	!vars.triggeredSplits[15]	&&	old.RoomID == 1581	&&	current.RoomID != 1581)			{ return vars.triggeredSplits[15]  = true; }
	if(settings["SplitKaguya"]		&&	!vars.triggeredSplits[16]	&&	old.RoomID == 1631	&&	current.RoomID != 1631)			{ return vars.triggeredSplits[16]  = true; }
	if(settings["SplitMokou"]		&&	!vars.triggeredSplits[17]	&&	old.RoomID == 2101	&&	current.RoomID != 2101)			{ return vars.triggeredSplits[17]  = true; }
	if(settings["SplitNitori"]		&&	!vars.triggeredSplits[18]	&&	old.RoomID == 791	&&	current.RoomID != 791)			{ return vars.triggeredSplits[18]  = true; }
	if(settings["SplitAya"]			&&	!vars.triggeredSplits[19]	&&	old.RoomID == 1762	&&	current.RoomID != 1762)			{ return vars.triggeredSplits[19]  = true; }
	if(settings["SplitSanae"]		&&	!vars.triggeredSplits[20]	&&	old.RoomID == 1891	&&	current.RoomID != 1891)			{ return vars.triggeredSplits[20]  = true; }
	if(settings["SplitKanako"]		&&	!vars.triggeredSplits[21]	&&	current.KanakoInParty == 1	&&	old.KanakoInParty == 0)	{ return vars.triggeredSplits[21]  = true; }
	if(settings["SplitSuwako"]		&&	!vars.triggeredSplits[22]	&&	old.RoomID == 2201	&&	current.RoomID != 2201)			{ return vars.triggeredSplits[22]  = true; }
	if(settings["SplitGameover"]	&&	current.Flag == 223			&&	vars.frames == 137)										{ return true; }
	return false;
}