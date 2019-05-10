class Image < ApplicationRecord
  IMAGE_URL_REGEX = %r{\Ahttps?://[/|.|\w|\s|-]*\.(jpe?g|gif|png|svg)\z}
  validates :url, uniqueness: true, presence: true,
                  format: { with: IMAGE_URL_REGEX,
                            message: 'Invalid image url' }
  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
