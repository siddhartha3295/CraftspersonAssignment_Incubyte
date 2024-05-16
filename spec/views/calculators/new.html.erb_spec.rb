# spec/views/calculators/new.html.erb_spec.rb
require 'rails_helper'

RSpec.describe "calculators/new.html.erb", type: :view do
  it 'displays the input form' do
    render
    expect(rendered).to have_selector('form')
    expect(rendered).to have_field('numbers')
    expect(rendered).to have_button('Calculate')
  end
end
