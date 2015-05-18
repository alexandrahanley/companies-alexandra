class CreateCompaniesIndustries < ActiveRecord::Migration
  def change
    create_table :companies_industries do |t|
      t.integer :company_id
      t.integer :industry_id
      t.belongs_to :company, index: true
      t.belongs_to :industry, index: true
    end
  end
end
