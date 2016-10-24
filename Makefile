mp-room-000.mp4: mp-room-000.pov mp-room-001.pov mp-room-002.pov mp-room-003.pov mp-room-000.ini
	povray mp-room-001.ini
	ffmpeg -f image2 -r 10 -i 'mp-room-000%2d.png' mp-room-000.mp4

mp-map.png: mp-map.pov mp-room-000.pov mp-room-001.pov mp-room-002.pov mp-room-003.pov
	povray -D -H960 -W1280 mp-map.pov

clean:
	rm *.png
