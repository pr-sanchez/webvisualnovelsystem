class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  before_action :channel_owner, only: [:edit, :update, :destroy]


  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    #in the discussion table i have the channel_id and i need they to match
    @discussions = Discussion.where('channel_id = ?', @channel.id)
    @channels = Channel.all
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_path, notice: 'El tema ha sido creado exitosamente!' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channels_path, notice: 'El tema ha sido editado exitosamente!' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'El tema ha sido borrado exitosamente!' }
      format.json { head :no_content }
    end
  end

  def channel_owner
    unless @channel.user_id == current_user.id || current_user.has_role?(:admin)
     flash[:notice] = 'Acceso denegado porque no eres el dueño de este tema'
     redirect_to channels_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:channel)
    end
end
