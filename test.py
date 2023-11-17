import svgwrite

# Create an SVG drawing
dwg = svgwrite.Drawing('computer_object.svg', profile='tiny')

# Define the rectangle dimensions and position
rect_x, rect_y = 50, 60  # Position
rect_width, rect_height = 100, 50  # Size

# Add a rectangle for the computer object
dwg.add(dwg.rect(insert=(rect_x, rect_y), size=(rect_width, rect_height), fill='lightgrey', stroke='black'))

# Add a label above the rectangle
label_text = "Computer"
label_x, label_y = rect_x, rect_y - 10  # Position the label above the rectangle
dwg.add(dwg.text(label_text, insert=(label_x, label_y), fill='black'))

# Save the SVG
dwg.save()
