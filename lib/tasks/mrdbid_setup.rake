# frozen_string_literal: true

namespace :mrdbid do
  desc "Create MRDBID permissions, one admin user, and optionally one regular user"
  task setup_users: :environment do
    permissions = {
      1 => ["Owner", "Full system owner access"],
      2 => ["Admin", "Administrative access"],
      3 => ["Expert", "Expert access"],
      4 => ["Scholar", "Scholar access"],
      5 => ["Author", "Author access"],
      6 => ["Editor", "Editor access"],
      7 => ["Contributor", "Contributor access"],
      8 => ["Developer", "Developer access"],
      9 => ["Member", "Standard user access"]
    }

    permissions.each do |id, (name, description)|
      permission = Permission.find_or_initialize_by(id: id)
      permission.name = name
      permission.description = description if permission.description.blank?
      permission.save!
    end

    admin_email = required_env("ADMIN_EMAIL")
    admin_password = required_password("ADMIN_PASSWORD")
    create_user!(
      email: admin_email,
      password: admin_password,
      permission_id: 2,
      label: "admin"
    )

    regular_email = ENV["REGULAR_EMAIL"].presence
    regular_password = ENV["REGULAR_PASSWORD"].presence

    if regular_email.present? || regular_password.present?
      abort "REGULAR_EMAIL and REGULAR_PASSWORD must be provided together." unless regular_email.present? && regular_password.present?

      create_user!(
        email: regular_email,
        password: required_password("REGULAR_PASSWORD"),
        permission_id: 9,
        label: "regular"
      )
    else
      puts "Skipped regular user. Set REGULAR_EMAIL and REGULAR_PASSWORD to create one."
    end

    puts ""
    puts "MRDBID user setup complete."
    puts "Sign in with the email addresses you provided. Passwords were not printed or stored in documentation."
  end

  def required_env(name)
    value = ENV[name].to_s.strip
    abort "Missing #{name}. Example: #{name}=admin@example.com" if value.blank?

    value
  end

  def required_password(name)
    value = ENV[name].to_s
    abort "Missing #{name}. Use a unique password, 12+ characters." if value.blank?
    abort "#{name} must be at least 12 characters." if value.length < 12

    value
  end

  def create_user!(email:, password:, permission_id:, label:)
    user = User.find_or_initialize_by(email: email)
    user.password = password
    user.password_confirmation = password
    user.permission_id = permission_id
    user.display_name = email.split("@").first.titleize if user.respond_to?(:display_name) && user.display_name.blank?
    user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
    user.skip_confirmation_notification! if user.respond_to?(:skip_confirmation_notification!)
    user.save!

    puts "Created/updated #{label} user: #{email}"
  end
end
