class SearchesController < ApplicationController
  
  def search
    @range = "Post"
    @word = params[:word]
    @coats = Coat.all 

    @posts = Post.looks(params[:search], params[:word], params[:dogcat])
    render 'search_result'
  end
end
