# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mushrooms/edit', type: :view do
  let(:mushroom) do
    Mushroom.create!(
      name: 'MyString',
      description: 'MyText',
      comment: 'MyText',
      user: nil
    )
  end

  before do
    assign(:mushroom, mushroom)
  end

  it 'renders the edit mushroom form' do
    render

    assert_select 'form[action=?][method=?]', mushroom_path(mushroom), 'post' do
      assert_select 'input[name=?]', 'mushroom[name]'

      assert_select 'textarea[name=?]', 'mushroom[description]'

      assert_select 'textarea[name=?]', 'mushroom[comment]'

      assert_select 'input[name=?]', 'mushroom[user_id]'
    end
  end
end
