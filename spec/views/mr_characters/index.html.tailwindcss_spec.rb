# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mr_characters/index', type: :view do
  before do
    assign(:mr_characters, [
             MrCharacter.create!(
               name: 'Name',
               display_option_id: 2,
               part_id: 3,
               source_data: nil
             ),
             MrCharacter.create!(
               name: 'Name',
               display_option_id: 2,
               part_id: 3,
               source_data: nil
             )
           ])
  end

  it 'renders a list of mr_characters' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
