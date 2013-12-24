class Forum.Models.Topic extends Backbone.Model
  urlRoot: '/topics'
  parse: (response,options) ->
    response.id = response._id.$oid
    response

