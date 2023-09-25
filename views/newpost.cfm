<cfscript>
    message = ""
    userId = session.userId 

    if (structKeyExists(form, "category") && structKeyExists(form, "title") && structKeyExists(form, "content") && structKeyExists(session, "userId")) {
        blogService = new cfcblog.controllers.BlogService()
        newPost = new cfcblog.models.Post(form.title, form.category, form.content, session.userId);

        createPost = blogService.createPost(newPost);

        if(createPost){
            location("/cfcblog/index.cfm", false)
        } else {
            message = "Post Failed"
        }
        
    }
</cfscript>

<html>
    <head>
        <link href="/cfcblog/styles.css" rel="stylesheet" />
    </head>
    <body class="h-[100dvh] w-full bg-slate-200 flex flex-col items-center gap-10">
        <nav class="navbar">
            <h1>CFC BLOG</h1>
            <cfif isDefined("userId")>
                <a href="/cfcblog/views/newpost.cfm" class="actionbutton">New Post</a>
            <cfelse>
                <a href="/cfcblog/views/login.cfm" class="actionbutton">Login</a>
            </cfif>
        </nav>
        <form class="sm:w-3/4 w-full h-full flex flex-col gap-4 p-4 items-center" action="newpost.cfm" method="POST">
            <div class="flex flex-col w-full items-center">
                <label for="category">Category</label>
                <input name="category" class="w-1/4 p-2 rounded-md"/>
            </div>
            <div class="flex flex-col w-full items-center">
                <label for="title">Title</label>
                <input name ="title" class="w-1/4 p-2 rounded-md"/>
            </div>
            <textarea name="content" placeholder="content goes here..." rows="15" class="w-full p-2 rounded-md"></textarea>
            <button class="bg-slate-500 hover:bg-slate-400 transition-all rounded-full p-2 text-2xl" type="submit">Submit</button>
        </form>
        <cfoutput>
            <p>#message#</p>
        </cfoutput> 
    </body>
</html>
