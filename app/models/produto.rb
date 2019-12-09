class Produto < ApplicationRecord

  after_create :send_confirmation

  # Soft delete
  acts_as_paranoid

  # Associations
  has_one_attached :produto_imagem
  belongs_to :department, class_name: 'Department'

  # Validations
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true
  validates :quantidade, presence: true
  validates :preco, presence: true

  # Scopes
  scope :by_nome, ->(nome) {where('nome like ?', "%#{nome}%")}
  scope :by_department, ->(department) {where('department_id = ?', department.to_s)}

  private

  def send_confirmation
    ProdutoMailer.with(produto: self).confirmation.deliver_now!
  end

end
