state("gnazo", "v1.0")
{
    uint ReimuInParty:		"gnazo.exe",	0x0853400;
    uint AliceInParty:		"gnazo.exe",	0x0853458;
    uint CirnoInParty:		"gnazo.exe",	0x0853484;
    uint MeilingInParty:	"gnazo.exe",	0x08534B0;
    uint PatchouliInParty:	"gnazo.exe",	0x08534DC;
    uint SakuyaInParty: 	"gnazo.exe",	0x0853508;
    uint RemiliaInParty:	"gnazo.exe",	0x0853534;
    uint YoumuInParty:		"gnazo.exe",	0x0853560;
    uint YuyukoInParty:		"gnazo.exe",	0x085358C;
    uint RumiaInParty:		"gnazo.exe",	0x08535B8;
    uint DaiyouseiInParty:	"gnazo.exe",	0x08535E4;
    uint FlandreInParty:	"gnazo.exe",	0x0853610;
    uint YukariInParty:		"gnazo.exe",	0x085363C;
    uint KeineInParty:		"gnazo.exe",	0x0853668;
    uint TewiInParty:		"gnazo.exe",	0x0853694;
    uint ReisenInParty:		"gnazo.exe",	0x08536C0;
    uint EirinInParty:		"gnazo.exe",	0x08536EC;
    uint KaguyaInParty:		"gnazo.exe",	0x0853718;
    uint MokouInParty:		"gnazo.exe",	0x0853744;
    uint NitoriInParty:		"gnazo.exe",	0x0853770;
    uint AyaInParty:		"gnazo.exe",	0x085379C;
    uint SanaeInParty:		"gnazo.exe",	0x08537C8;
    uint KanakoInParty:		"gnazo.exe",	0x08537F4;
    uint SuwakoInParty:		"gnazo.exe",	0x0853820;
    byte Flag:				"gnazo.exe",	0x0409776;
}

state("gnazo", "v1.01")
{
    uint ReimuInParty:		"gnazo.exe",	0x0854400;
    uint AliceInParty:		"gnazo.exe",	0x0854458;
    uint CirnoInParty:		"gnazo.exe",	0x0854484;
    uint MeilingInParty:	"gnazo.exe",	0x08544B0;
    uint PatchouliInParty:	"gnazo.exe",	0x08544DC;
    uint SakuyaInParty: 	"gnazo.exe",	0x0854508;
    uint RemiliaInParty:	"gnazo.exe",	0x0854534;
    uint YoumuInParty:		"gnazo.exe",	0x0854560;
    uint YuyukoInParty:		"gnazo.exe",	0x085458C;
    uint RumiaInParty:		"gnazo.exe",	0x08545B8;
    uint DaiyouseiInParty:	"gnazo.exe",	0x08545E4;
    uint FlandreInParty:	"gnazo.exe",	0x0854610;
    uint YukariInParty:		"gnazo.exe",	0x085463C;
    uint KeineInParty:		"gnazo.exe",	0x0854668;
    uint TewiInParty:		"gnazo.exe",	0x0854694;
    uint ReisenInParty:		"gnazo.exe",	0x08546C0;
    uint EirinInParty:		"gnazo.exe",	0x08546EC;
    uint KaguyaInParty:		"gnazo.exe",	0x0854718;
    uint MokouInParty:		"gnazo.exe",	0x0854744;
    uint NitoriInParty:		"gnazo.exe",	0x0854770;
    uint AyaInParty:		"gnazo.exe",	0x085479C;
    uint SanaeInParty:		"gnazo.exe",	0x08547C8;
    uint KanakoInParty:		"gnazo.exe",	0x08547F4;
    uint SuwakoInParty:		"gnazo.exe",	0x0854820;
    byte Flag:				"gnazo.exe",	0x040A776;
}

