<cfscript>

    userId = session.userId 

    blogPosts = queryExecute(
        "
        SELECT
            *
        FROM
            blog
        ORDER BY
            date DESC;
        ",
        {},
        {datasource: "cfblog"}
    )
</cfscript>



<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>CFC BLOG</title>
</head>
<body>
    <nav class="navbar">
        <h1>CFC BLOG</h1>
        <cfif isDefined("userId")>
            <a href="/cfcblog/views/newpost.cfm" class="actionbutton">New Post</a>
        <cfelse>
            <a href="/cfcblog/views/login.cfm" class="actionbutton">Login</a>
        </cfif>
    </nav>
    <main class="mainbody">
        <!--- Loop over posts here --->
        <!--- Or display "no posts yet..." --->
    </main>
</body>
</html>


