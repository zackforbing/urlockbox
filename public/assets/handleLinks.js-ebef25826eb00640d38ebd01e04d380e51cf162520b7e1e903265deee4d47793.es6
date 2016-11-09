$(document).ready(() => {
  $('.read-btn').on('click', toggleReadStatus);
  $('#search-links').on('keyup', filterBySearch);
  $('#unread-filter, #read-filter').on('click', filterByStatus);
  $('#show-all').on('click', showAllLinks);
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
    if ($link.data("read")) {
      $link.data("read",false);
      $link.find('.read-btn').prop('value', 'Mark as Read');
      $link.removeClass('link-read-true');
    } else {
      $link.data("read",true);
      $link.find('.read-btn').prop('value', 'Mark as Unread');
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

function handleError(error) {
  console.log(error);
}
