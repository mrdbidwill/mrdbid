import { Application } from "@hotwired/stimulus"
import TokensController from "controllers/tokens_controller"
import CountrySelectController from "controllers/country_select_controller"

const application = Application.start()
application.register("tokens", TokensController)
application.register("country-select", CountrySelectController)
