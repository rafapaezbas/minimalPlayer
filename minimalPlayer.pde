import ddf.minim.*;

ArrayList<String> songs = new ArrayList<String>();
ArrayList<String> playlist = new ArrayList<String>();

Button buttons[] = new Button[8];


public void setup(){
  size(520,360);
  Configuration configration = new Configuration();
  explore(new File(configuration.getProperty("library.path")));
}

public void draw(){
}

//Busca todos los directorios y archivos
public void explore(File file) {
	File[] subfiles = file.listFiles();
	for (int i = 0; i < subfiles.length; i++) {
		if (subfiles[i].isDirectory()) {
			explore(subfiles[i]);
		}
                if (subfiles[i].isFile()) {
                    if(subfiles[i].getAbsolutePath.contains("mp3")){
                        songs.add(subfiles[i].getAbsolutePath());
                    }
                }
        }
}
