class Url < ApplicationRecord
  validates :original_url, presence: true, format: URI::regexp(%w[http https])

  before_create :generate_shortened_url

  def generate_shortened_url
    self.shortened_url = SecureRandom.alphanumeric(6)
  end
end
