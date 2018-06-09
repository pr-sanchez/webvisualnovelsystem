class PostsController < ApplicationController
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
        redirect_to @post #redirect_to hace un llamado http completo
        else 
            render 'new' #la diferencia entre render y redirect es que con render si por error no guarda el post, no pierdo la información que he escrito.
        end 
    end

    def show
        @post = Post.find(params[:id])
    end

    private 
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
