# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mr_characters/new', type: :view do
  before do
    assign(:mr_character, MrCharacter.new(
                            name: 'MyString',
                            display_option_id: 1,
                            part_id: 1,
                            source_data: nil
                          ))
  end

  it 'renders new mr_character form' do
    render

    assert_select 'form[action=?][method=?]', mr_characters_path, 'post' do
      assert_select 'input[name=?]', 'mr_character[name]'

      assert_select 'input[name=?]', 'mr_character[display_option_id]'

      assert_select 'input[name=?]', 'mr_character[part_id]'

      assert_select 'input[name=?]', 'mr_character[source_data_id]'
    end
  end
end
