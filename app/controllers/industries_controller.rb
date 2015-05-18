class IndustriesController < ApplicationController

  def index
    @industries = Industry.all
    @companies = @industries.companies.all
  end

  def show
    @company = Company.find(params[:company_id])
    @industry = Industry.find(params[:id])
    @industry.company_id = @company.id
  end

  def create
    @company = Company.find(params[:company_id])
    @industry = Industry.new(industry_params)
    @industry.company_id = @company.id
      if @industry.save
        redirect_to industry_path(@industry), notice: "Industry was successfully created!"
      else
      render :new
      end
    end

    def edit
      @company = Company.find(params[:company_id])
      @industry = Industry.find(params[:id])
    end

  def update
    @company = Company.find(params[:company_id])
    @industry = Industry.find(params[:id])
      if @industry.update(industry_params)
        redirect_to industry_path(@industry)
      else
        render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @industry = Industry.find(params[:id])
    @industry.company_id = @company.id
    @industry.destroy
    redirect_to industry_path(@industry), notice:'Industry was deleted!'
  end

  private

  def industry_params
    params.require(:industry).permit(:name, :description, :company_id)
  end

end
