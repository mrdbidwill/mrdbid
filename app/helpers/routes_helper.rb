module RoutesHelper
  def genera_autocomplete_path
    url_for(controller: "autocomplete", action: "genera", only_path: true)
  end

  def species_autocomplete_path
    url_for(controller: "autocomplete", action: "species", only_path: true)
  end
end
