class Day < ApplicationRecord
  include Rails.application.routes.url_helpers

  scope :with_text, -> { where.not(text: '') }

  has_one_attached :image

  def value
    2
  end

  def image_url
    rails_blob_path(image, disposition: 'attachment') if image.present?
  end
end
