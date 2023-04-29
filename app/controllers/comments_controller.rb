class CommentsController < ApplicationController
    def create
        @film = Film.find(params[:film_id])
        @comment = @film.comments.create(comment_params.merge(user: current_user))
        redirect_to @film
    end

    def edit
      @film = Film.find(params[:film_id])
      @comment = Comment.find(params[:id])
    end

    def update
      @film = Film.find(params[:film_id])
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to film_path(@film), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
    
    
      
      private
      
      def comment_params
        params.require(:comment).permit(:content)
      end
      
end
