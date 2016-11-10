$(document).ready(() => {
  $('.read-btn').on('click', toggleReadStatus);
  $('#search-links').on('keyup', filterBySearch);
  $('#unread-filter, #read-filter').on('click', filterByStatus);
  $('#show-all').on('click', showAllLinks);
  $('#alpha').on('click', alphabetSort);
});

function toggleReadStatus(e) {
  e.preventDefault();
  let $link = $(this).closest("tr");

  $.ajax( {
    url: `api/v1/links/${$link.data("id")}`,
    data: { link: { read: !$link.data("read")} },
    type: "put",
    dataType: "json"
  })
  .fail(handleError)
  .success(() => {
    if ($link.hasClass('link-read-true')) {
      $link.find('.read-btn').prop('value', 'Mark as Read');
      $link.removeClass('link-read-true');
      $link.addClass('link-read-false');
    } else {
      $link.find('.read-btn').prop('value', 'Mark as Unread');
      $link.removeClass('link-read-false');
      $link.addClass('link-read-true');
    }
  });
}

function filterBySearch() {
  let searchQuery = $('#search-links').val();
  let links = $('.link');

  links.each(function(link) {
    let title = $(this).find(".editable-title").text();
    let url = $(this).find(".editable-url").text();

    if (title.includes(searchQuery) || url.includes(searchQuery)) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function filterByStatus(e) {
  e.preventDefault();
  let links = $('.link');
  let status = this.id === "read-filter" ? true : false;
  links.each((index, link) => {
    if($(link).hasClass(`link-read-${status}`)) {
      $(link).hide();
    } else {
      $(link).show();
    }
  });
}
function showAllLinks(e) {
  e.preventDefault();
  let links = $('.link');
  links.each((index, link) => {
    $(link).show();
  });
}

function alphabetSort(e) {
  e.preventDefault();
  let links = $('.link');

  links.sort((a, b) => {
    return $(a).find('.editable-title').text().toLowerCase().localeCompare($(b).find('.editable-title').text().toLowerCase());
  });
  $.each(links, (index, link) => { $('#link-table').find('tbody').append(link); });
}

function handleError(error) {
  console.log(error);
}
