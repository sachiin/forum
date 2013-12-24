class Forum.Views.Thread extends Backbone.View

  template: JST['topics/show']
 
  render: ->
    $(@el).html(@template(thread: @model))
    id = @model.get('id')
    @collection = new Forum.Collections.Comments(topic_id: id)
    @collection.fetch()
    commentView = new Forum.Views.CommentsIndex collection:@collection
    $(@el).append(commentView.render().el)
    this
