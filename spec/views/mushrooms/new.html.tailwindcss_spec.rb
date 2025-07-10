# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'mushrooms/new', type: :view do
  before do
    assign(:mushroom, Mushroom.new(
                        name: 'MyString',
                        description: 'MyText',
                        comment: 'MyText',
                        user: nil
                      ))
  end

  it 'renders new mushroom form' do
    render

    assert_select 'form[action=?][method=?]', mushrooms_path, 'post' do
      assert_select 'input[name=?]', 'mushroom[name]'

      assert_select 'textarea[name=?]', 'mushroom[description]'

      assert_select 'textarea[name=?]', 'mushroom[comment]'

      assert_select 'input[name=?]', 'mushroom[user_id]'
    end
  end
end
