# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mushrooms/index', type: :view do
  before do
    assign(:mushrooms, [
             Mushroom.create!(
               name: 'Name',
               description: 'MyText',
               comment: 'MyText',
               user: nil
             ),
             Mushroom.create!(
               name: 'Name',
               description: 'MyText',
               comment: 'MyText',
               user: nil
             )
           ])
  end

  it 'renders a list of mushrooms' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
