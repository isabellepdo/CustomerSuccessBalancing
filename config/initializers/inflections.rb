ActiveSupport::Inflector.inflections do |inflect|
	inflect.clear

  inflect.plural(/$/,  's')

  inflect.irregular('customer success', 'customers success')
  inflect.irregular('customer_success', 'customers_success')
  inflect.irregular('CustomerSuccess', 'CustomersSuccess')
  inflect.irregular('cliente', 'clientes')
  inflect.irregular('Cliente', 'Clientes')
  inflect.irregular('balanciamento', 'balanciamentos')
  inflect.irregular('Balanciamento', 'Balanciamentos')
end
