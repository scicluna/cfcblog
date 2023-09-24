<cfscript>
    user = "bob"

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
        <cfif isDefined("user") OR trim(user) EQ "">
            <a href="/views/newpost" class="actionbutton">New Post</a>
        <cfelse>
            <a href="/views/login" class="actionbutton">Login</a>
        </cfif>
    </nav>
    <main class="mainbody">
        <!--- Loop over posts here --->
        <!--- Or display "no posts yet..." --->
    </main>
</body>
</html>


