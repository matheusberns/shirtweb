# frozen_string_literal: true

class ProdutosController < ApplicationController
  before_action :authenticate_user!

  def index
    @produtos = Produto.all
    params[:nome] ? @produtos = @produtos.by_nome(params[:nome]) : nil
    params[:department_id] ? @produtos = @produtos.by_department(params[:department_id]) : nil
  end

  def edit
    set_produto
    set_departments
    render_edit
  end

  def show
    set_produto
    set_departments
    render :show
  end

  def update
    set_produto
    @produto.update(merge_produto_params)
    if @produto.save
      flash[:notice] = 'Produto editado com sucesso!'
      redirect_to root_url
    else
      flash[:notice] = 'Erro ao editar produto!'
      format.html {render_edit}
    end
  end

  def new
    new_produto
    set_departments
  end

  def create
    @produto = Produto.new(merge_produto_params)

    respond_to do |format|
      if @produto.save
        format.html {redirect_to root_url, notice: 'Produto criado com sucesso'}
      else
        flash[:notice] = 'Erro ao criar produto!'
        format.html {render_new}
      end
    end
  end

  def destroy
    set_produto.destroy
    flash[:notice] = 'Produto removido com sucesso!'
    redirect_to root_url
  end

  private

  def require_permit_params
    params.require(:produto).permit :nome, :descricao, :quantidade, :preco, :department_id, :produto_imagem
  end

  def merge_produto_params
    require_permit_params.merge({created_by_id: current_user.id, user_email: current_user.email})
  end

  def set_departments
    @departments = Department.all
  end

  def set_produto
    id = params[:id]
    @produto = Produto.find(id)
  end

  def new_produto
    @produto = Produto.new
  end

  def render_new
    render :new
  end

  def render_edit
    render :edit
  end
end
