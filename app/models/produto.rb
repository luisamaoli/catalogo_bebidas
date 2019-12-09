class Produto < ApplicationRecord
    belongs_to :departamento, optional: true
    validates :preco, presence: true
    validates :rotulo, length: { minimum: 4}
end
