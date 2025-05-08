init = function()
   player = object
      size = 10
      x = 0
      y = 0
      wait_ticks_go = 2
      move = 20
      direction = 0
      prev_pos = false
      
      for i to 100
         // pass
      end
      "test"
      anim = object
         running = false
         x_or_y = false
         direct = false
         stage = false
         
         start = object
            x = false
            y = false
         end
         
         target = object
            x = false
            y = false
         end
      end
      
      move_anim = function()
         if player.anim.running == true then
            
            
         end
      end
   end
   
   world = object
      debug_tick = 0
      draw_debug_tick = 0
   end
   
   keyboardd = object
      UP_pressed = false
      DOWN_pressed = false
      RIGHT_pressed = false
      LEFT_pressed = false
      
      UP_pressed_tick_count = 0
      DOWN_pressed_tick_count = 0
      RIGHT_pressed_tick_count = 0
      LEFT_pressed_tick_count = 0
   end
   
end

update = function()
   // world.debug_tick += 1
   // check_tick_debug_info()
   // player.size = 10
   
   check_player_move()
   
   player.move_anim()
   
   // go_up()
   // go_down()
   // go_right()
   // go_left()
   
   check_border_cross()
end

draw = function()
   screen.clear()
   drawGrid(player.size)
   screen.drawSprite("sprite", player.x, player.y, player.size)
end



