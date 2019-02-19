import ddf.minim.*;

ArrayList<String> playlist = new ArrayList<String>();
Minim minim;
AudioPlayer audioPlayer;
PFont boldFont;
PFont regularFont;
PImage backgroundImage;

public void setup(){

  size(570,140);
  minim = new Minim(this);
  Configuration configuration = new Configuration();
  explore(new File(configuration.getProperty("library.path")));

  textSize(14);
  boldFont = createFont("ConsolasBold.ttf",17);
  regularFont = loadFont("Consolas-15.vlw");
  backgroundImage = loadImage("background.png");

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
    image(backgroundImage,0,0);
    int randomNumber = (int)random(0,playlist.size() - 1);
    fill(245,240);
    File song = new File(playlist.get(randomNumber));
    audioPlayer = minim.loadFile(playlist.get(randomNumber));
    audioPlayer.play();

    textAlign(CENTER);
    textFont(boldFont);
    textSize(19);
    String songName = song.getName().length() > 45 ? song.getName().substring(0,45) + "..." : song.getName();
    text(songName,width/2,45);

    textFont(regularFont);
    textSize(15);
    text("Author: " + audioPlayer.getMetaData().author(),width/2,70);
    text("Album:" + audioPlayer.getMetaData().album(),width/2,90);
}


public void mouseClicked(){
    audioPlayer.pause();
    playRandomSong();
}

void showTimeLine(){                                                                                                                             
    int w = width;                                                                                                                             
    int h = 3;                                                                                                                               
    fill(55);
    noStroke();                                                                                                                              
    rect(0,110,w,h);                                                                                                           
    int leftTime = (audioPlayer.position() * w) / audioPlayer.length();                                                                                
    noStroke();                                                                                                                              
    fill(#E8E5E5);                                                                                                                           
    rect(0,110,leftTime ,h);                                                                                                   
}    

