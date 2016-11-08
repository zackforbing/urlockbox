$(document).ready(() => {
  $('.read-btn').on('click', toggleReadStatus);
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
  let searchQuery = $('#search').val();
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

function handleError(error) {
  console.log(error);
}


// title: $(this).parent().find(".editable-title").html(),
// url: $(this).parent().find(".editable-url").html()
