class Forum.Views.Topic extends Backbone.View

  template: JST['topics/topic']
  tagName: 'tr'
  events:
    'click #show_topic' : 'showTopic'
    'click #editTopic' : 'editTopic'
    'click #delete_topic' : 'deleteTopic'

  initialize: ->
    @.listenTo @model, 'change', @notify
  render: ->
    $(@el).html(@template(topic: @model))
    this
  
  showTopic: ->
    console.log @model
    #Backbone.history.navigate("topics/#{@model.get('_id').$oid}",true)
    view = new Forum.Views.Thread(model: @model)
    $('#container').html(view.render().el)

  editTopic: (e) ->
    e.preventDefault()
    view = new Forum.Views.EditThread(model: @model)
    $('#container').html(view.render().el)
    #Backbone.history.navigate("/topics/#{@model.get('_id').$oid}",true)
  
  deleteTopic: (e) ->
    e.preventDefault()
    console.log @model
    console.log @model.id
    @model.destroy()
    @.remove()
  notify: ->
    alert("Topic edited")
