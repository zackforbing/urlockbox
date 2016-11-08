$(document).ready(() => {
  $('.read-btn').on('click', toggleReadStatus);
});

function toggleReadStatus(e) {
  e.preventDefault();
  let $link = $(this).closest("tr");
  let linkParams = {
    link: {
      read: !$link.data("read")
    }
  };

  $.ajax( {
    url: `api/v1/links/${$link.data("id")}`,
    data: { link: { read: !$link.data("read")} },
    type: "put",
    dataType: "json"
  })
  .fail(handleError)
  .success(() => {
    if ($link.data("read")) {

      $link.data('read', true);
      $link.find('read-btn').html("Mark as Unread");
    } else {
      $link.data('read', false);
      $link.find('read-btn').html("Mark as Read");
    }
  });
}

function handleError(error) {
  console.log(error);
}


// title: $(this).parent().find(".editable-title").html(),
// url: $(this).parent().find(".editable-url").html()
