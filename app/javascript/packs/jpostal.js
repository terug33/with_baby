// 地図機能

function jpostal() {
  $('#store_zip_code').jpostal({
    postcode : ['#store_zip_code'],
    address : {
      '#store_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);