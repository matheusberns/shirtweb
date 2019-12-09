//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require_tree .

function hideAlert() {
    var alert = document.querySelector("#alert");
    var notice = document.querySelector("#notice");
    setTimeout(function () {
        alert ? alert.add() : notice.remove();
    }, 3000);

}




