$(function() {
  $('#alimentos_search input').on('input', function(e) {
    $.get(
      $('#alimentos_search').attr('action'),
      $('#alimentos_search').serialize(),
      null,
      'script'
    );
  });
});
