class CommentsController < ApplicationController
 before_action :findTopic
 respond_to :json
def index
  respond_with @topic.comments
end

def create
    comment = @topic.comments.create comment_params
    respond_with comment
  
end

def update
  @topic.comments.find(params[:id]).update_attributes!(comment_params)
   respond_with topic
end

def destroy
  respond_with @topic.comments.find(params[:id]).destroy
end

  private
   def comment_params
       params.require(:comment).permit(:id,:name, :content)
   end
   def findTopic
       @topic = Topic.find(params[:topic_id])
   end
   
end
