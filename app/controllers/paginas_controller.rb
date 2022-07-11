class PaginasController < ApplicationController
	def inicio
		@customers_ativos = CustomerSuccess.where(status: 'ativo')
		@customers_inativos = CustomerSuccess.where.not(status: 'ativo')
		@clientes = Cliente.all
	end

	# GET /paginas/criar_balanciamento
	def criar_balanciamento

		Balanciamento.destroy_all
		@customers_ativos = CustomerSuccess.where(status: 'ativo').order(:nivel)

		nivel_minimo = 0
		@customers_ativos.each do |customer|
			nivel_do_customer = customer.nivel
			clientes_para_esse_customer = Cliente.where('tamanho != 0 AND tamanho >= ? AND tamanho <= ?', nivel_minimo, nivel_do_customer)

			clientes_para_esse_customer.each do |cliente|
				balanceamento = ::Balanciamento.new(id_costumer: customer.id.to_i, id_cliente: cliente.id.to_i)
				balanceamento.save(validate: false)
			end
			nivel_minimo = nivel_do_customer + 1
		end

		@customers_ativos = CustomerSuccess.where(status: 'ativo')
		@customers_inativos = CustomerSuccess.where.not(status: 'ativo')
		@clientes = Cliente.all
		render :inicio
	end
end
