# spec/controllers/calculators_controller_spec.rb
require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do
  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid input' do
      it 'redirects to result with the calculated sum' do
        post :create, params: { numbers: "1,2,3" }
        expect(response).to redirect_to(result_calculators_path(result: 6))
      end
    end

    context 'with negative numbers' do
      it 'redirects to result with an error message' do
        post :create, params: { numbers: "1,-2,3" }
        expect(response).to redirect_to(result_calculators_path(error: "Negative numbers not allowed: -2"))
      end
    end
  end

  describe 'GET #result' do
    it 'returns a success response' do
      get :result, params: { result: 6 }
      expect(response).to be_successful
    end
  end
end
