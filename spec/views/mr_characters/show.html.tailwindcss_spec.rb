# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mr_characters/show', type: :view do
  before do
    assign(:mr_character, MrCharacter.create!(
                            name: 'Name',
                            display_option_id: 2,
                            part_id: 3,
                            source_data: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
