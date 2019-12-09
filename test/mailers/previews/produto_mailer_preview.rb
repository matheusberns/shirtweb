# Preview all emails at http://localhost:3000/rails/mailers/produto_mailer
class ProdutoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/produto_mailer/confirmation
  def confirmation
    ProdutoMailer.confirmation
  end

end
