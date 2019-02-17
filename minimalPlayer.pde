import ddf.minim.*;

ArrayList<String> playlist = new ArrayList<String>();
Minim minim;
AudioPlayer audioPlayer;
PFont font;

public void setup(){

  size(570,120);
  minim = new Minim(this);
  Configuration configuration = new Configuration();
  explore(new File(configuration.getProperty("library.path")));

  textSize(14);
  font = loadFont("Consolas-15.vlw");
  textFont(font,15);

  playRandomSong();

}

public void draw(){
    showTimeLine();
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
    background(25);
    int randomNumber = (int)random(0,playlist.size() - 1);
    fill(#7E7E7E);
    File song = new File(playlist.get(randomNumber));
    audioPlayer = minim.loadFile(playlist.get(randomNumber));
    audioPlayer.play();

    text(song.getName(),10,30);
    text("Author: " + audioPlayer.getMetaData().author(),10,50);
    text("Album:" + audioPlayer.getMetaData().album(),10,70);
}


public void mouseClicked(){
    audioPlayer.pause();
    playRandomSong();
}

void showTimeLine(){                                                                                                                             
    int w = 400;                                                                                                                             
    int h = 5;                                                                                                                               
    //fill(#F7F7F7);                                                                                                                           
    fill(55);
    noStroke();                                                                                                                              
    rect((width/2)-(w/2),95,w,h);                                                                                                           
    int leftTime = (audioPlayer.position() * w) / audioPlayer.length();                                                                                
    noStroke();                                                                                                                              
    fill(#E8E5E5);                                                                                                                           
    rect((width/2)-(w/2),95,leftTime ,h);                                                                                                   
}    
