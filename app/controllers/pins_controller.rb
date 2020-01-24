class PinsController < ApplicationController

  load_and_authorize_resource
  skip_authorize_resource :only => [:upvote]

  before_action :set_pin, only: [:show, :edit, :update, :destroy,:upvote]
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @pins = Pin.all
  end

  def show
    @comment = Comment.new
    @comments = @pin.comments.all
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @pin.upvote_by current_user
    redirect_back fallback_location: root_path
  end 

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:title, :description, :image, :user_id)
    end
end
