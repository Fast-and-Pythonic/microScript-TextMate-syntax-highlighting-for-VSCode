initPlayer = function()
   // simple player object - class not really needed
   player = object
      x = 0
      y = 0
      x_velocity = 0
      y_velocity = 0
      facing = 1
      top_speed = 2
      size = 16
      landed = true
      jump_velocity = 4.2
      max_fall_speed = 8
      acceleration = 0.4
      climbing_speed = 1
      climbing = false
      touching_vine = false
   end
end

if a > b or c < g
   
end

a = function()
   
end

updatePlayer = function()
   // detect whether climbing or not
   player.touching_vine = check_collision(
      player.x, 
      player.y, 
      level.map_name, 
      level.map_width, 
      level.map_height
   ).startsWith("vine")
   
   player.touching_ladder = check_collision(
      player.x, 
      player.y, 
      level.map_name, 
      level.map_width, 
      level.map_height
   ).startsWith("ladder")
   
   player.climbing = (player.touching_vine or player.touching_ladder) and (not player.landed)
   
   // process button input
   if player.climbing then
      player.x_velocity = 0
      if keyboard.LEFT or gamepad.LEFT then
         player.x_velocity -= player.climbing_speed / 3
      end
      
      if keyboard.RIGHT or gamepad.RIGHT then
         player.x_velocity += player.climbing_speed / 3
      end
      
      player.y_velocity = 0
      if keyboard.UP or gamepad.UP then
         player.y_velocity = player.climbing_speed
      end
      
      if keyboard.DOWN or gamepad.DOWN then
         player.y_velocity = -player.climbing_speed
      end
      // set the direction player is facing based on position on vine/ladder
      local vine_x_traversal = ((player.x + level.map_width / 2) / (level.map_width / level.map.width)) % 1
      if vine_x_traversal < 0.5 then player.facing = 1 else player.facing = -1 end
   
   else
      if keyboard.LEFT or gamepad.LEFT then
         player.facing = -1
         player.x_velocity -= player.acceleration
      end
      if keyboard.RIGHT or gamepad.RIGHT then
         player.facing = 1
         player.x_velocity += player.acceleration
      end
      
      // limit player to it's own top speed
      player.x_velocity = clamp(player.x_velocity, -player.top_speed, player.top_speed)
      
      // detect jump request
      if (keyboard.SPACE or keyboard.UP or gamepad.A) and player.landed then
         player.y_velocity = player.jump_velocity
      end
   end
   
   playerPhysics()
   
   // clamp player to the map area (on the x axis)
   player.x = clamp(player.x, -level.map_width / 2 + 8, level.map_width / 2 - 8)
   
   // check for level completion
   level_complete = check_collision(player.x, player.y, level.map_name, level.map_width, level.map_height).startsWith("goal")
end


drawPlayer = function()
   // flip sprite if facing left
   screen.setDrawScale(player.facing, 1)
   // written out with separte draw calls to allow for experimentation with draw sizes etc.
   if player.climbing then
      screen.drawSprite("cat_climb", player.x - camera.x, player.y - camera.y, player.size)
   elsif player.y_velocity > 0 then
      screen.drawSprite("cat_jump", player.x - camera.x, player.y - camera.y, player.size * 1.1)
   elsif player.y_velocity < 0 then
      screen.drawSprite("cat_idle", player.x - camera.x, player.y - camera.y, player.size)
   elsif abs(player.x_velocity) > 0.5 then
      screen.drawSprite("cat_run", player.x - camera.x, player.y - camera.y, player.size)
   else
      screen.drawSprite("cat_idle", player.x - camera.x, player.y - camera.y, player.size)
   end
   // reset to avoid flipping other draw calls
   screen.setDrawScale(1, 1)
end


playerPhysics = function()
   if not player.climbing then
      // x_velocity smoothing
      player.x_velocity *= 0.85
      if player.x_velocity > -0.05 and player.x_velocity < 0.05 then
         player.x_velocity = 0
      end
      
      // gravity
      player.y_velocity -= 0.2
      if player.y_velocity < -player.max_fall_speed then player.y_velocity = -player.max_fall_speed end
   end
   
   local map = level.map
   local hw = level.map_width / 2    // half level map width in pixels
   local hh = level.map_height / 2  // half level map height
   
   // define the map grid squares where each of the four corners of the invisible
   // hit box for the player is - both for current (old) position and 
   // desired new position based on velocity
   
   local old_top = floor((player.y + 4 + hh) / 16)
   local old_bottom = floor((player.y - 6 + hh) / 16)
   local old_right = floor((player.x + 4 + hw) / 16 - 0.001)
   local old_left = floor((player.x - 4 + hw) / 16)
   
   local new_top = floor((player.y + player.y_velocity + 4 + hh) / 16)
   local new_bottom = floor((player.y + player.y_velocity - 6 + hh) / 16)
   local new_right = floor((player.x + player.x_velocity + 4 + hw) / 16)
   local new_left = floor((player.x + player.x_velocity - 4 + hw) / 16)
   
   // falling
   if player.y_velocity < 0 and
      (map.get(old_left, new_bottom).startsWith("ground") or
      map.get(old_right, new_bottom).startsWith("ground")) then
      player.y = -hh + (new_bottom + 1) * 16 + 6
      player.y_velocity = 0
      player.landed = 1
   // jumping
   elsif player.y_velocity > 0 and
         (map.get(old_left, new_top).startsWith("ground") or
         map.get(old_right, new_top).startsWith("ground")) then
      player.y_velocity = 0
   else
      if not player.climbing then player.landed = 0 end
   end
   
   // moving left
   if player.x_velocity < 0 and
      (map.get(new_left, old_bottom).startsWith("ground") or
      map.get(new_left, old_top).startsWith("ground")) then
      player.x_velocity = 0
      player.x = -hw + (new_left+1) * 16 + 4
   // moving right
   elsif player.x_velocity > 0 and
         (map.get(new_right, old_bottom).startsWith("ground") or
         map.get(new_right, old_top).startsWith("ground")) then
      player.x_velocity = 0
      player.x = -hw + (new_right) * 16 - 4
   end
   
   // actually move the player
   player.x += player.x_velocity
   player.y += player.y_velocity
   
   // handle player falling off screen (always into the ocean and treated as a "death")
   if player.y < (-level.map_height/2 - 100) then
      respawnPlayer()
   end
end


respawnPlayer = function()
   player.x = level.spawn.x
   player.y = level.spawn.y
end



