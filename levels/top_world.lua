require "levels/room_builder"
walls={}
local width, height = love.graphics.getDimensions()
top_world = {}
top_world["rooms"] = {}
top_world["canvas"] = love.graphics.newCanvas(width*3, height*3)

-- hand gen for levels right now
top_world["rooms"][1] = {left=true, up=true, right=false, down=false, origin_x=0, origin_y=0} -- Your House
top_world["rooms"][2] = {left=false, up=true, right=true, down=false, origin_x=width, origin_y=0} -- Nook House
top_world["rooms"][3] = {left=true, up=true, right=true, down=false, origin_x=width*2, origin_y=0} -- Nook Farm
top_world["rooms"][4] = {left=true, up=false, right=false, down=false, origin_x=0, origin_y=height} -- Meadow
top_world["rooms"][5] = {left=false, up=false, right=false, down=false, origin_x=width, origin_y=height} -- Pond
top_world["rooms"][6] = {left=false, up=false, right=true, down=true, origin_x=width*2, origin_y=height} -- Mushrooms
top_world["rooms"][7] = {left=true, up=false, right=false, down=true, origin_x=0, origin_y=height*2} -- Trees
top_world["rooms"][8] = {left=false, up=false, right=false, down=true, origin_x=width, origin_y=height*2} -- Lamppost
top_world["rooms"][9] = {left=false, up=true, right=true, down=true, origin_x=width*2, origin_y=height*2} -- Demon Portal

-- item spawns
top_world["flowers"] = {
	{name="flower_1",x=0.3*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_2",x=0.3*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_3",x=0.3*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_4",x=0.3*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_5",x=0.6*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_6",x=0.6*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_7",x=0.6*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="flower_8",x=0.6*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true}
}

top_world["mushrooms"] = {
	{name="mushroom_1",x=0.3*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_2",x=0.3*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_3",x=0.3*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_4",x=0.3*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_5",x=0.6*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_6",x=0.6*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_7",x=0.6*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="mushroom_8",x=0.6*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true}
}

top_world["farm"] = {
	{name="dog",x=0.3*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_1",x=0.3*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_2",x=0.3*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_3",x=0.3*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_4",x=0.3*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_5",x=0.6*width-20,y=height+0.2*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_6",x=0.6*width-20,y=height+0.4*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_7",x=0.6*width-20,y=height+0.6*height-20,width=20,height=20,r=0,g=0,b=0,behind=true},
	{name="pineapple_8",x=0.6*width-20,y=height+0.8*height-20,width=20,height=20,r=0,g=0,b=0,behind=true}
}

-- static spawns
top_world["locations"]["player_house"] = { x = width+ 0.5*width - 225, y =height +0.5*height- 225, width = 225, height = 225, r = 0, g = 0, b = 0 }
top_world["locations"]["pond"] = { x = width+ 0.5*width - 225, y =height +0.5*height- 225, width = 225, height = 225, r = 0, g = 0, b = 0 }


for _,v in ipairs(top_world["rooms"]) do
	build_room(v.left, v.up, v.right, v.down, top_world["canvas"], v.origin_x, v.origin_y, walls)
end

for _, wall in ipairs(walls) do
	wall.old_x = wall.x
	wall.old_y = wall.y
end

-- Font Setup
level_font = love.graphics.newFont(24)
top_world["tip1_text"] = "Find the bed pieces!"
top_world["tip1_width"] = level_font:getWidth(top_world["tip1_text"])
top_world["tip2_text"] = "Find the bedroom!"
top_world["tip2_width"] = level_font:getWidth(top_world["tip2_text"])
top_world["tip1"] = love.graphics.newText(level_font, top_world["tip1_text"])
top_world["tip2"] = love.graphics.newText(level_font, top_world["tip2_text"])
