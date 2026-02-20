# frozen_string_literal: true

# Skip Pundit authorization for AutoGlossary engine
# See RAILS_ENGINE_SETUP.md for why this is necessary
#
# Problem: ApplicationController has `after_action :verify_authorized` which applies
# to ALL controllers including mounted engine controllers. The AutoGlossary engine
# controllers don't call `authorize`, causing 401 Unauthorized errors.
#
# Solution: Skip Pundit verification for AutoGlossary controllers
Rails.application.config.to_prepare do
  AutoGlossary::GlossaryController.class_eval do
    skip_after_action :verify_authorized
    skip_after_action :verify_policy_scoped
  end
end