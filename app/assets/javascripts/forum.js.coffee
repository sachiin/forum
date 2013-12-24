window.Forum =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Forum.Routers.Topics()
    Backbone.history.start({pushState:true})

$(document).ready ->
  Forum.initialize()
