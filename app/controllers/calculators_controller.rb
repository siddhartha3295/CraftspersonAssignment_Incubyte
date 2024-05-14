class CalculatorsController < ApplicationController
  def new
  end

  def create
    calculator = StringCalculator.new
    @result = calculator.add(params[:numbers] || "")
    redirect_to result_path(result: @result)
  rescue => e
    redirect_to result_path(error: e.message)
  end

  def result
    @result = params[:result]
    @error = params[:error]
  end
end
