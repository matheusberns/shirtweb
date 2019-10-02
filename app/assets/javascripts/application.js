//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function hideAlert() {
    var alert = document.querySelector("#alert");
    var notice = document.querySelector("#notice");
    setTimeout(function () {
        alert ? alert.remove() : notice.remove();
    }, 3000);

}

function openProdut() {
    alert('Clicked!');
}
