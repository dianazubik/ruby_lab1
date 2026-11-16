
class ConferenceSession < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_validation

private

def image_validation
  return unless image.attached?

  unless image.content_type.in?(%w[image/jpeg image/png image/webp])
    errors.add(:image, "повинно бути у форматі JPEG, PNG або WebP")
  end

  if image.byte_size > 5.megabytes
    errors.add(:image, "не повинно перевищувати 5 МБ")
  end
end
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :track, presence: true
  validates :conference_day, inclusion: { in: [1, 2] }
end
