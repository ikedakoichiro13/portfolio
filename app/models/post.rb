class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_and_belongs_to_many :coats

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg')
    end
    image
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","#{word}")
    else
      @post = Post.all
    end
  end
end
