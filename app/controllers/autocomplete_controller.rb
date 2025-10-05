# frozen_string_literal: true

class AutocompleteController < ApplicationController
  before_action :authenticate_user!

  def genera
    q = params[:q].to_s.strip
    return render json: [] if q.length < 3

    items = Genus.where("name LIKE ?", "#{sanitize_like(q)}%")
                 .order(:name)
                 .limit(20)
                 .pluck(:id, :name)

    render json: items.map { |id, name| { id: id, label: name, value: name } }
  end

  def species
    q = params[:q].to_s.strip
    return render json: [] if q.length < 3

    scope = Species.order(:name)
    if params[:genus_id].present?
      scope = scope.where(genus_id: params[:genus_id])
    elsif params[:genus_name].present?
      if (g = Genus.find_by(name: params[:genus_name]))
        scope = scope.where(genus_id: g.id)
      end
    end

    items = scope.where("species.name LIKE ?", "#{sanitize_like(q)}%")
                 .includes(:genus)
                 .limit(20)
                 .map { |sp| { id: sp.id, label: "#{sp.genus&.name} #{sp.name}".strip, value: sp.name } }

    render json: items
  end

  private

  # Escape % and _ for LIKE queries
  def sanitize_like(term)
    term.gsub(/[\\%_]/) { |m| "\\#{m}" }
  end
end