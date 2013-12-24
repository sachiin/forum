class Forum.Collections.Comments extends Backbone.Collection

  model: Forum.Models.Comment

  initialize: (options) ->
    @topic_id = options.topic_id
    @url = "topics/"+ @topic_id+"/comments"

  url: ->
    @url
