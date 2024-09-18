class HomesController < ApplicationController

  def top
    @coats = Coat.all
    @posts = Post.all
  end

end
