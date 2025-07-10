# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'source_data/show', type: :view do
  before do
    assign(:source_datum, SourceDatum.create!(
                            title: 'Title',
                            author: 'Author',
                            ref: 'Ref',
                            item_code: 'Item Code',
                            source_data_type: 2,
                            comment: 'MyText'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Ref/)
    expect(rendered).to match(/Item Code/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
