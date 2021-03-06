class MuseumsController < ApplicationController
  require 'pp'

  #before_action :set_museum, only: [:show, :edit, :update, :destroy]

  # GET /museums
  # GET /museums.json
  def index
    museum_list = ['東京都美術館', '国立西洋美術館', 'Bunkamura美術館', '森美術館']

    @museums = []
    museum_list.each_with_index do |name, index|
      museum = Museum.new(index + 1, name)
      @museums << museum
    end
    @museums
  end

  # GET /museums/1
  # GET /museums/1.json
  def show
  end

  # GET /museums/new
  def new
    @museum = Museum.new(nil, nil)
  end

  # GET /museums/1/edit
  def edit
  end

  # POST /museums
  # POST /museums.json
  def create
    museum = params[:museum]
    @museum = Museum.new(museum['id'], museum['name'])
    redis = Redis.new
    result = redis.set(@museum.id, @museum.name)
    # redis = Redis.new(:host => "10.0.1.1", :port => 6380, :db => 15)


    respond_to do |format|
      if result == 'OK'
        format.html { redirect_to @museum, notice: 'Museum was successfully created.' }
        format.json { render :show, status: :created, location: @museum }
      else
        format.html { render :new }
        format.json { render json: @museum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /museums/1
  # PATCH/PUT /museums/1.json
  def update
    # respond_to do |format|
    #   if @museum.update(museum_params)
    #     format.html { redirect_to @museum, notice: 'Museum was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @museum }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @museum.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /museums/1
  # DELETE /museums/1.json
  def destroy
    # @museum.destroy
    # respond_to do |format|
    #   format.html { redirect_to museums_url, notice: 'Museum was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_museum
      # @museum = Museum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def museum_params
      params[:museum]
    end
end
