class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    @industries = @companies.industries.all
  end

  def show
    @industry = Industry.find(params[:industry_id])
    @company = Company.find(params[:id])
    @company.industry_id = @industry.id
  end

  def create
    @industry = Industry.find(params[:industry_id])
    @company = Company.new(company_params)
    @company.industry_id = @industry.id
      if @company.save
        redirect_to company_path(@company), notice: "Company was successfully created!"
      else
      render :new
      end
    end

    def edit
      @industry = Industry.find(params[:industry_id])
      @company = Company.find(params[:id])
    end

  def update
    @industry = Industry.find(params[:industry_id])
    @company = Company.find(params[:id])
      if @company.update(company_params)
        redirect_to company_path(@company)
      else
        render :edit
    end
  end

  def destroy
    @industry = Industry.find(params[:industry_id])
    @company = Company.find(params[:id])
    @company.industry_id = @industry.id
    @company.destroy
    redirect_to company_path(@company), notice:'Company was successfully created!'
  end

  private
    def company_params
      params.require(:company).permit(:name, :description, :industry_id, :created_at, :updated_at)
    end

end
