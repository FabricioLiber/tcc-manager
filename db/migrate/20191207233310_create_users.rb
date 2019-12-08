class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :tipo
      t.string :nome
      t.string :matricula

      t.timestamps
    end
  end
end
