function love.load()
	require "controls"
	require "main_menu"
	require "entities"
	require "levels/level0"
	pause = true
	dead = false
	win = false
	all_parts_found = false
	audio_killed = false
	background_sounds[1]:play()
end

function love.keypressed(key, scancode, isrepeat)
	if key == pause_button then pause = not pause end
	if key == exit_button then love.event.quit() end
end

function love.update(dt)
	rotation = rotation + dt
	if not dead and not win then
		background_music()
		if not pause then
			update_animations(dt)
			move_player(dt, level_0["bedparts"])
			if not all_parts_found then check_all_parts_found(level_0["bedparts"])
			else check_win(level_0["bed_area"]) end
			move_enemies(dt)
		end
	end
end

function love.draw()
	if win then	show_win_menu()
	elseif dead then show_death_menu()
	elseif pause then show_menu()
	else
		move_camera()
		if all_parts_found then love.graphics.draw(level_0["tip2"],math.floor(player.x/width)*width+20, math.floor(player.y/height)*height+20)
		else love.graphics.draw(level_0["tip1"],math.floor(player.x/width)*width+20, math.floor(player.y/height)*height+20) end
		love.graphics.setBackgroundColor(0.3, 0.3, 0.3)
		love.graphics.draw(level_0["canvas"], 0, 0)
		--love.graphics.draw(level_0["title"])
		for i,enemy in ipairs(enemies) do
			love.graphics.setColor(tonumber(enemy.r), tonumber(enemy.g), tonumber(enemy.b))
			love.graphics.draw(enemy.anim, love.graphics.newQuad(math.floor(enemy.anim_frame) * enemy.width, 0, enemy.width, enemy.height, enemy.anim:getWidth(), enemy.anim:getHeight()), enemy.x, enemy.y)
		end
		for i,bed_part in ipairs(level_0["bedparts"]) do
			love.graphics.setColor(tonumber(bed_part.r), tonumber(bed_part.g), tonumber(bed_part.b))
			if (bed_part.found == false) then
				love.graphics.rectangle("fill",bed_part.x, bed_part.y, bed_part.width, bed_part.height)
			end
		end
		for i,bed_part in ipairs(level_0["under_bed"]) do
			love.graphics.setColor(tonumber(bed_part.r), tonumber(bed_part.g), tonumber(bed_part.b))
			love.graphics.rectangle("fill",bed_part.player_x+player.x, bed_part.player_y+player.y, bed_part.width, bed_part.height)
		end
		love.graphics.setColor(tonumber(player.r), tonumber(player.g), tonumber(player.b))
		love.graphics.rectangle("fill",player.x, player.y, player.width, player.height)
		for i,bed_part in ipairs(level_0["over_bed"]) do
			love.graphics.setColor(tonumber(bed_part.r), tonumber(bed_part.g), tonumber(bed_part.b))
			love.graphics.rectangle("fill",bed_part.player_x+player.x, bed_part.player_y+player.y, bed_part.width, bed_part.height)
		end
		if all_parts_found then
			love.graphics.setColor(tonumber(level_0["bed_area"].r), tonumber(level_0["bed_area"].g), tonumber(level_0["bed_area"].b))
			love.graphics.rectangle("fill", level_0["bed_area"].x, level_0["bed_area"].y, level_0["bed_area"].width, level_0["bed_area"].height)
		end
		love.graphics.setColor(1,1,1)
	end
end
