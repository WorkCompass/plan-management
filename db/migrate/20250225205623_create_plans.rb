class CreatePlans < ActiveRecord::Migration[8.0]
  def change
    create_table :plans do |t|
      t.references :employee, null: false, foreign_key: { to_table: :users }
      t.date :due_date
      t.float :score

      t.timestamps
    end
  end
end
