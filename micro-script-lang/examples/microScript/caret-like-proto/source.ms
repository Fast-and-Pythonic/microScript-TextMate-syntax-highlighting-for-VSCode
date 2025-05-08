drawGrid = function(cell_size)
   width = screen.width
   height = screen.height
   
   x_steps = screen.width / cell_size
   y_steps = screen.height / cell_size
   
   screen.setLineWidth(0.5)
   
   x = -width
   for i = 0 to x_steps
      x += player.size
      screen.drawLine(x, -height, x, height, "grey")
   end
   
   y = -height
   for i = 0 to y_steps
      y += player.size
      screen.drawLine(-width, y, width, y, "grey")
   end
end



















