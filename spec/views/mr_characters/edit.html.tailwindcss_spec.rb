# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mr_characters/edit', type: :view do
  let(:mr_character) do
    MrCharacter.create!(
      name: 'MyString',
      display_option_id: 1,
      part_id: 1,
      source_data: nil
    )
  end

  before do
    assign(:mr_character, mr_character)
  end

  it 'renders the edit mr_character form' do
    render

    assert_select 'form[action=?][method=?]', mr_character_path(mr_character), 'post' do
      assert_select 'input[name=?]', 'mr_character[name]'

      assert_select 'input[name=?]', 'mr_character[display_option_id]'

      assert_select 'input[name=?]', 'mr_character[part_id]'

      assert_select 'input[name=?]', 'mr_character[source_data_id]'
    end
  end
end
