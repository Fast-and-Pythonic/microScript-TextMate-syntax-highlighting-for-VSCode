init = function()
  initMenu()
  initPlayer()
  initCamera()
  initGameTimer()
  level_complete = false
  setLevel(1)
  respawnPlayer()
  mode = 1        // 1 - play, 2 - end screen
  game_started = false
  paused = true  // start on pause menu
  overlay_alpha_target = 0.75
end

update = function()
  // update the overlay fades
  overlay_alpha = moveToward(overlay_alpha, overlay_alpha_target, 0.05)
  
  if (keyboard.press.ESCAPE or gamepad.press.MENU) and (not paused) then
    pauseGame()
  elsif paused then
    updateMenu()
  elsif mode == 1 then
    updatePlayer()
    updateCamera()
    updateGameTimer()
    if level_complete then
      setLevel(level.number + 1)
      respawnPlayer()
    end
  end
end

draw = function()
  screen.clear()
  
  if mode == 1 then
    // draw background
    screen.drawMap("sky" + level.number, -camera.x / 3, -camera.y / 3, 640, 384)
    // draw level
    screen.drawMap(level.map_name, -camera.x, -camera.y, level.map_width, level.map_height)
    // draw player
    drawPlayer()
    // draw animated water
    local water1_height = sin(system.time()/1000) * 3
    local water2_height = sin(system.time()/347) * 1.5
    local water1_x_offset = (system.time() / 100) % 16
    local water2_x_offset = (system.time() / 72) % 16
    screen.drawMap("water" + level.number + "a", water1_x_offset - camera.x, -camera.y - 247 + water1_height, 70*16, 4*16)
    screen.drawMap("water" + level.number + "b", water2_x_offset - camera.x, -camera.y - 255 + water2_height, 70*16, 4*16)
  // draw ending scene
  elsif mode == 2 then
    screen.drawMap("end_sky", 0, 0, 400, 200)
    screen.drawMap("end_foreground", 0, -20, 400, 200)
    screen.drawSprite("cat_sit", 140, -20, 40, 40)
    drawEndingMessage()
  end
  drawGameTimer()
  // draw overlay
  screen.fillRect(0, 0, screen.width, screen.height, "rgba(0, 0, 0," + overlay_alpha + ")")
  // draw gameplay
  if paused then drawMenu() end
  
end


// HELPER FUNCTIONS

setLevel = function(num)
  overlay_alpha = 2.5 // will take time to begin fade in (at alpha values of below 1)
  overlay_alpha_target = 0
  if num == level_spawns.length then
    mode = 2
    adjustHighScore()
  else
    level.number = num
    level.map_name = "level" + num
    level.map = maps[level.map_name]
    level.map_width = level.map.width * level.map.block_width
    level.map_height = level.map.height * level.map.block_height
    level.spawn.x = level_spawns[num][0]
    level.spawn.y = level_spawns[num][1]
    player.facing = level_spawns[num][2]
  end
end

level_spawns = [
  0,
  [-470, -202, 1],
  [415, -202, -1],
  [-474, -10, 1],
  [-15, 6, -1]
]

drawEndingMessage = function()
  local message =[
    "Congratulations... you have guided Meowy",
    "back to the land of the living.",
    "Meowy is a little wiser for the adventure :-)"
  ]
  // draw shadow
  local i = 0
  for line in message
    screen.drawText(line, -21, 29 - i, 15, "#333")
    i += 20
  end
  // draw text
  i = 0
  for line in message 
    screen.drawText(line, -20, 30 - i, 15, "#FFF")
    i += 20
  end

end