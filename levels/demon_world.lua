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
-- TODO: Graveyard, Lamppost ghost, Tree People

-- location spawns
demon_world["locations"]["tavern"] = {x=width*2+0.5*width-100,y=height*2+0.5*height-100,width=100,height=100,r=0,g=0,b=0}
demon_world["locations"]["portal"] = {x=width*2+0.5*width-100,y=height*2+0.5*height-100,width=100,height=100,r=0,g=0,b=0}
demon_world["locations"]["mycelium"] = {x=width*2+0.5*width-100,y=height+0.5*height-100,width=100,height=100,r=0,g=0,b=0}

for i,v in ipairs(demon_world["rooms"]) do
	build_room(v.left, v.up, v.right, v.down, demon_world["canvas"], v.origin_x, v.origin_y, walls)
end

for i, wall in ipairs(walls) do
	wall.old_x = wall.x
	wall.old_y = wall.y
end

-- Font Setup
level_font = love.graphics.newFont(24)
demon_world["tip1_text"] = "Find the bed pieces!"
demon_world["tip1_width"] = level_font:getWidth(demon_world["tip1_text"])
demon_world["tip2_text"] = "Find the bedroom!"
demon_world["tip2_width"] = level_font:getWidth(demon_world["tip2_text"])
demon_world["tip1"] = love.graphics.newText(level_font, demon_world["tip1_text"])
demon_world["tip2"] = love.graphics.newText(level_font, demon_world["tip2_text"])
