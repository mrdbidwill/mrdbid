module LookupTables
  class AbundancesController < ApplicationController
    def index
      @abundances = Abundance.all
      Rails.logger.debug("Abundances fetched: #{@abundances.inspect}")
    end
  end
end
