import { Application } from "@hotwired/stimulus"
import MycowriterAutocomplete from "../../../../../../mycowriter_gem/mycowriter/app/javascript/mycowriter/autocomplete_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

// Register Mycowriter controller
application.register("mycowriter--autocomplete", MycowriterAutocomplete)

export { application }
