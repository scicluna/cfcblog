<cfscript>
    authService = new cfcblog.controllers.AuthService()
    message = ""

    if (structKeyExists(form, "username") AND structKeyExists(form, "password")){

        user = new cfcblog.models.User(form.username, form.password)
        userId = authService.register(user)

        if (!userId){
            message = "Registration failed"
        } else {
            message = "Registration successful!"
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
        <form action="signup.cfm" method="POST">
            <label>
                Username
                <input name="username" type="text" />
            </label>
            <label>
                Password
                <input name="password" type="text"/>
            </label>
            <button type="submit">Sign Up</button>
        </form>
        <a href="/cfcblog/views/login.cfm">login</a>
        <cfoutput>
            <p>#message#</p>
        </cfoutput>
    </body>
</html>