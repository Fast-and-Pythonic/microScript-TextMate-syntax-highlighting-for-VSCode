check_go_wait_ticks = function(xy, step)
   wait = 2
   xy.toLowerCase()
   if player.go_wait_ticks >= wait then
      player[xy] += step
      player.go_wait_ticks = 0
      print(xy)
   else
      player.go_wait_ticks += 1
   end
end

// step("up", "y", +1)

move = function(button, xy, step)
   
   wait_before_repeat = 20
   
   big_but = button.toUpperCase()
   lit_but = button.toLowerCase()
   
   // 1 - Начальное нажатие
   // up Start
   if keyboard.press[big_but] then
      keyboardd[lit_but + "_pressed"] = true
      player[xy] += step
      print(big_but[0] + " START")
   
   // 2 - Держу. Стою и жду маленько, перед началом повторяющегося движения.
   // up Wait
   elsif keyboard[big_but] == true and keyboardd[lit_but + "_pressed"] == true and keyboardd[lit_but + "_pressed_tick_count"] < wait_before_repeat then
      keyboardd[lit_but + "_pressed_tick_count"] += 1
      print(big_but[0] + " WAITE " + keyboardd[lit_but + "_pressed_tick_count"])
   
   // 3 - Держу. Пошло повторяющееся дживение.
   // up Right
   elsif keyboard[big_but] and keyboardd[lit_but + "_pressed"] == true and keyboardd[lit_but + "_pressed_tick_count"] >= wait_before_repeat then
      keyboardd[lit_but + "_pressed"] = true
      check_go_wait_ticks(xy, step)
      print(big_but[0] + " REPEAT")
   
   // 4 - Кнопка отпущена
   // up End
   elsif keyboard.release[big_but] then
      keyboardd[lit_but + "_pressed"] = false
      keyboardd[lit_but + "_pressed_tick_count"] = 0
      player.go_wait_ticks = 0
      print(big_but[0] + " END")
   
   // print("keyboardd[lit_but + "_pressed"] = " + keyboardd[lit_but + "_pressed"])
   
   end
end











go_up = function()
   
   // 1 - Начальное нажатие
   // up Start
   if keyboard.press.UP then
      // print("step = " + player.step)
      keyboardd.up_pressed = true
      player.y += player.step
      print("up S")
   
   // 2 - Держу. Стою и жду маленько, перед началом повторяющегося движения.
   // up Wait
   elsif keyboard.UP and keyboardd.up_pressed == true and keyboardd.up_pressed_tick_count < 15 then
      keyboardd.up_pressed_tick_count += 1
      print("up W " + keyboardd.up_pressed_tick_count)
   
   // 3 - Держу. Пошло повторяющееся дживение.
   // up Right
   elsif keyboard.UP and keyboardd.up_pressed == true and keyboardd.up_pressed_tick_count >= 15 then
      keyboardd.up_pressed = true
      check_go_wait_ticks()
      print("up R")
   
   // 4 - Когда кнопка отпущена
   // up End
   elsif keyboard.release.UP then
      keyboardd.up_pressed = false
      keyboardd.up_pressed_tick_count = 0
      player.go_wait_ticks = 0
      print("up E")
   
   end
end

go_down = function()
   
   // 1 - Начальное нажатие
   // down Start
   if keyboard.press.DOWN then
      // print("step = " + player.step)
      keyboardd.down_pressed = true
      player.y -= player.step
      print("down S")
   
   // 2 - Держу. Стою и жду маленько, перед началом повторяющегося движения.
   // down Wait
   elsif keyboard.DOWN and keyboardd.down_pressed == true and keyboardd.down_pressed_tick_count < 15 then
      keyboardd.down_pressed_tick_count += 1
      print("down W " + keyboardd.down_pressed_tick_count)
   
   // 3 - Держу. Пошло повторяющееся дживение.
   // down Right
   elsif keyboard.DOWN and keyboardd.down_pressed == true and keyboardd.down_pressed_tick_count >= 15 then
      keyboardd.down_pressed = true
      check_go_wait_ticks()
      print("down R")
   
   // 4 - Когда кнопка отпущена
   // down End
   elsif keyboard.release.DOWN then
      keyboardd.down_pressed = false
      keyboardd.down_pressed_tick_count = 0
      player.go_wait_ticks = 0
      print("down E")
   
   end
end

















