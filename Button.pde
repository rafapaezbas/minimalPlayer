class Button {

	int x;
	int y;
	int w;
	int h;
	String name;
	int selectionColor = color(255, 255, 255, 125);
	int labelColor = color (0, 0, 0);
	int id;
	File song;

	Button(int x_, int y_, int w_, int h_, String song_, color labelColor_, color selectionColor_, int id_) {
		x = x_;
		y = y_;
		w = w_;
		h = h_;
		song = new File(song_);
		name = song.getName();
		name = this.shortName(this.name);
		labelColor = labelColor_;
		selectionColor = selectionColor_;
		id = id_;
	}

	void display() {
		int xOffset = 15;
		int yOffset = 15;
		//fill(labelColor);
		fill(#7E7E7E);
		textSize(12);
		textAlign(LEFT, CENTER);
		text(name, x + xOffset, y + yOffset);
	}

	void checkSelection() {
		if (mouseX > x + 10 && mouseX < x + w - 10 && mouseY > y && mouseY < y + 20) {  //No detecta colision en toda la altura, solo 20 px
			fill(#E8E5E5);
			noStroke();
			rectMode(CORNER);
			rect(x, y, w, h);
			if (mousePressed && !mouseLocked && mouseButton == LEFT) {
				mouseLocked = true;
				if (player.isPlaying()) {
					player.pause();
					minim.stop();
				}
				if(minim.loadFile(playlist[this.id + playlistPosition * 8]) != null){ // Comprueba si la cancion puede cargarse
					player = minim.loadFile(playlist[this.id + playlistPosition * 8],4096);
				}
				player.play();
				meta = player.getMetaData();
				File actualSong = new File(playlist[this.id + playlistPosition * 8]);
				actualSongTitle = this.name; 
				playedSongs = addStringToArray(playedSongs,actualSong.getAbsolutePath());
				actualSongIndex = this.id + playlistPosition * 8; //Variable usada para autoplay
				//cambiar en windows!
				redRectAlpha = 0;
			}
		}
	}

	String shortName(String originalName){
		int maxNameLength = 30;
		if( originalName.length() < maxNameLength){
			return originalName;
		} else {
			println(originalName.substring(0,maxNameLength) + "...");
			return originalName.substring(0,maxNameLength) + "...";
		}
	}
}
