class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = "Post"
    @word = params[:word]

    @posts = Post.looks(params[:search], params[:word])
    render 'search_result'
  end
end
