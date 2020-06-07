$("tr[data-href]").click(function() {
    var link = $(this).data('href');
    window.location = link;
});
