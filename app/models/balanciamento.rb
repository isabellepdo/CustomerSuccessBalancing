class Balanciamento < ActiveRecord::Base
	belongs_to :costumer, class_name: '::CustomerSuccess', foreign_key: 'id_costumer'
	belongs_to :cliente, class_name: '::Cliente', foreign_key: 'id_cliente'

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
	end

	def calculando_balanceamento
		calculo = []
		quantidade_max_de_clientes = 0
		customer_mais_ocupado = 0

		customers_ids = Balanciamento.distinct(:id_costumer).pluck(:id_costumer)
		customers = CustomerSuccess.where('id in (?)', customers_ids)

		customers.each do |customer|
			total_de_clientes_do_costumer = Balanciamento.where(id_costumer: customer.id).count
			if total_de_clientes_do_costumer > quantidade_max_de_clientes || quantidade_max_de_clientes == 0
				customer_mais_ocupado = customer
				quantidade_max_de_clientes = total_de_clientes_do_costumer
			elsif total_de_clientes_do_costumer == quantidade_max_de_clientes
				customer_mais_ocupado = 0
				quantidade_max_de_clientes = total_de_clientes_do_costumer
			end
		end
		
		calculo << customer_mais_ocupado
		calculo << quantidade_max_de_clientes

		return calculo
	end

	def customer_mais_ocupado
		return calculando_balanceamento[0]
	end

	def quantidade_de_clientes_customer_mais_ocupado
		return calculando_balanceamento[1]
	end

	def customerSuccessBalancing
		return calculando_balanceamento[0]
	end
end
