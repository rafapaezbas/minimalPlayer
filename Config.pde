class Configuration{
    String[] properties;
    public Configuration(){
        properties = loadStrings("configuration.txt");
    }
    public String getProperty(String key){
        for(String property : properties){
            if(property.split("=")[0].equals(key)){
                return property.split("=")[1];
            }
        }
        return null;
    }
}
