class Produto < ApplicationRecord
  #Permissão de uso do paranoia
  acts_as_paranoid
  has_one_attached :produto_imagem

  # Pertencimento a classe "Departamento" - "Foreign Key"
  belongs_to :department, class_name: "Department"

  # Validaçãoes de formulário e banco
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true
  validates :quantidade, presence: true
  validates :preco, presence: true

  # Filter Scopped
  scope :by_nome, ->(sentence) {where("nome like ?", "%#{sentence}%")}
  scope :by_department, ->(sentence) {where("department_id = ?", "#{sentence}")}


end
