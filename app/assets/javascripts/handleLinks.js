$(document).ready(() => {
  $('.read-btn').on('click', toggleReadStatus);
});

function toggleReadStatus(e) {
  e.preventDefault();
  let $link = $(this).closest("tr");
  let linkParams = {
    read: !$link.data("read")
  };

  $.ajax( {
    url: "api/v1/links/" + $link.data("id"),
    data: linkParams,
    type: "put"
  })
  .fail(handleError);
  .success();
}

function handleError(error) {
  console.log(error);
}


// title: $(this).parent().find(".editable-title").html(),
// url: $(this).parent().find(".editable-url").html()
