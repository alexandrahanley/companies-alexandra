class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  private
    def companies_params
      params.require(:company).permit(:name, :description, :industry_id, :created_at, :updated_at)
    end

end
