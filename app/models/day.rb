class Day < ApplicationRecord
  scope :with_text, -> { where.not(text: '') }

  def value
    2
  end
end
