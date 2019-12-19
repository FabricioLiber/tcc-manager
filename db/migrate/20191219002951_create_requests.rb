class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :tipo
      t.string :status
      t.float :nota
      t.references :student, foreign_key: true 
      t.references :document, foreign_key: true
      t.references :teacher, foreign_key: true
      
      t.timestamps
    end
  end
end
