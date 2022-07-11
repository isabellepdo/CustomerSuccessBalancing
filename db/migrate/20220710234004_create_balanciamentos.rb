class CreateBalanciamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :balanciamentos do |t|
      t.integer :id_costumer
      t.integer :id_cliente

      t.timestamps
    end
  end
end
