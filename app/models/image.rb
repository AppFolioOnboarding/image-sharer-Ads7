class Image < ApplicationRecord
  IMAGE_URL_REGEX = /\Ahttps?:\/\/[\/|.|\w|\s|-]*\.(jpe?g|gif|png|svg)\z/
  validates :url, uniqueness: true, presence: true, format: { with: IMAGE_URL_REGEX,  message: 'Invalid image url' }
end
