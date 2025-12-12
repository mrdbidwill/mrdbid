class Article < ApplicationRecord
  # Predefined subjects to prevent taxonomy sprawl
  SUBJECTS = [
    "Mycology",
    "Mycology - Identification",
    "Mycology - Obfuscation",
    "Mushroom Character Discussion",
    "Tree - Identification",
    "Plant - Identification",
    "Website Organization",
    "Site Documentation",
    "Technical - Website Issues",
    "Other"
  ].freeze

  validates :title, :slug, :body, presence: true
  validates :slug, uniqueness: true
  validates :subject, inclusion: { in: SUBJECTS, allow_blank: true }
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