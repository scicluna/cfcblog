component {
    property string username;
    property string password; //hashed in reality, but not worrying about it here

    public any function init(string username, string password){
        setUserName(username)
        setPassword(password)
        return this;
    }

    public string function getUserName(){
        return username
    }

    public void function setUserName(string newName){
        username = newName
    }

    public string function getPassword(){
        return password
    }

    public void function setPassword(string newPassword){
        password = newPassword
    }
}