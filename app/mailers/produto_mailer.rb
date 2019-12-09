class ProdutoMailer < ApplicationMailer

  def confirmation
    @produto = params[:produto]
    mail to: @produto.user_email, subject: "Confirmaçao de produto criado:"
  end
end
