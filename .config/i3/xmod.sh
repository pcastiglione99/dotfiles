#!/bin/bash
xmodmap -e "pointer = 1 2 3 5 4 6 7 8 9 10"
xmodmap -e "keycode 34 = bracketleft braceleft bracketleft braceleft"
xmodmap -e "keycode 35 = bracketright braceright bracketright braceright"
xmodmap -e 'keycode 90='
