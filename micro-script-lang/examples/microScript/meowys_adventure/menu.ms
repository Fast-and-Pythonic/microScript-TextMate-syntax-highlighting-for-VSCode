initMenu = function()
  menu = object
    items = []
    cursor = 0
    show_controls = false
  end
end



pauseGame = function(new_game)
  paused = true
  menu.cursor = 0
  if mode == 2 then
    overlay_alpha_target = 0.9

  else 
    overlay_alpha_target = 0.75

  end
end

unpauseGame = function()
  paused = false
  overlay_alpha_target = 0
end

updateMenu = function()
  menu.items = []
  if mode == 1 and game_started then
    menu.items.push("Resume")
  end
  menu.items.push("New Game")
  menu.items.push("Story & Controls")
  
  if show_timer then
    menu.items.push("Hide Timer")
  else
    menu.items.push("Show Timer")
  end



  // stop certain animations during menu
  sprites["cat_run"].setFrame(1)
  sprites["cat_idle"].setFrame(0)
  sprites["cat_climb"].setFrame(0)
  
  // return from story & controls screen to regular menu
  if menu.show_controls then
    if keyboard.press.ENTER or keyboard.press.ESCAPE or gamepad.press.A then
      menu.show_controls = false
      overlay_alpha_target = 0.75
      return
    end
  // handle regular menu input  
  else
    if keyboard.press.ESCAPE and menu.items.contains("Resume") then
      unpauseGame()
      return
    elsif keyboard.press.ENTER or gamepad.press.A then
      processMenuRequest(menu.items[menu.cursor])
    elsif keyboard.press.DOWN or gamepad.press.DOWN then
      menu.cursor += 1
      if menu.cursor >= menu.items.length then
        menu.cursor = 0
      end
    elsif keyboard.press.UP or gamepad.press.UP then
      menu.cursor -= 1
      if menu.cursor < 0  then
        menu.cursor = menu.items.length - 1
      end
    end
  end
end

drawMenu = function()
  // draw the story and controls panel if selected
  if menu.show_controls then
    drawGameControls()
  // draw the menu, modifying size, transparency etc based on the selected item
  else
    screen.drawText("Meowy's Adventure", 0, 60, 30, "#FFF")
    local i = 0
    for item in menu.items
      if i == menu.cursor then
        screen.setAlpha(1)
        local size = 22
      else
        screen.setAlpha(0.6)
        local size = 20
      end
      screen.drawText(item, 0, 25 - 25 * i, size, "#FFF")
      screen.setAlpha(1)
      i += 1
    end
    // draw arrow to show the currently selected item
    local y_offset = -menu.cursor * 25 + 25
    local x_offset = -10 - screen.textWidth(menu.items[menu.cursor], 22) / 2
    screen.fillPolygon(x_offset, y_offset, x_offset - 10, y_offset + 5, x_offset - 10, y_offset - 5)
  end
end

// deal with a menu item being selected by the player
processMenuRequest = function(request)
  if request == "Resume" then unpauseGame()
  elsif request == "New Game" then
    init()
    unpauseGame()
    game_started = true
  elsif request == "Story & Controls" then
    menu.show_controls = true
    overlay_alpha_target = 0.85
  elsif request == "Show Timer" then
    show_timer = true
  elsif request == "Hide Timer" then
    show_timer = false
  end
end



// draw the 'story & controls' section if selected
drawGameControls = function()
  local controls = [
    "Meowy has fallen asleep and is trapped in a dream world.",
    "Guide Meowy back home by finding the purple grapes",
    "on each of the four levels."
    "Use the WASD or Arrow Keys to move/jump using the keyboard,",
    "or use use the Dpad/stick and A button on a gamepad."
    "Press Escape or Start to see the menu at any time."
    "Good luck!"
  ]
  // draw text
  local i = 0
  for line in controls 
    screen.drawText(line, 0, 60 - i, 12, "#FFF")
    i += 20
  end
  screen.drawText("Press Enter/gamepad A to return.", 90, -80, 8, "#FFF")
end

