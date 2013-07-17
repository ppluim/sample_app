class UsertsController < ApplicationController

  def index

  end

  def show
    @usert = Usert.find(params[:id])
  end

  def new
    @usert = Usert.new
  end

  def create
    @usert = Usert.new(params[:usert])

    if @usert.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @usert
    else
      render 'new'
    end

  end

  private


end
