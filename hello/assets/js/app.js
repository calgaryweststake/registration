// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import $ from "jquery"
import "jquery"
import "bootstrap"

// Make sure you included bootstrap js in your npm and brunch config files or this will not work
global.jQuery = require("jquery")
global.bootstrap = require("bootstrap")

// Do the stuff to the existing html at page load time:
$(document).ready(function () {
    function onchangefirstname() {
        var box1 = $('#youth_emergency_first_name');
        var box2 = $('#youth_permission_first_name');
        box2.val(box1.val());
    }
    function onchangelastname() {
        var box1 = $('#youth_emergency_last_name');
        var box2 = $('#youth_permission_last_name');
        box2.val(box1.val());
    }
    function onchangephonenumber() {
        var box1 = $('#youth_emergency_primary_number');
        var box2 = $('#youth_permission_number');
        box2.val(box1.val());
    }
    $('#youth_emergency_first_name').on('change', onchangefirstname);
    $('#youth_emergency_last_name').on('change', onchangelastname);
    $('#youth_emergency_primary_number').on('change', onchangephonenumber);
});
