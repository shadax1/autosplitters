state("koumajou2", "v1.02a")
{
    byte input: "koumajou2.exe", 0x0622334; //1: confirm is pressed - 0: confirm isn't pressed
    byte pauseFlag: "koumajou2.exe", 0x048A0C8; //0: game is paused - 255: can control sakuya
    byte idkFlag: "koumajou2.exe", 0x038A758; //this seems to be at 1 when you're alive and at 0 when you're dead/the scoreboard is on screen 
    int titleScreenFlagGameStart: "koumajou2.exe", 0x035A918; //different than 0 when cursor on Game Start
    int titleScreenFlagOther: "koumajou2.exe", 0x035A870; //different than 0 when cursor on anything else
    byte musicID: "koumajou2.exe", 0x028EE98;
    /*musicID possible values:
	x: stage x theme
	9: phantasm stage theme
	1x: stage x boss fight theme
	19: phantasm boss theme
	20: remilia 2's theme
	21: victory fanfare
	31: game start cutscene song
	32: subweapon select screen
	33: omake 1 & 2 scenes
	34: omake 3 & 4 scenes
	40: main game credits
	41: phantasm credits
	255: opening movie song/nothing (title screen)*/
}

state("koumajou2", "v1.02")
{
	byte input: "koumajou2.exe", 0x0611574;
	byte pauseFlag: "koumajou2.exe", 0x0298C10;
	byte idkFlag: "koumajou2.exe", 0x038E2B4;
	int titleScreenFlagGameStart: "koumajou2.exe", 0x035E324;
	int titleScreenFlagOther: "koumajou2.exe", 0x035E27C;
	byte musicID: "koumajou2.exe", 0x027E398;
}

init
{
	if (modules.First().ModuleMemorySize == 0x677000)
        version = "v1.02a";
    else if (modules.First().ModuleMemorySize == 0x665000)
        version = "v1.02";

	//print("modules.First().ModuleMemorySize: " + modules.First().ModuleMemorySize.ToString());
	//print("version: " + version);

	vars.frames = 0;
    refreshRate = 60;
}

start
{
	//starts when you hit confirm on the title screen with the cursor on Game Start
    if(current.musicID == 255 && current.input == 1 && current.titleScreenFlagGameStart != 0 && current.titleScreenFlagOther == 0)
		return true;
}

reset
{
	//resets when you go back to the title screen with the cursor on anything else than Game Start (Continue by default)
	if(current.musicID == 255 && current.titleScreenFlagOther != 0 && current.titleScreenFlagGameStart == 0)
	{
		return true;
	}
	return false;
}

startup
{
	settings.Add("SplitNotRemilia", true, "Other bosses");
	settings.Add("SplitRemilia", true, "Remilia");
}

update
{
	//as soon as the victory fanfare starts, count frames from 0
	if((old.musicID == 11 || 
		old.musicID == 12 || 
		old.musicID == 13 || 
		old.musicID == 14 || 
		old.musicID == 15 || 
		old.musicID == 16 || 
		old.musicID == 17) && 
		current.musicID == 21)
		vars.frames = 0;
	vars.frames++;
	return true;
}

split
{
	//split as soon as the victory fanfare starts and the local frame counter reaches 201 frames
	if(settings["SplitNotRemilia"] && current.musicID == 21 && vars.frames == 201)
	{
		return true;
	}

	if(settings["SplitRemilia"] && old.musicID == 20 && current.musicID != 20 && current.idkFlag == 0 && current.pauseFlag == 0)
	{
		return true;
	}

	return false;
}