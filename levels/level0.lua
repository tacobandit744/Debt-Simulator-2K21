require "levels/room_builder"
walls={}
local width, height = love.graphics.getDimensions()
level_0 = {}
level_0["rooms"] = {}
level_0["canvas"] = love.graphics.newCanvas(width*3, height*3)

-- hand gen for levels right now
level_0["rooms"][1] = {left=true, up=true, right=false, down=false, origin_x=0, origin_y=0}
level_0["rooms"][2] = {left=false, up=true, right=false, down=false, origin_x=width, origin_y=0}
level_0["rooms"][3] = {left=false, up=true, right=true, down=true, origin_x=width*2, origin_y=0}
level_0["rooms"][4] = {left=true, up=false, right=false, down=true, origin_x=0, origin_y=height}
level_0["rooms"][5] = {left=false, up=false, rightfalse, down=false, origin_x=width, origin_y=height}
level_0["rooms"][6] = {left=false, up=true, right=true, down=false, origin_x=width*2, origin_y=height}
level_0["rooms"][7] = {left=true, up=true, right=false, down=true, origin_x=0, origin_y=height*2}
level_0["rooms"][8] = {left=false, up=false, right=false, down=true, origin_x=width, origin_y=height*2}
level_0["rooms"][9] = {left=true, up=false, right=true, down=true, origin_x=width*2, origin_y=height*2}

-- bed_parts
level_0["bedparts"] = {
	{name="sheet",x=80,y=200,player_x=0,player_y=5,player_rotation=0,width=25,height=20,behind=false,r=1,g=0,b=0,found=false},
	{name="pillow",x=1200,y=1000,player_x=-10,player_y=-5,width=45,height=15,r=0,g=0,b=0,behind=true,found=false},
	{name="mattress",x=2100,y=1400,player_x=-5,player_y=-5,width=35,height=45,r=0.5,g=0.5,b=0.3,behind=true,found=false},
	{name="blanket",x=100,y=1500,player_x=-5,player_y=8,width=35,height=20,r=0.8,g=0.1,b=0.5,behind=false,found=false}
}
level_0["over_bed"] = {}
level_0["under_bed"] = {}
level_0["bed_area"] = {x=1536-100,y=1152-100,width=100,height=100,r=1,g=1,b=1}

for i,v in ipairs(level_0["rooms"]) do
	build_room(v.left, v.up, v.right, v.down, level_0["canvas"], v.origin_x, v.origin_y, walls)
end

for i, wall in ipairs(walls) do
	wall.old_x = wall.x
	wall.old_y = wall.y
end

-- Font Setup
level_font = love.graphics.newFont(24)
level_0["tip1_text"] = "Find the bed pieces!"
level_0["tip1_width"] = level_font:getWidth(level_0["tip1_text"])
level_0["tip2_text"] = "Find the bedroom!"
level_0["tip2_width"] = level_font:getWidth(level_0["tip2_text"])
level_0["tip1"] = love.graphics.newText(level_font, level_0["tip1_text"])
level_0["tip2"] = love.graphics.newText(level_font, level_0["tip2_text"])
