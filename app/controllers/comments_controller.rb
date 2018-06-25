class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_post, only: [:create, :edit, :update, :destroy, :comment_owner]
    before_action :find_comment, only: [:edit, :update, :destroy, :comment_owner]
    before_action :comment_owner, only: [:edit, :update, :destroy]

    def create
        @comment = @post.comments.create(params[:comment].permit(:user_id, :comment).merge(user_id: current_user.id))
        @comment.save

        if @comment.save
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @comment.update(params[:comment].permit(:comment))
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        
        redirect_to post_path(@post)
    end

    def comment_owner
        unless @comment.user.id == current_user.id
         flash[:notice] = 'Acceso denegado porque no eres el dueño de este comentario'
         redirect_to posts_path
        end
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def find_comment
        @comment = @post.comments.find(params[:id])
    end
end
