class TodolistsController < ApplicationController
  def new
  end
  def index
  	  @list= List.new
  end
  def create
         list = List.new(list_params)

         list.save

  end
    private
  def list_params
        params.require(:list).permit(:title, :body)
  end

end
