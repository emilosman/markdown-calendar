class Day < ApplicationRecord
  scope :with_text, -> { where.not(text: nil) }

  def value
    2
  end
end
