class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true #Valida que no esté vacio, y no esté repetido
  validates :body, presence: true, length: {minimum: 10} #Valida tamaño minimo
  before_create :set_visits_count
  has_many :comments

  #Requerido por paperclip :cover es el "nombre" del adjunto
  has_attached_file :cover, styles: { medium: "1280*720", thumb:"800*600"}

  # Validate content type
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  def update_visits_count
    self.update(visits_count: self.visits_count + 1)
  end

  private
  def set_visits_count
    self.visits_count=0;
  end
end
