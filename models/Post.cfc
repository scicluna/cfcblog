component {
    property string title;
    property string category;
    property string content;
    property string authorId;
    
    public any function init(string title, string category, string content, authorId){
        setTitle(title)
        setCategory(category)
        setContent(content)
        setAuthorId(authorId)
        return this;
    }

    public string function getTitle(){
        return title
    }

    public void function setTitle(string NewTitle){
        title = newTitle
    }

    public string function getCategory(){
        return category
    }

    public void function setCategory(string newCategory){
        category = newCategory
    }

    public string function getContent(){
        return content
    }

    public void function setContent(string newContent){
        content = newContent
    }

    public function getAuthorId(){
        return authorId
    }

    public void function setAuthorId(newAuthorId){
        authorId = newAuthorId
    }



}