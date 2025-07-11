# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mushrooms/show', type: :view do
  before do
    assign(:mushroom, Mushroom.create!(
                        name: 'Name',
                        description: 'MyText',
                        comment: 'MyText',
                        user: nil
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
