# spec/views/calculators/result.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "calculators/result.html.erb", type: :view do
  context 'with result' do
    it 'displays the result' do
      assign(:result, 6)
      render
      expect(rendered).to include("The result is 6")
    end
  end

  context 'with error' do
    it 'displays the error message' do
      assign(:error, "Invalid input")
      render
      expect(rendered).to include("Invalid input")
    end
  end
end
