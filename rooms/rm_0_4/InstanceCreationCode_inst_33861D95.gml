if(global.items_collected < 4) {
	talk_text = [
		[
			"You found a capsule! Only " + (4 - global.items_collected) + " to go!",0
		]
	];
}
else {
	talk_text = [
		[
			"This is it, the last capsule! You might have just enough time, hurry back!",0
		]
	];
}