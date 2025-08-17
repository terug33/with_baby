
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "jquery-raty-js";
import "../stylesheets/application"; 

Rails.start()
Turbolinks.start()
ActiveStorage.start()
