class RepliesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_reply, only: [:edit, :update, :show, :destroy]
    before_action :set_discussion, only: [:create, :edit, :show, :update, :destroy]
    before_action :reply_owner, only: [:edit, :update, :destroy]


    def create
        @reply = @discussion.replies.create(params[:reply].permit(:reply, :discussion_id))
        @reply.user_id = current_user.id

        respond_to do |format|
            if @reply.save
              format.html { redirect_to discussion_path(@discussion) }
              format.js # renders create.js.erb
            else
              format.html { redirect_to discussion_path(@discussion), notice: "La respuesta no se guardo. Por favor intente nuevamente."}
              format.js
            end
        end
    end

    def new
    end

    def destroy
        @reply = @discussion.replies.find(params[:id])
        @reply.destroy
        redirect_to discussion_path(@discussion)
    end

    def edit
        @discussion = Discussion.find(params[:discussion_id])
        @reply = @discussion.replies.find(params[:id])
    end

    def update
        @reply = @discussion.replies.find(params[:id])
        respond_to do |format|
            if @reply.update(reply_params)
                format.html { redirect_to discussion_path(@discussion), notice: 'La respuesta se edito exitosamente.' }
            else
                format.html { render :edit }
                format.json { render json: @reply.errors, status: :unprocessable_entity }
            end
        end
    end

    def reply_owner
        unless @reply.user_id == current_user.id || current_user.has_role?(:admin)
         flash[:notice] = 'Acceso denegado porque no eres el dueño de esta respuesta'
         redirect_to discussions_path
        end
    end    

    private

    def set_discussion
        @discussion = Discussion.find(params[:discussion_id])
    end
    
    def set_reply
        @reply = Reply.find(params[:id])
    end
    
    def reply_params
        params.require(:reply).permit(:reply)
    end
    
end