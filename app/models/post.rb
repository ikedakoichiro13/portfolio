class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :post_coats
  has_many :coats, through: :post_coats
  has_many :favorites, dependent: :destroy

  def vaccination_text
    if vaccination == true
      "接種済み"
    else
      "接種済みでない"
    end
  end

  def infertility_treatment_text
    if infertility_treatment == true
      "治療済み"
    else
      "治療済みでない"
    end
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg')
    end
    images
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","#{word}")
    else
      @post = Post.all
    end
  end
end