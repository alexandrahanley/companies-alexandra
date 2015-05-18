class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :industry_id
      t.integer :price
      t.timestamps
    end
  end
end
