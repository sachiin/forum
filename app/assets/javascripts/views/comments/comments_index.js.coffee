class Forum.Views.CommentsIndex extends Backbone.View

  template: JST['comments/index']
  
  events:
    'submit #new_comment' : 'createComment'

  initialize: ->
    @collection.on('reset', @render,this)
    @collection.on('add', @appendComment,this)

  render: ->
    $(@el).html(@template())
    console.log @collection
    @collection.each(@appendComment,this)
    this
  
  createComment: (event) ->
    event.preventDefault()
    attrs =
      name: $('#new_name').val()
      content: $('#new_content').val()
    @collection.create attrs,
       wait: true
       error: @handleErrors

  appendComment: (comment) =>
    console.log comment
    view = new Forum.Views.Comment(model: comment)
    $('#comment_list').append(view.render().el)
  
  handleErrors: (comment,response) ->
    errors = $.parseJSON(response.responseText).errors
    for attribute,messages of errors
      alert "#{attribute} #{message}" for message in messages
      
