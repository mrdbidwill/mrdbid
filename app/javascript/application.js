import { Application } from "@hotwired/stimulus"
import TokensController from "controllers/tokens_controller"

const application = Application.start()
application.register("tokens", TokensController)
