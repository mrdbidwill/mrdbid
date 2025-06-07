import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

import "@hotwired/turbo-rails"
import "controllers"
import "rails-ujs" // Ensure UJS is included
Rails.start();

export { application }