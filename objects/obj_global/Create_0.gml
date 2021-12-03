global.move_speed = 2.5;
global.items_collected = 0;
global.talking = false;

global.spawn_x = room_width >> 1;
global.spawn_y = room_height >> 1;

global.win_timer = 120;

global.ian = 0;

global.rooms_visited = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270
}