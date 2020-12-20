class PostsController < ApplicationController
    before_action :redirect_if_not_signed_in, only: [:new]
    def new
        @posts = Post.new
      end
    
      def create
        @posts = Post.new(post_params)
        if @posts.save 
          redirect_to post_path(@posts) 
        else
          redirect_to root_path
        end
      end

      def show
        @post = Post.find(params[:id])
      end

    private 
        def get_posts
            Post
        end

        def post_params
            params.require(:post).permit(:title, :text)
                                 .merge(user_id: current_user.id)
          end
end
