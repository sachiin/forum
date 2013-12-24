class TopicsController < ApplicationController
     respond_to :json
 def index
    respond_with  Topic.all

  end

    def show
      render :json => Topic.find(params[:id])
    end

    def create
      topic = Topic.create topic_params
      respond_with topic
    end

    def update
      topic = Topic.find(params[:id])
      topic.update_attributes(topic_params)
      respond_with topic
    end

    def destroy
      respond_with Topic.find(params[:id]).destroy
    end
  
  private
        def topic_params
            params.require(:topic).permit(:id,:name, :title, :content)
        end

end
