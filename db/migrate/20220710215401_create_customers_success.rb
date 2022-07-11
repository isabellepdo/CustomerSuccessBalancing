class CreateCustomersSuccess < ActiveRecord::Migration[5.2]
  def change
    create_table :customers_success do |t|
      t.string :nome
      t.integer :nivel
      t.integer :status

      t.timestamps
    end
  end
end
