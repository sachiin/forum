class Forum.Views.EditThread extends Backbone.View

  template: JST['topics/edit']
  events:
    'submit #edit_topic' : 'editTopic'
  render: ->
    $(@el).html(@template(thread: @model))
    this
  editTopic: (e) ->
    e.preventDefault()
    name_val = $('#edit_name').val()
    title_val = $('#edit_title').val()
    content_val = $('#edit_content').val()
    @model.set
      name: name_val
      title: title_val
      content: content_val
    @model.save()
    Backbone.history.navigate('/',true)
