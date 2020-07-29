class Day < ApplicationRecord
  include Rails.application.routes.url_helpers

  scope :with_text, -> { where.not(text: '') }
  def value
    2
  end
end
