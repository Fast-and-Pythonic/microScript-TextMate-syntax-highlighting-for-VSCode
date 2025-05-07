// Movement = class
//   constructor = function(direction_key, player)
//       this.direction_key = direction_key
//       this.player = player
//       this.pressed = false
//       this.pressed_tick_count = 0
//       this.go_wait_ticks = 0
//   end
   
//   check_go_wait_ticks = function()
//       if player.go_wait_ticks >= 3 then
//         player.y += player.move
//         player.go_wait_ticks = 0
//       else
//         player.go_wait_ticks += 1
//       end
//   end
   
//   move = function()
//       if keyboard.press[this.direction_key] then
//         this.pressed = true
//         this.update_position()
//         print(this.direction_key + " S")
//       elsif keyboard[this.direction_key] and this.ppressed and this.pressed_tick_count < 15 then
//         this.pressed_tick_count += 1
//         print(this.direction_key + " W " + this.pressed_tick_count)
//       elsif keyboard[this.direction_key] and this.pressed and this.pressed_tick_count >= 15 then
//         this.pressed = true
//         this.check_go_wait_ticks()
//         print(this.direction_key + " R")
//       elsif keyboard.release[this.direction_key] then
//         this.pressed = false
//         this.pressed_tick_count = 0
//         this.go_wait_ticks = 0
//         print(this.direction_key + " E")
//       end
//   end

//   update_position = function()
//       // This method should be overridden in subclasses
//   end
// end

// Move_Up = class extends Movement
//   update_position = function()
//       this.player.y += this.player.move
//   end
// end

// // // Usage
// // player = {
// //    y = 0,
// //    move = 1
// // }

// // move_up = MoveUp("UP", player)

// // // In your game loop
// // move_up.move()