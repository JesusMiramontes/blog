class Article < ApplicationRecord

  include AASM

  belongs_to :user
  validates :title, presence: true, uniqueness: true #Valida que no esté vacio, y no esté repetido
  validates :body, presence: true, length: {minimum: 10} #Valida tamaño minimo
  before_create :set_visits_count
  has_many :comments
  after_create :save_categories

  has_many :has_categories
  has_many :categories, through: :has_categories

  #Requerido por paperclip :cover es el "nombre" del adjunto
  has_attached_file :cover, styles: { medium: "1280*720", thumb:"800*600"}

  # Validate content type
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  scope :publicados, -> { where(status: "published") }
  scope :ultimos, -> { order("created_at") }

  def update_visits_count
    self.update(visits_count: self.visits_count + 1)
  end

  def categories=(value) #Custom setter
    @categories = value
  end

  aasm column: "status" do
    state :in_draft, initial: true
    state :published

    event :publish do
      transitions from: :in_draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :in_draft
    end
  end

  private
  def set_visits_count
    self.visits_count=0;
  end

  def save_categories
    unless @categories.nil?
      @categories.each do |category_id|
        HasCategory.create(category_id: category_id, article_id: self.id)
      end
    end
  end
end
