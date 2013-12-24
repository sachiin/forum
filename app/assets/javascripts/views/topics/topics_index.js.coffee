class Forum.Views.TopicsIndex extends Backbone.View

  template: JST['topics/index']
  
  events:
    'submit #new_topic' : 'createTopic'

  initialize: ->
    @collection.on('reset', @render,this)
    @collection.on('add', @appendTopic,this)

  render: ->
    $(@el).html(@template())
    console.log @collection
    @collection.each(@appendTopic,this)
    this
  
  createTopic: (event) ->
    event.preventDefault()
    attrs =
      name: $('#new_name').val()
      title: $('#new_title').val()
      content: $('#new_content').val()
    @collection.create attrs,
       wait: true
       error: @handleErrors

  appendTopic: (topic) =>
    console.log topic
    view = new Forum.Views.Topic(model: topic)
    $('#topic_list').append(view.render().el)
  
  handleErrors: (topic,response) ->
    errors = $.parseJSON(response.responseText).errors
    for attribute,messages of errors
      alert "#{attribute} #{message}" for message in messages
      
