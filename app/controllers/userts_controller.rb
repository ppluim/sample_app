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
      redirect_to usert_path(:usert[:id])
    else
      render 'new'
    end

  end

end
