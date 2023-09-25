<cfscript>
    blogService = new cfcblog.controllers.BlogService()
    userId = session.userId 

    blogPosts = blogService.getPosts()
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
        <cfif blogPosts.recordCount gt 0>
            <cfoutput>
                <cfloop query="blogPosts">
                    <div class="flex flex-col">
                        <h1>#blogPosts.title#</h1>
                        <div class="flex justify-between">
                            <div class="flex gap-4">
                                <h4>#blogPosts.date#</h4>
                                <h4>#blogPosts.category#</h4>
                            </div>
                            <div class="flex gap-4">
                                <form action="./views/editpost.cfm" method="GET">
                                    <input name="id" type="hidden" value="#blogPosts.id#"/>
                                    <button type="submit">Edit</button>
                                </form>
                                <form action="./controllers/deletepost.cfm" method="POST">
                                    <input name="id" type="hidden" value="#blogPosts.id#"/>
                                    <button type="submit">Delete</button>
                                </form>
                            </div>
                        </div>
                </cfloop>
            </cfoutput>
            <cfelse>
            <p>No blog posts yet...</p>    
        </cfif>
    </main>
</body>
</html>


