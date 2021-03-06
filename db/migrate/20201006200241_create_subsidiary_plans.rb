class CreateSubsidiaryPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subsidiary_plans do |t|
      t.references :subsidiary, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :final_price

      t.timestamps
    end
  end
end
