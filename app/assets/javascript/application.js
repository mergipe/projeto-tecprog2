//= require jquery
//= require bootstrap
//= require_tree .

$("tr[data-link]").click(function() {
    window.location = $(this).data("link");
});

