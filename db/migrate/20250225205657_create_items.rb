class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.text :description
      t.references :plan, null: false, foreign_key: { to_table: :plans }
      t.float :score

      t.timestamps
    end
  end
end
