class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit,:new, :update]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @prototype = Prototype.all
  end

  def new
   @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
  end
  def edit
    @prototype = Prototype.find(params[:id])
    #unless user_signed_in?
      #redirect_to root_path
    #end
  end
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:concept, :image, :catch_copy, :title).merge(user_id: current_user.id)
  end
  def move_to_index
    prototype = Prototype.find(params[:id])
    if prototype.user_id != current_user.id
      redirect_to root_path 
    end
  end
end
