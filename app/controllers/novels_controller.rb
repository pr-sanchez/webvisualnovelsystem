class NovelsController < ApplicationController
  before_action :find_novel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :novel_owner, only: [:edit, :update, :destroy]

  def index
    @novels = Novel.all
  end

  def show
  end

  def new
    @novel = current_user.novels.build
  end

  def edit
  end

  def create
    @novel = current_user.novels.build(novel_params)

    respond_to do |format|
      if @novel.save
        format.html { redirect_to @novel, notice: 'Novel was successfully created.' }
        format.json { render :show, status: :created, location: @novel }
      else
        format.html { render :new }
        format.json { render json: @novel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @novel.update(novel_params)
        format.html { redirect_to @novel, notice: 'La Novela ha sido editada exitosamente!' }
        format.json { render :show, status: :ok, location: @novel }
      else
        format.html { render :edit }
        format.json { render json: @novel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @novel.destroy
    respond_to do |format|
      format.html { redirect_to novels_url, notice: 'La Novela ha sido borrada exitosamente!' }
      format.json { head :no_content }
    end
  end

  def novel_owner
    unless @novel.user_id == current_user.id || current_user.has_role?(:admin)
     flash[:notice] = 'Acceso denegado porque no eres el dueño de esta novela'
     redirect_to novelas_path
    end
  end

  
  private

    def find_novel
        @novel = Novel.find(params[:id])
    end

    # def anime_params
    #   params.require(:anime).permit(:title, :description, :anime_size, :studio, :rating, :fansub, :language, :subtitles, :ovas, :resolution, :file_format, :anime_episodes, :server, :uploader, :year, :genre, :image, :capture, :short_title, :anime_date_home, :background)
    # end

    def novel_params
      params.require(:novel).permit(:title, :description)
    end
end