initCamera = function()
  camera = object
    x = -312           // actual position of camera
    y = -156           
    target_x = -312    // target position being smoothly moved towards
    target_y = -156
    x_drag = 25     // the amount of movement the player has to make in each
    y_drag = 40     // before the camera is forced to follow  
    smoothing = 0.9 // how much the camera slows/smoothes its movement (range 0-1)
  end
end

updateCamera = function()
  // clamp camera target to player
  camera.target_x = clamp(camera.target_x, player.x - camera.x_drag, player.x + camera.x_drag)
  camera.target_y = clamp(camera.target_y, player.y - camera.y_drag, player.y + camera.y_drag)
  
  // overide if necessary to clamp camera target to level limits
  local x_limit = level.map_width / 2 - screen.width / 2
  local y_limit = level.map_height / 2 - screen.height / 2
  camera.target_x = clamp(camera.target_x, -x_limit, x_limit)
  camera.target_y = clamp(camera.target_y, -y_limit, y_limit)
  
  // move camera towards target smoothly
  camera.x += (camera.target_x - camera.x) * (1 - camera.smoothing)
  camera.y += (camera.target_y - camera.y) * (1 - camera.smoothing)
  
  // avoid extremely slow camera smoothing at the end of a move
  // as it creates weird pixel effects
  if abs(camera.target_x - camera.x) < 0.2 then
    camera.x = camera.target_x
  end
  if abs(camera.target_y - camera.y) < 0.2 then
    camera.y = camera.target_y
  end
  
end