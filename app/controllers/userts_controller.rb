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
    usert.create!
    render usert_path(@usert)
  end

end
