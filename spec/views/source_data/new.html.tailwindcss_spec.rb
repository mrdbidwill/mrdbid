# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'source_data/new', type: :view do
  before do
    assign(:source_datum, SourceDatum.new(
                            title: 'MyString',
                            author: 'MyString',
                            ref: 'MyString',
                            item_code: 'MyString',
                            source_data_type: 1,
                            comment: 'MyText'
                          ))
  end

  it 'renders new source_datum form' do
    render

    assert_select 'form[action=?][method=?]', source_data_path, 'post' do
      assert_select 'input[name=?]', 'source_datum[title]'

      assert_select 'input[name=?]', 'source_datum[author]'

      assert_select 'input[name=?]', 'source_datum[ref]'

      assert_select 'input[name=?]', 'source_datum[item_code]'

      assert_select 'input[name=?]', 'source_datum[source_data_type]'

      assert_select 'textarea[name=?]', 'source_datum[comment]'
    end
  end
end
