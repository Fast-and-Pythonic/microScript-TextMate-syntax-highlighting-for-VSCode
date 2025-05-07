// keep a value within a set range
clamp = function(value, lower_limit, upper_limit)
  local val = max(value, lower_limit)
  val = min(val, upper_limit)
  return val
end

// calculate the grid position of a specific x value in the world
xpos_to_grid = function(x, map_columns, map_draw_width)
  local column_draw_width = map_draw_width / map_columns
  return floor((x + map_draw_width / 2) / column_draw_width)
end

// calculate the grid position of a specific y value in the world
ypos_to_grid = function(y, map_rows, map_draw_height)
  local row_draw_height = map_draw_height / map_rows
  return floor((y + map_draw_height / 2) / row_draw_height)
end

// discover the name of the sprite portion at an (x, y) position in the world
check_collision = function(x, y, map, map_draw_width, map_draw_height)
  local grid_x = floor((x + map_draw_width / 2) / (map_draw_width / maps[map].width))
  local grid_y = floor((y + map_draw_height / 2) / (map_draw_height / maps[map].height))
  return maps[map].get(grid_x, grid_y)
end

moveToward = function(current_value, target, amount)
  local new_value = 0
  if current_value == target then
    new_value = current_value
  elsif current_value < target then
    new_value = current_value + amount
    if new_value > target then new_value = target end
  elsif current_value > target then
    new_value = current_value - amount
    if new_value < target then new_value = target end  
  end
  return new_value
end

getFlashValue = function(seconds_per_flash = 1.5)
  return pow(cos(system.time()/1000*PI/seconds_per_flash), 2) * 0.6 + .4
end










