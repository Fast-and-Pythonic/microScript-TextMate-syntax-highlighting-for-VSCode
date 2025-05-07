show_timer = false

initGameTimer = function()
  game_timer = 0
end

updateGameTimer = function()
  game_timer += 1/60
end

drawGameTimer = function()
  if show_timer then
    // draw timer
    if game_timer < 3600 then
      screen.setDrawAnchor(-1, 0)
      screen.setAlpha(0.4)
      screen.fillRect(95, 90, 100, 20, "#000")
      screen.setAlpha(1)
      screen.drawText("Time  " + formatTime(game_timer), 100, 90, 10,"rgb(255, 255, 255)")
      screen.setDrawAnchor(0, 0)
    else
      screen.drawText("over 1 hour :-(", 130, 90, 10, "rgb(255, 255, 255)")
    end
    // draw record
    if paused or mode == 2 then
      screen.setDrawAnchor(-1, 0)
      screen.setAlpha(0.4)
      screen.fillRect(-178, 90, 80, 20, "#000")
      screen.setAlpha(1)
      if storage.get(record) == 0 then
        screen.drawText("No record yet.", -165, 90, 10,"rgb(255, 255, 255)")
      else
        screen.drawText("Record  " + formatTime(storage.get(record)), -165, 90, 10,"rgb(255, 255, 255)")
      end
      screen.setDrawAnchor(0, 0)
    end
  end
end

formatTime = function(time_val)
  // calculate record value
  local tenths = floor((time_val % 1) * 10)
  local seconds = floor(time_val) % 60
  if seconds < 10 then seconds = '0' + seconds end
  local minutes = floor(time_val / 60)
  return minutes + ":" + seconds + "." + tenths
end

adjustHighScore = function()
  if storage.get(record) == 0 or game_timer < storage.get(record) then
    storage.set(record, game_timer)
  end
end