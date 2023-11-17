#!/bin/bash

# Define the package name
PACKAGE_NAME="network_diagram_package"

# Create the package directory and subdirectories
mkdir -p "$PACKAGE_NAME/network_diagram"

# Create __init__.py
touch "$PACKAGE_NAME/network_diagram/__init__.py"

# Create network_diagram.py with the Python code
cat << EOF > "$PACKAGE_NAME/network_diagram/network_diagram.py"
import svgwrite

def create_computer_object(dwg, label, x, y):
    rect_width, rect_height = 200, 100
    label_height = 20
    label_font_size = 14
    label_margin = 5

    # Rectangle for the computer
    dwg.add(dwg.rect(insert=(x, y), size=(rect_width, rect_height),
                     fill='none', stroke='blue', stroke_width=2))

    # Label box width
    label_box_width = min(len(label) * label_font_size / 2 + label_margin, rect_width)

    # Label box
    dwg.add(dwg.rect(insert=(x, y - label_height),
                     size=(label_box_width, label_height),
                     fill='blue'))

    # Label text
    dwg.add(dwg.text(label, insert=(x + 5, y - 5),
                     fill='white', font_size=label_font_size))

    return x, y, rect_width, rect_height

def create_network_diagram(computer_labels, network_label):
    dwg = svgwrite.Drawing('network_diagram.svg', profile='tiny', size=(len(computer_labels) * 220 + 20, 400))
    x, y = 20, 50
    computers = []

    for label in computer_labels:
        computers.append(create_computer_object(dwg, label, x, y))
        x += 220  # Horizontal spacing

    # Network line properties
    network_stroke_width = 3
    network_label_height = 20
    network_label_width = 100

    # Draw vertical lines down from each computer
    for x1, y1, width1, height1 in computers:
        dwg.add(dwg.line(start=(x1 + width1 / 2, y1 + height1),
                         end=(x1 + width1 / 2, y1 + height1 + 50),
                         stroke='black', stroke_width=network_stroke_width))

    # Draw one horizontal line beneath all computers
    x_start = computers[0][0] + computers[0][2] / 2
    x_end = computers[-1][0] + computers[-1][2] / 2
    y_line = y + computers[0][3] + 50
    dwg.add(dwg.line(start=(x_start, y_line), end=(x_end, y_line), stroke='black', stroke_width=network_stroke_width))

    # Center the network label over the horizontal line
    network_label_x = (x_start + x_end) / 2 - network_label_width / 2
    network_label_y = y_line + 10

    # Label box for the network
    dwg.add(dwg.rect(insert=(network_label_x, network_label_y),
                     size=(network_label_width, network_label_height),
                     fill='blue'))

    # Network label text - centered
    text_x = network_label_x + (network_label_width - len(network_label) * 7) / 2  # Approximation for centering text
    dwg.add(dwg.text(network_label, insert=(text_x, network_label_y + 15),
                     fill='white', font_size=14))

    # Save the SVG
    dwg.save()

EOF

# Create README.md
cat << EOF > "$PACKAGE_NAME/README.md"
# Network Diagram Package

This package is used to create network diagrams with SVG.

## Installation

Run the following command to install:

\`\`\`
pip install network_diagram_package
\`\`\`

## Usage

\`\`\`python
import network_diagram

# Example usage
computer_labels = ['Computer 1', 'Computer 2', 'Computer 3', 'Computer 4', 'Computer 5']
network_label = 'my-network'
network_diagram.create_network_diagram(computer_labels, network_label)
\`\`\`
EOF

# Create LICENSE
cat << EOF > "$PACKAGE_NAME/LICENSE"
MIT License

Copyright (c) [year] [fullname]

Permission is hereby granted, free of charge, to any person obtaining a copy
# ... (rest of the MIT license text) ...
EOF

# Create setup.py
cat << EOF > "$PACKAGE_NAME/setup.py"
from setuptools import setup, find_packages

setup(
    name='network_diagram',
    version='0.1',
    packages=find_packages(),
    description='A simple network diagram generator',
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    author='Your Name',
    author_email='your.email@example.com',
    license='MIT',
    install_requires=[
        'svgwrite',
    ],
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
)
EOF

echo "Package $PACKAGE_NAME has been created."

