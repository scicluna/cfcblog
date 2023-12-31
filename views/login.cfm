<cfscript>
    authService = new cfcblog.controllers.AuthService()
    message = ""

    if (structKeyExists(form, "username") AND structKeyExists(form, "password")){

        user = new cfcblog.models.User(form.username, form.password)
        success = authService.login(user)

        if (!success){
            message = "Login failed"
        } else {
            message = "Login successful!";
            location('/cfcblog/index.cfm', false)
        }
    }
    
</cfscript>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/cfcblog/styles.css">
        <title>CFC BLOG</title>
    </head>
    <body>
        <form action="login.cfm" method="POST">
            <label>
                Username
                <input name="username" type="text" />
            </label>
            <label>
                Password
                <input name="password" type="text"/>
            </label>
            <button type="submit">Login</button>
        </form>
        <a href="/cfcblog/views/signup.cfm">signup</a>
    </body>
</html>