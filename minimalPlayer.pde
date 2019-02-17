import ddf.minim.*;

ArrayList<String> playlist = new ArrayList<String>();
Minim minim;
AudioPlayer audioPlayer;

public void setup(){

  size(520,60);
  minim = new Minim(this);
  Configuration configuration = new Configuration();
  explore(new File(configuration.getProperty("library.path")));
  textSize(14);

  playRandomSong();

}

public void draw(){
}

//Busca todos los directorios y archivos
public void explore(File file)  {
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
        if (subfiles[i].isDirectory()) {
            explore(subfiles[i]);
        }
        if (subfiles[i].isFile()) {
            if(subfiles[i].getAbsolutePath().contains("mp3")){
                playlist.add(subfiles[i].getAbsolutePath());
            }
        }
    }
}

public void playRandomSong(){
    background(255);
    int randomNumber = (int)random(0,playlist.size() - 1);
    fill(#7E7E7E);
    File song = new File(playlist.get(randomNumber));
    text(song.getName(),10,30);
    audioPlayer = minim.loadFile(playlist.get(randomNumber));
    audioPlayer.play();
}


public void mouseClicked(){
    audioPlayer.pause();
    playRandomSong();
}
