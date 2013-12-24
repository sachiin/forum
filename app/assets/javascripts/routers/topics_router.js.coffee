class Forum.Routers.Topics extends Backbone.Router

  routes:
    '': 'index'
  initialize: ->
    @collection = new Forum.Collections.Topics()
    @collection.fetch({reset:true})

  index: ->
    view = new Forum.Views.TopicsIndex(collection: @collection)
    $('#container').html(view.render().el)
  #showTopic: (id) ->
    
  #editTopic: (id) ->
    #data = new Forum.Models.Topic({id: id})
    #data.fetch()
     
