class PostsController < ApplicationController
    before_action :redirect_if_not_signed_in, only: [:new]
    
    def index
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])
      else
        @posts = Post.all
      end
    end
    
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

      def list
    
        if !params[:tag].nil? # Are we looking at a tag?
          @tag = Tag.find_by_name(params[:tag])
          if @tag.nil?
            # Redirect if user is trying to look at a non-existent tag
            redirect_to root_path
          else           
            @posts = @tag.posts.order("id DESC")
          end
        else
          # No tag - display posts as normal      
          @posts = Post.all.order("id DESC")
        end
                           
      end

    private 
        def get_posts
            Post
        end

        def post_params
            params.require(:post).permit(:title, :text, :all_tags)
                                 .merge(user_id: current_user.id)
          end
end
