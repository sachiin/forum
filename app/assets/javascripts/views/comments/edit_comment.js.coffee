class Forum.Views.EditComment extends Backbone.View

  template: JST['comments/edit']
  events:
    'submit #edit_comment' : 'editComment'
  render: ->
    $(@el).html(@template(comment: @model))
    this
  editComment: (e) ->
    e.preventDefault()
    name_val = $('#edit_name').val()
    content_val = $('#edit_content').val()
    @model.set
      name: name_val
      content: content_val
    @model.save()
