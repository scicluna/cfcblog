component {

    function login(string username, string password){

    } 

    function logout(){

    }

    function register(user){
        userExists = queryExecute(
            "
            SELECT
                *
            FROM
                users
            WHERE
                username = :username
            ",
            {
                username: user.getUserName()
            },
            {datasource: "cfblog"})

        if (userExists.recordCount gt 0){
            return false;
        } else {
            try {
             queryExecute(
                "
                INSERT INTO
                users (username, password)
                VALUES
                (:username, :password)
                ",
                {
                    username: user.getUserName(),
                    password: user.getPassword()
                },
                {datasource: "cfblog"}
             )
             return true;
            } catch (Any e){
                return false;
            }
        }
    }

    function isLoggedIn(){

    }

}