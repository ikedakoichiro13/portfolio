class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = "Post"
    @word = params[:word]
    @coats = Coat.all 

    @posts = Post.looks(params[:search], params[:word])
    render 'search_result'
  end
end
