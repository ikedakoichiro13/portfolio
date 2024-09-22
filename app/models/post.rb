class Post < ApplicationRecord

  has_many_attached :images
  belongs_to :user
  has_many :post_coats
  has_many :coats, through: :post_coats
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :dogcat, presence: true
  validates :kinds, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :health_condition, presence: true
  validates :vaccination, inclusion: { in: [true, false], message: "を選択してください" }
  validates :infertility_treatment, inclusion: { in: [true, false], message: "を選択してください" }
  validates :features, presence: true
  validates :recruitment_area, presence: true
  validates :transfer_condition, presence: true
  validate :images_presence
  validate :validate_coat_limit

  def validate_coat_limit
    unless coat_ids.compact_blank.size >= 1 && coat_ids.compact_blank.size <= 3
      errors.add(:coat_ids, "は3つ選択してください")
    end
  end

  def images_presence
    errors.add(:images, "を選択してください") unless images.attached?
  end

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

  def self.looks(search, word, dogcat)
    if search == "perfect_match"
      @post = Post.where(dogcat: dogcat).where("title LIKE ? OR recruitment_area LIKE ? OR kinds LIKE ?", "#{word}", "#{word}", "#{word}")
    elsif search == "partial_match"
      @post = Post.where(dogcat: dogcat).where("title LIKE ? OR recruitment_area LIKE ? OR kinds LIKE ?", "%#{word}%", "%#{word}%", "%#{word}%")
    else
      @post = Post.all
    end
  end
end