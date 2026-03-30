# frozen_string_literal: true

# app/helpers/application_helper.rb
module ApplicationHelper
  DEFAULT_SEO_DESCRIPTION = "MRDBID is a mushroom field research notebook for documenting specimens, photos, and identification data.".freeze
  DEFAULT_OG_IMAGE = "mrdbid_facebook.png".freeze

  # Include Pundit methods for use in views
  include Pundit::Authorization

  def seo_site_name
    "MRDBID"
  end

  def seo_title
    raw_title = content_for?(:title) ? content_for(:title).to_s.strip : ""
    return seo_site_name if raw_title.blank?
    return raw_title if raw_title.downcase.include?(seo_site_name.downcase)

    "#{raw_title} | #{seo_site_name}"
  end

  def seo_description
    raw = content_for?(:meta_description) ? content_for(:meta_description).to_s : ""
    description = strip_tags(raw).squish
    description = DEFAULT_SEO_DESCRIPTION if description.blank?
    truncate(description, length: 160)
  end

  def seo_canonical_url
    return content_for(:canonical_url).to_s if content_for?(:canonical_url)

    "#{request.base_url}#{request.path}"
  end

  def seo_robots
    return content_for(:robots).to_s if content_for?(:robots)

    noindex = controller_path.start_with?("admin/") ||
      action_name.in?(%w[new edit]) ||
      controller_path.start_with?("users/")

    noindex ? "noindex, nofollow" : "index, follow"
  end

  def seo_og_type
    content_for?(:og_type) ? content_for(:og_type).to_s : "website"
  end

  def seo_og_image
    return content_for(:og_image).to_s if content_for?(:og_image)

    image_url(DEFAULT_OG_IMAGE)
  end

  # Returns the list of rendered templates/partials collected for this request
  def rendered_views_debug
    Array(Thread.current[:rendered_views]).uniq
  end

  # Replace underscores and make readable
  def character_display_name(name)
    return "" if name.blank?
    name.tr("_", " ")
  end

  # Determine display option key
  def display_option_key(character)
    (character.display_option&.name&.downcase.presence) || character.display_option_id.to_s
  end

  # LookupItem options for radio/drop-down, returns [[label, value], ...]
  def lookup_options_for(character)
    LookupItem.where(mr_character_id: character.id).order(:name).pluck(:name, :id)
  end

  # Check if current user is an elevated admin (Owner/Admin only)
  # This helper enables inline edit links for admins throughout the application.
  # Admin users can click edit icons next to characters and lookup items to quickly
  # edit definitions without leaving their current workflow.
  #
  # Returns true if user is signed in AND has elevated admin permissions (Owner/Admin only)
  # Returns false if user not signed in or not an admin
  #
  # Used in views to conditionally show admin-only edit links
  def admin_user?
    user_signed_in? && current_user.elevated_admin?
  end

  # Render an input for a given character based on its display option.
  # current_value comes from existing MrCharacterMushroom (string), may be a lookup_item id for radio/dropdown.
  def input_for_character(form:, character:, current_value: nil)
    key = display_option_key(character)

    case key
    when "color", "6"
      content_tag(:span, "Use color picker below", class: "text-xs text-gray-500")
    when "radio", "9"
      options = lookup_options_for(character)
      return content_tag(:span, "No options", class: "text-xs text-gray-500") if options.blank?

      content_tag(:div, class: "flex flex-col gap-1") do
        options.map do |label, value|
          id = "#{character.id}-#{value}"
          content_tag(:label, for: id, class: "inline-flex items-center gap-2") do
            form.radio_button(:character_value, value, id: id, checked: current_value.to_s == value.to_s) +
              content_tag(:span, label.to_s, class: "text-sm")
          end
        end.join.html_safe
      end
    when "drop-down", "10"
      options = lookup_options_for(character)
      return content_tag(:span, "No options", class: "text-xs text-gray-500") if options.blank?

      form.select(
        :character_value,
        options_for_select(options, current_value),
        { include_blank: "Select..." },
        class: "border rounded px-2 py-1 text-sm w-full max-w-xs"
      )
    when "text_box_number_mm", "text_box_number_um", "text_box_number", "2", "3", "4"
      form.number_field :character_value, step: "any", class: "border rounded px-2 py-1 text-sm w-full max-w-xs", value: current_value
    when "text_box_string", "5"
      form.text_field :character_value, class: "border rounded px-2 py-1 text-sm w-full max-w-xs", value: current_value
    when "taste", "7", "odor", "8"
      form.text_field :character_value, class: "border rounded px-2 py-1 text-sm w-full max-w-xs", value: current_value, placeholder: key
    when "state", "11", "country", "12"
      content_tag(:span, "Handled in location inputs", class: "text-xs text-gray-500")
    else
      form.text_field :character_value, class: "border rounded px-2 py-1 text-sm w-full max-w-xs", value: current_value
    end
  end
end
