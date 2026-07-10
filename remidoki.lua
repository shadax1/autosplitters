process('remidoki.exe')

local old = {}
local current = {}
local main_module_size = getModuleSize()
local triggered_splits = {}

function startup()
    refreshRate = 60
    print("module size: " .. main_module_size)
end

function state()
    old.game_state = current.game_state
    old.floor_id = current.floor_id
    old.room_id = current.room_id
    old.west_junction_key = current.west_junction_key
    old.spear_the_gungnir = current.spear_the_gungnir
    old.training_room_key = current.training_room_key
    old.super_jump = current.super_jump
    old.dining_hall_key = current.dining_hall_key
    old.kitchen_key = current.kitchen_key
    old.entrance_key = current.entrance_key
    old.magic_room_key = current.magic_room_key
    old.fly = current.fly
    old.green_orb = current.green_orb
    old.red_orb = current.red_orb
    old.silver_orb = current.silver_orb
    old.demon_lord = current.demon_lord
    old.blue_orb = current.blue_orb
    old.purple_orb = current.purple_orb
    old.yellow_orb = current.yellow_orb
    old.study_key = current.study_key
    old.remilia_key = current.remilia_key

    current.game_state = readAddress("byte", 0x5D834C)
    current.floor_id = readAddress("byte", 0x5D891D)
    current.room_id = readAddress("byte", 0x5D891E)
    current.west_junction_key = readAddress("byte", 0x5D84F1)
    current.spear_the_gungnir = readAddress("byte", 0x5D891A)
    current.training_room_key = readAddress("byte", 0x5D84F2)
    current.super_jump = readAddress("byte", 0x5D8918)
    current.dining_hall_key = readAddress("byte", 0x5D84F3)
    current.kitchen_key = readAddress("byte", 0x5D84F4)
    current.entrance_key = readAddress("byte", 0x5D84F5)
    current.magic_room_key = readAddress("byte", 0x5D84F6)
    current.fly = readAddress("byte", 0x5D8919)
    current.green_orb = readAddress("byte", 0x5D84FB)
    current.red_orb = readAddress("byte", 0x5D84F7)
    current.silver_orb = readAddress("byte", 0x5D84FC)
    current.demon_lord = readAddress("byte", 0x5D891B)
    current.blue_orb = readAddress("byte", 0x5D84F8)
    current.purple_orb = readAddress("byte", 0x5D84FA)
    current.yellow_orb = readAddress("byte", 0x5D84F9)
    current.study_key = readAddress("byte", 0x5D84FD)
    current.remilia_key = readAddress("byte", 0x5D84FE)
end

function start()
    if old.game_state == 12 and current.game_state == 20 then --when going from title screen to map
        return true
    end
end

function split()
    if (old.west_junction_key == 0 and current.west_junction_key == 1 and triggered_splits[1] == nil) or
       (old.spear_the_gungnir == 0 and current.spear_the_gungnir == 1 and triggered_splits[2] == nil) or
       (old.training_room_key == 0 and current.training_room_key == 1 and triggered_splits[3] == nil) or
       (old.super_jump == 0        and current.super_jump == 1        and triggered_splits[4] == nil) or
       (old.dining_hall_key == 0   and current.dining_hall_key == 1   and triggered_splits[5] == nil) or
       (old.kitchen_key == 0       and current.kitchen_key == 1       and triggered_splits[6] == nil) or
       (old.entrance_key == 0      and current.entrance_key == 1      and triggered_splits[7] == nil) or
       (old.magic_room_key == 0    and current.magic_room_key == 1    and triggered_splits[8] == nil) or
       (old.fly == 0               and current.fly == 1               and triggered_splits[9] == nil) or
       (old.green_orb == 0         and current.green_orb == 1         and triggered_splits[10] == nil) or
       (old.red_orb == 0           and current.red_orb == 1           and triggered_splits[11] == nil) or
       (old.silver_orb == 0        and current.silver_orb == 1        and triggered_splits[12] == nil) or
       (old.demon_lord == 0        and current.demon_lord == 1        and triggered_splits[13] == nil) or
       (old.blue_orb == 0          and current.blue_orb == 1          and triggered_splits[14] == nil) or
       (old.purple_orb == 0        and current.purple_orb == 1        and triggered_splits[15] == nil) or
       (old.yellow_orb == 0        and current.yellow_orb == 1        and triggered_splits[16] == nil) or
       (old.study_key == 0         and current.study_key == 1         and triggered_splits[17] == nil) or
       (old.remilia_key == 0       and current.remilia_key == 1       and triggered_splits[18] == nil) or
       (current.floor_id == 2 and current.room_id == 3 and old.game_state == 20  and current.game_state == 230) or --from marisa fight to cutscene
       (current.floor_id == 2 and current.room_id == 3 and old.game_state == 230 and current.game_state == 200) then --from custscene to credits
        return true
    end

    if current.west_junction_key == 1 then triggered_splits[1]  = true end
    if current.spear_the_gungnir == 1 then triggered_splits[2]  = true end
    if current.training_room_key == 1 then triggered_splits[3]  = true end
    if current.super_jump == 1        then triggered_splits[4]  = true end
    if current.dining_hall_key == 1   then triggered_splits[5]  = true end
    if current.kitchen_key == 1       then triggered_splits[6]  = true end
    if current.entrance_key == 1      then triggered_splits[7]  = true end
    if current.magic_room_key == 1    then triggered_splits[8]  = true end
    if current.fly == 1               then triggered_splits[9]  = true end
    if current.green_orb == 1         then triggered_splits[10] = true end
    if current.red_orb == 1           then triggered_splits[11] = true end
    if current.silver_orb == 1        then triggered_splits[12] = true end
    if current.demon_lord == 1        then triggered_splits[13] = true end
    if current.blue_orb == 1          then triggered_splits[14] = true end
    if current.purple_orb == 1        then triggered_splits[15] = true end
    if current.yellow_orb == 1        then triggered_splits[16] = true end
    if current.study_key == 1         then triggered_splits[17] = true end
    if current.remilia_key == 1       then triggered_splits[18] = true end
end

function reset()
    --if returning to the title screen from either the map or a room -> reset the timer
    if (old.game_state == 20 and current.game_state == 10) or (old.game_state == 70 and current.game_state == 10) then
        triggered_splits = {}
        return true
    end
end

-- function update()
--     print("game_state: " .. current.game_state)
--     print(triggered_splits[1])
-- end

function isLoading()
    return true
end
