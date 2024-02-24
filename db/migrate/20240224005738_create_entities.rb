class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :category, foreign_key: { to_table: 'groups' }

      t.timestamps
    end
  end
end
