class ProdutosController < ApplicationController
    
    before_action :set_produto, only: [:edit, :update, :destroy]
    
    def index
        @produtos = Produto.order(nota: :desc)
        @produto_com_melhor_preco = Produto.order(:preco).limit 1
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def edit
        renderiza :edit
    end

    def update
        if @produto.update produto_params
            redirect_to root_url
            flash[:notice] = "Produto atualizado com sucesso!"
        else
            renderiza :edit
        end 
    end


    def create
        @produto = Produto.new produto_params
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso" 
            redirect_to root_path
        else
            renderiza :new
        end    
    end

    def destroy
        @produto.destroy
        redirect_to root_path
    end

    def busca
        @rotulo = params[:rotulo]
        @produtos = Produto.where "rotulo like ?", "%#{@rotulo}%"
    end

    private

    def produto_params
        params.require(:produto).permit(:rotulo, :pais, :uva, :preco, :nota, :observacao, :departamento_id)
    end

    def set_produto
        @produto = Produto.find(params[:id])    
    end

    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end



end
