class FactsController < ApplicationController
  def main
    @fact = Fact.order("RANDOM()").first
  end


  def create
    @fact = Fact.create(fact_params)
    if @fact.invalid?
      flash[:error] = '<strong>Could not add the fact.</strong> The data you entered is no good.'
    end
    redirect_to root_path
  end

  private

  def fact_params
    params.require(:fact).permit(:name)
  end

end
