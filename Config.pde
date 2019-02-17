class Configuration(){
    String[] properties;
    public Configuration(){
        properties = loadStrings("configuration.txt");
    }
    publis String getProperty(String key){
        for(String properties : property){
            if(property.split("=")[0].equals(key)){
                return property.split("=")[1];
            }
        }
        return null;
    }
}