init
{
	if (modules.First().ModuleMemorySize == 0xBCC000)
        version = "v1.0";
    else if (modules.First().ModuleMemorySize == 0xBCD000)
        version = "v1.01";

	//print("modules.First().ModuleMemorySize: " + modules.First().ModuleMemorySize.ToString());
	//print("version: " + version);

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
	if(settings["SplitAlice"]		&&	!vars.triggeredSplits[0]	&&	current.AliceInParty == 1		&&	old.AliceInParty == 0)		{ return vars.triggeredSplits[0]  = true; }
	if(settings["SplitCirno"]		&&	!vars.triggeredSplits[1]	&&	current.CirnoInParty == 1		&&	old.CirnoInParty == 0)		{ return vars.triggeredSplits[1]  = true; }
	if(settings["SplitMeiling"]		&&	!vars.triggeredSplits[2]	&&	current.MeilingInParty == 1		&&	old.MeilingInParty == 0)	{ return vars.triggeredSplits[2]  = true; }
	if(settings["SplitPatchouli"]	&&	!vars.triggeredSplits[3]	&&	current.PatchouliInParty == 1	&&	old.PatchouliInParty == 0)	{ return vars.triggeredSplits[3]  = true; }
	if(settings["SplitSakuya"]		&&	!vars.triggeredSplits[4]	&&	current.SakuyaInParty == 1		&&	old.SakuyaInParty == 0)		{ return vars.triggeredSplits[4]  = true; }
	if(settings["SplitRemilia"]		&&	!vars.triggeredSplits[5]	&&	current.RemiliaInParty == 1		&&	old.RemiliaInParty == 0)	{ return vars.triggeredSplits[5]  = true; }
	if(settings["SplitYoumu"]		&&	!vars.triggeredSplits[6]	&&	current.YoumuInParty == 1		&&	old.YoumuInParty == 0)		{ return vars.triggeredSplits[6]  = true; }
	if(settings["SplitYuyuko"]		&&	!vars.triggeredSplits[7]	&&	current.YuyukoInParty == 1		&&	old.YuyukoInParty == 0)		{ return vars.triggeredSplits[7]  = true; }
	if(settings["SplitRumia"]		&&	!vars.triggeredSplits[8]	&&	current.RumiaInParty == 1		&&	old.RumiaInParty == 0)		{ return vars.triggeredSplits[8]  = true; }
	if(settings["SplitDaiyousei"]	&&	!vars.triggeredSplits[9]	&&	current.DaiyouseiInParty == 1	&&	old.DaiyouseiInParty == 0)	{ return vars.triggeredSplits[9]  = true; }
	if(settings["SplitFlandre"]		&&	!vars.triggeredSplits[10]	&&	current.FlandreInParty == 1		&&	old.FlandreInParty == 0)	{ return vars.triggeredSplits[10]  = true; }
	if(settings["SplitYukari"]		&&	!vars.triggeredSplits[11]	&&	current.YukariInParty == 1		&&	old.YukariInParty == 0)		{ return vars.triggeredSplits[11]  = true; }
	if(settings["SplitKeine"]		&&	!vars.triggeredSplits[12]	&&	current.KeineInParty == 1		&&	old.KeineInParty == 0)		{ return vars.triggeredSplits[12]  = true; }
	if(settings["SplitTewi"]		&&	!vars.triggeredSplits[13]	&&	current.TewiInParty == 1		&&	old.TewiInParty == 0)		{ return vars.triggeredSplits[13]  = true; }
	if(settings["SplitReisen"]		&&	!vars.triggeredSplits[14]	&&	current.ReisenInParty == 1		&&	old.ReisenInParty == 0)		{ return vars.triggeredSplits[14]  = true; }
	if(settings["SplitEirin"]		&&	!vars.triggeredSplits[15]	&&	current.EirinInParty == 1		&&	old.EirinInParty == 0)		{ return vars.triggeredSplits[15]  = true; }
	if(settings["SplitKaguya"]		&&	!vars.triggeredSplits[16]	&&	current.KaguyaInParty == 1		&&	old.KaguyaInParty == 0)		{ return vars.triggeredSplits[16]  = true; }
	if(settings["SplitMokou"]		&&	!vars.triggeredSplits[17]	&&	current.MokouInParty == 1		&&	old.MokouInParty == 0)		{ return vars.triggeredSplits[17]  = true; }
	if(settings["SplitNitori"]		&&	!vars.triggeredSplits[18]	&&	current.NitoriInParty == 1		&&	old.NitoriInParty == 0)		{ return vars.triggeredSplits[18]  = true; }
	if(settings["SplitAya"]			&&	!vars.triggeredSplits[19]	&&	current.AyaInParty == 1			&&	old.AyaInParty == 0)		{ return vars.triggeredSplits[19]  = true; }
	if(settings["SplitSanae"]		&&	!vars.triggeredSplits[20]	&&	current.SanaeInParty == 1		&&	old.SanaeInParty == 0)		{ return vars.triggeredSplits[20]  = true; }
	if(settings["SplitKanako"]		&&	!vars.triggeredSplits[21]	&&	current.KanakoInParty == 1		&&	old.KanakoInParty == 0)		{ return vars.triggeredSplits[21]  = true; }
	if(settings["SplitSuwako"]		&&	!vars.triggeredSplits[22]	&&	current.SuwakoInParty == 1		&&	old.SuwakoInParty == 0)		{ return vars.triggeredSplits[22]  = true; }
	if(settings["SplitGameover"]	&&	current.Flag == 223			&&	vars.frames == 137)												{ return true; }
	return false;
}