# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'source_data/index', type: :view do
  before do
    assign(:source_data, [
             SourceDatum.create!(
               title: 'Title',
               author: 'Author',
               ref: 'Ref',
               item_code: 'Item Code',
               source_data_type: 2,
               comment: 'MyText'
             ),
             SourceDatum.create!(
               title: 'Title',
               author: 'Author',
               ref: 'Ref',
               item_code: 'Item Code',
               source_data_type: 2,
               comment: 'MyText'
             )
           ])
  end

  it 'renders a list of source_data' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Author'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Ref'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Item Code'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
