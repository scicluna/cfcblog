<cfscript>
    blogService = new cfcblog.controllers.BlogService()
    if (structKeyExists(form, "id")) {
        blogService.deletePost(form.id)
        location("/cfcblog/index.cfm", false);
    }
</cfscript>