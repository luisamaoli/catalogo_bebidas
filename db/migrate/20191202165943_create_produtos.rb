class CreateProdutos < ActiveRecord::Migration[6.0]
  def change
    create_table :produtos do |t|
      t.string :rotulo
      t.string :pais
      t.string :uva
      t.decimal :preco
      t.decimal :nota
      t.text :observacao

      t.timestamps
    end
  end
end
