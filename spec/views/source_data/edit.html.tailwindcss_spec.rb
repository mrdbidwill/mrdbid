# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'source_data/edit', type: :view do
  let(:source_datum) do
    SourceDatum.create!(
      title: 'MyString',
      author: 'MyString',
      ref: 'MyString',
      item_code: 'MyString',
      source_data_type: 1,
      comment: 'MyText'
    )
  end

  before do
    assign(:source_datum, source_datum)
  end

  it 'renders the edit source_datum form' do
    render

    assert_select 'form[action=?][method=?]', source_datum_path(source_datum), 'post' do
      assert_select 'input[name=?]', 'source_datum[title]'

      assert_select 'input[name=?]', 'source_datum[author]'

      assert_select 'input[name=?]', 'source_datum[ref]'

      assert_select 'input[name=?]', 'source_datum[item_code]'

      assert_select 'input[name=?]', 'source_datum[source_data_type]'

      assert_select 'textarea[name=?]', 'source_datum[comment]'
    end
  end
end
