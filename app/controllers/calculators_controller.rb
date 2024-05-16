# app/controllers/calculators_controller.rb
class CalculatorsController < ApplicationController
  # Renders the form for inputting numbers
  def new
  end

  # Handles the form submission
  def create
    calculator = StringCalculator.new
    # Get the input from the form, default to an empty string if nil
    input = params[:numbers] || ""

    # Calculate the result using the StringCalculator service
    @result = calculator.add(input)
    # Redirect to the result action, passing the result as a parameter
    redirect_to result_calculators_path(result: @result)
  rescue => e
    # Handle any exceptions (such as invalid input or negative numbers)
    # and pass the error message to the result action
    redirect_to result_calculators_path(error: e.message)
  end

  # Displays the result or error message
  def result
    # Get the result or error message from the parameters
    @result = params[:result]
    @error = params[:error]
  end
end
