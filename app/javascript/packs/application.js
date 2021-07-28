// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "./adminlte.min"
import "@fortawesome/fontawesome-free/js/all"
import "./flashMessages"
import "./datatable"
import './addfields'
import './removefields'

import "../src/application"

var jQuery = require("jquery")

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

Rails.start()
Turbolinks.start()
ActiveStorage.start()
