class FactsController < ApplicationController
  def main
  end

  def index
    @facts = Fact.order("RANDOM()").sample(10)
    render json: @facts
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
