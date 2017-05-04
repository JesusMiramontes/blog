class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true #Valida que no esté vacio, y no esté repetido
  validates :body, presence: true, length: {minimum: 10} #Valida tamaño minimo
end
