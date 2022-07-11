class CustomerSuccess < ApplicationRecord
	has_many :balanciamentos, class_name: 'Balanciamento', foreign_key: :id_costumer

  enum status: {
		ativo: 1,
		ferias: 2,
		doente: 3,
		desligado: 4
	}
end
