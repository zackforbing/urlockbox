$(document).ready(() => {
  $('.read-btn').on('click', updateReadStatus);
});

function toggleReadStatus() {
  e.preventDefault();
  let $link = $(this).closest("tr");
  let linkParams = 

  $.ajax( {
    url: "api/v1/links/" + $link.data("id"),
    data: linkParams,
    type: "put"
  })
  .fail(handleError);
}

function handleError(error) {
  console.log(error);
}
