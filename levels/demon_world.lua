require "levels/room_builder"
walls={}
local width, height = love.graphics.getDimensions()
demon_world = {}
demon_world["rooms"] = {}
demon_world["canvas"] = love.graphics.newCanvas(width*3, height*3)

-- hand gen for levels right now
demon_world["rooms"][1] = {left=true, up=true, right=false, down=false, origin_x=0, origin_y=0} -- Tavern
demon_world["rooms"][2] = {left=false, up=true, right=false, down=false, origin_x=width, origin_y=0} -- Graveyard
demon_world["rooms"][3] = {left=false, up=true, right=true, down=false, origin_x=width*2, origin_y=0} -- Catland
demon_world["rooms"][4] = {left=true, up=false, right=false, down=false, origin_x=0, origin_y=height} -- Demon Bones
demon_world["rooms"][5] = {left=false, up=false, right=false, down=false, origin_x=width, origin_y=height} -- Fish Salesman
demon_world["rooms"][6] = {left=false, up=false, right=true, down=false, origin_x=width*2, origin_y=height} -- Mushroom Mycelium
demon_world["rooms"][7] = {left=true, up=false, right=false, down=true, origin_x=0, origin_y=height*2} -- Tree people
demon_world["rooms"][8] = {left=false, up=false, right=false, down=true, origin_x=width, origin_y=height*2} -- lamppost ghost
demon_world["rooms"][9] = {left=false, up=false, right=true, down=true, origin_x=width*2, origin_y=height*2} -- Demon portal

-- item spawns
demon_world["items"] = {
	{name="demon_bone_1",x=width/2,y=height+(height/8),width=75,height=20,r=0,g=0,b=0,behind=true},
	{name="demon_bone_2",x=width/2,y=height+(height/4),width=75,height=20,r=0,g=0,b=0,behind=true},
	{name="demon_bone_3",x=width/2,y=height+(3*height/8),width=75,height=20,r=0,g=0,b=0,behind=true},
	{name="demon_bone_4",x=width/2,y=height+(height/2),width=75,height=20,r=0,g=0,b=0,behind=true}
}
demon_world["catland"] = {} -- starts empty, nothing to steal
demon_world["fish"] = {
	{name="backpack",x=width+0.25*width,y=height+0.6*height,width=50,height=50,r=0,g=0,b=0,behind=true,cost=2000},
	{name="muzzle",x=width+0.75*width,y=height+0.6*height,width=50,height=50,r=0,g=0,b=0,behind=true,cost=200},
	{name="running_shoes",x=width+0.25*width,y=height+0.8*height,width=50,height=50,r=0,g=0,b=0,behind=true,cost=1000},
	{name="fertilizer",x=width+0.75*width,y=height+0.8*height,width=50,height=50,r=0,g=0,b=0,behind=true,cost=500}
}

-- static spawns
demon_world["locations"]["graveyard"] = {x=width+0.5*width-80,y=0.5*height-80,width=80,height=80,r=0,g=0,b=0}
demon_world["locations"]["trees"] = {
	{ x = 0.4 * width - 25, y = height * 2 + 0.4 * height - 25, width = 25, height = 25, r = 0, g = 0, b = 0 },
	{ x = 0.4 * width - 25, y = height * 2 + 0.6 * height - 25, width = 25, height = 25, r = 0, g = 0, b = 0 },
	{ x = 0.6 * width - 25, y = height * 2 + 0.4 * height - 25, width = 25, height = 25, r = 0, g = 0, b = 0 },
	{ x = 0.6 * width - 25, y = height * 2 + 0.6 * height - 25, width = 25, height = 25, r = 0, g = 0, b = 0 }
}
demon_world["locations"]["lamppost"] = {x=width+0.5*width-200,y=height*2+0.5*height-200,width=200,height=200,r=0,g=0,b=0}
demon_world["locations"]["tavern"] = {x=width*2+0.5*width-100,y=height*2+0.5*height-100,width=100,height=100,r=0,g=0,b=0}
demon_world["locations"]["portal"] = {x=width*2+0.5*width-100,y=height*2+0.5*height-100,width=100,height=100,r=0,g=0,b=0}
demon_world["locations"]["mycelium"] = {x=width*2+0.5*width-100,y=height+0.5*height-100,width=100,height=100,r=0,g=0,b=0}

for _,v in ipairs(demon_world["rooms"]) do
	build_room(v.left, v.up, v.right, v.down, demon_world["canvas"], v.origin_x, v.origin_y, walls)
end

for _, wall in ipairs(walls) do
	wall.old_x = wall.x
	wall.old_y = wall.y
end

-- Font Setup
level_font = love.graphics.newFont(64)
demon_world["tip1_text"] = "Pay back your debts!"
demon_world["tip1_width"] = level_font:getWidth(demon_world["tip1_text"])
demon_world["tip2"] = love.graphics.newText(level_font, demon_world["tip2_text"])

-- Ghost Tips
ghost_font = love.graphics.newFont(32)
ghost["text1"] = "Felines hate obnoxious noises..."
ghost["text1_width"] = level_font:getWidth(ghost["text1"])
ghost["text2"] = "Someone once tried to bury those old cursed bones..."
ghost["text2_width"] = level_font:getWidth(ghost["text2"])
ghost["text3"] = "The mushrooms love to be reunited with their family..."
ghost["text3_width"] = level_font:getWidth(ghost["text3"])
ghost["text4"] = "A fishy fellow is quite fond of their friends..."
ghost["text4_width"] = level_font:getWidth(ghost["text4"])
ghost["tip1"] = love.graphics.newText(ghost_font, ghost["text1"])
ghost["tip2"] = love.graphics.newText(ghost_font, ghost["text2"])
ghost["tip3"] = love.graphics.newText(ghost_font, ghost["text3"])
ghost["tip4"] = love.graphics.newText(ghost_font, ghost["text4"])