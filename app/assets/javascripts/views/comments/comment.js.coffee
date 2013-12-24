class Forum.Views.Comment extends Backbone.View

  template: JST['comments/comment']
  tagName: 'tr'
  events:
    'click #editComment' : 'editComment'
    'click #delete_comment' : 'deleteComment'
  initialize: ->
    @.listenTo @model, 'change', @notify
  render: ->
    $(@el).html(@template(comment: @model))
    this

  editComment: (e) ->
    e.preventDefault()
    view = new Forum.Views.EditComment(model: @model)
    $('#container').html(view.render().el)
  
  deleteComment: (e) ->
    e.preventDefault()
    console.log @model
    console.log @model.id
    @model.destroy()
    @.remove()
  notify: ->
    alert("Comment is edited")
