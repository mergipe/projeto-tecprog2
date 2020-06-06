//= require_tree .

document.addEventListener("turbolinks:load", function() {
    $("tr[data-link]").click(function() {
        window.location = $(this).data("link");
    });
});

