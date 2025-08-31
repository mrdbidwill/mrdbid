class Article < ApplicationRecord
  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true
  # Keep slugs URL-friendly
  before_validation :normalize_slug

  scope :published, -> { where(published: true).where("published_at IS NULL OR published_at <= ?", Time.current) }
  scope :by_subject, ->(s) { where(subject: s) if s.present? }
  scope :recent, -> { order(published_at: :desc, created_at: :desc) }

  def to_param
    slug
  end

  private

  def normalize_slug
    self.slug = (slug.presence || title.to_s).parameterize
  end
end