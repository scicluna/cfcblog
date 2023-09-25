component {

    public boolean function login(user){
        try{
        fetchedUser = queryExecute(
            "
            SELECT
                *
            FROM
                users
            WHERE (
                username = :username
            AND
                password = :password)
            ",
            {
                username: user.getUserName(),
                password: user.getPassword()
            },
            {datasource: "cfblog"})
            
            session.userId = fetchedUser.id
            return true;
        } catch (Any e){
            return false;
        }
    } 

    public void function logout(){
        structDelete(session, "userId");
    }

    public boolean function register(user){
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
                newUser = queryExecute(
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
                {datasource: "cfblog"})

                newUserIdQuery = queryExecute(
                    "SELECT LAST_INSERT_ID() AS newId",
                    {},
                    {datasource: "cfblog"}
                );
             
             session.userId = newUserIdQuery.newId
             return true;
            } catch (Any e){
                return false;
            }
        }
    }

    public boolean function isLoggedIn(){
        return structKeyExists(session, "userId");
    }

}