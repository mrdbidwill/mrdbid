# frozen_string_literal: true

class BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @source_data = SourceData
      .includes(:source_data_type)
      .where(source_data_type_id: [1, 4, 8, 9])
      .order(:title)
  end
end
