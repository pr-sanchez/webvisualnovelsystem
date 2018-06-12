class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
        redirect_to @post #redirect_to hace un llamado http completo
        else 
            render 'new' #la diferencia entre render y redirect es que con render si por error no guarda el post, no pierdo la información que he escrito.
        end 
    end

    def show
    end

    def edit
    end

    def update
        if @post.update(params[:post].permit(:title, :body))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    private 

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
