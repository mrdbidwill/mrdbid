# frozen_string_literal: true

class AutocompleteController < ApplicationController
  before_action :authenticate_user!

  # GET /autocomplete/genera.json?q=aga
  def genera
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Genus
                  .where("name LIKE ?", "#{Genus.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |g| { id: g.id, name: g.name } }
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/species.json?q=placo&genus_id=1
  def species
    query = params[:q].to_s.strip
    genus_id = params[:genus_id]
    results = if query.length >= 3
                scope = Species.where("name LIKE ?", "#{Species.sanitize_sql_like(query)}%")
                scope = scope.where(genera_id: genus_id) if genus_id.present?
                scope
                  .select(:id, :name, :genera_id)
                  .order(:name)
                  .limit(20)
                  .map do |sp|
                  genus = Genus.select(:name).find_by(id: sp.genera_id)
                  genus_label = genus ? "#{genus.name} " : ""
                  { id: sp.id, name: "#{genus_label}#{sp.name}" }
                end
              else
                []
              end
    render json: results
  end
end