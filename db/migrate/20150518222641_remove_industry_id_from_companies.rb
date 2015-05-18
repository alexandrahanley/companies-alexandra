class RemoveIndustryIdFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :industry_id, :integer
  end
end
