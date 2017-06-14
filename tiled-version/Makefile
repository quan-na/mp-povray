all: tiled-map.png

mp-map.png: mp-map.pov mp-room-000.pov mp-room-001.pov mp-room-002.pov mp-room-003.pov
	povray -D -H960 -W1280 mp-map.pov

tiled-map.png: tiled-map.pov room-000.pov room-002.pov room-002.pov room-003.pov room-004.pov
	povray -D -H768 -W1024 tiled-map.pov

route-000.mp4: tiled-map.png route-000.pov room-000.pov room-002.pov room-002.pov room-003.pov room-004.pov
	povray route-000.ini
	ffmpeg -f image2 -r 20 -i 'route-000%2d.png' route-000.mp4
	spd-say "Route zero finished rendering."

route-001.mp4: tiled-map.png route-001.pov room-000.pov room-002.pov room-002.pov room-003.pov room-004.pov
	povray route-001.ini
	ffmpeg -f image2 -r 20 -i 'route-001%3d.png' route-001.mp4
	spd-say "Route one finished rendering."

clean:
	rm -f *.png
	rm -f *.pov-state
