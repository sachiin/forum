class Forum.Models.Comment extends Backbone.Model
  parse: (response,options) ->
    response.id = response._id.$oid
    response

