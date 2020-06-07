$("tr[data-href]").click(function() {
    var link = $(this).data('href');
    $.ajax ({
        type: 'GET',
        url: link
    });
});
