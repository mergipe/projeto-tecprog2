function showModal() {
    if ($('.modal-backdrop').length) {
        $('.modal-backdrop').remove();
        $('#modal').find('.modal').removeClass('fade');
    }

    $('#modal').find('.modal').modal('show');
    $('#modal').find('.modal').addClass('fade');
    $('.modal-backdrop').addClass('fade');
}

function showSmallModal() {
    $('#modal').find('.modal-dialog').removeClass('modal-lg');
    $('#modal').find('.modal-dialog').addClass('modal-sm');
    showModal();
}

function showLargeModal() {
    $('#modal').find('.modal-dialog').removeClass('modal-sm');
    $('#modal').find('.modal-dialog').addClass('modal-lg');
    showModal();
}
