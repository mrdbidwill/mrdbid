# frozen_string_literal: true

class AutocompleteController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  # GET /autocomplete/genera.json?q=aga
  def genera
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Genus
                  .where("name LIKE ?", "%#{Genus.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |g| { id: g.id, name: g.name } }
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/species.json?q=placo&mushroom_id=1
  def species
    query = params[:q].to_s.strip
    mushroom_id = params[:mushroom_id]

    results = if query.length >= 3
                scope = Species.where("name LIKE ?", "%#{Species.sanitize_sql_like(query)}%")

                # Filter by selected genera for this mushroom
                if mushroom_id.present?
                  mushroom = Mushroom.find_by(id: mushroom_id)
                  if mushroom && mushroom.genera.any?
                    genera_ids = mushroom.genera.pluck(:id)
                    scope = scope.where(genera_id: genera_ids)
                  end
                end

                # Use includes to eager load genera and avoid N+1 queries
                species_results = scope
                  .includes(:genus)
                  .select(:id, :name, :genera_id)
                  .order(:name)
                  .limit(20)

                species_results.map do |sp|
                  genus_label = sp.genus ? "#{sp.genus.name} " : ""
                  { id: sp.id, name: "#{genus_label}#{sp.name}" }
                end
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/trees.json?q=oak
  def trees
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Tree
                  .where("name LIKE ?", "%#{Tree.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |t| { id: t.id, name: t.name } }
              else
                []
              end
    render json: results
  end

  # GET /autocomplete/plants.json?q=fern
  def plants
    query = params[:q].to_s.strip
    results = if query.length >= 3
                Plant
                  .where("name LIKE ?", "%#{Plant.sanitize_sql_like(query)}%")
                  .select(:id, :name)
                  .order(:name)
                  .limit(20)
                  .map { |p| { id: p.id, name: p.name } }
              else
                []
              end
    render json: results
  end
end