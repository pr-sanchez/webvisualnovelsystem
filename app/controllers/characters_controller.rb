class CharactersController < ApplicationController
  before_action :find_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def new
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
      if @character.save
      redirect_to @character #redirect_to hace un llamado http completo
      else 
          render 'new' #la diferencia entre render y redirect es que con render si por error no guarda el post, no pierdo la información que he escrito.
      end 
  end
  
  def show
  end

  def edit
  end

  def update
      if @character.update(params[:character].permit(:name))
          redirect_to @character
      else
          render 'edit'
      end
  end

  def destroy
      @character.destroy
      redirect_to root_path
  end

  private

    def character_params
      params.require(:character).permit(:name)
    end

    def find_character
      @character = Character.find(params[:id])
    end

end

