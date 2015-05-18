class CreateCompaniesIndustries < ActiveRecord::Migration
  def change
    create_table :companies_industries do |t|
      t.integer :company_id
      t.integer :industry_id
    end
  end
end
