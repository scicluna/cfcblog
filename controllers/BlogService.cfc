component{

    public function getPosts(){
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
        return blogPosts
    }

    public function getPostById(numeric id){
        postToEdit = queryExecute(
            "SELECT * FROM blog WHERE id = :id",
            {id: id},
            {datasource: "cfblog"}
        );
        return postToEdit
    }

    public boolean function createPost(Post post){
        try{
            queryExecute(
                "INSERT INTO blog (userId, category, date, title, content) VALUES (:userId, :category, NOW(), :title, :content)",
                {
                    userId: post.getAuthorId(),
                    category: post.getCategory(),
                    title: post.getTitle(),
                    content: post.getContent()
                },
                {datasource: "cfblog"}
            );
            return true
        } catch(Any e){
            writeDump(e);
            return false
        }
    }

    public function editPost(string id,  string title, string category,string content){
        queryExecute(
            "
            UPDATE 
                blog
            SET 
                category = :category,
                title = :title,
                content = :content
            WHERE
                id = :id
            ",
            {
            category: category,
            title: title,
            content: content,
            id: id
            },
            {datasource: "cfblog"}
        )
    }

    public void function deletePost(string id){
        queryExecute(
            "DELETE FROM blog WHERE id = :id",
            {id: form.id},
            {datasource: "cfblog"}
        );
    }

}