
window.addEventListener("DOMContentLoaded", initializeDash);

function initializeDash() {
    var bmk = document.getElementById("recipeBookmark");
    bmk.addEventListener('mouseover', function() {
        if (bmk.innerHTML.includes('fa fa-bookmark-o')){ //if recipe is not saved
            bmk.innerHTML ='<a id="recipeBookmark"><i class="fa fa-bookmark"></i></a>';
        }
        else {
            bmk.innerHTML ='<a id="recipeBookmark"><i class="fa fa-bookmark-o"></i></a>';
        }
    });
    bmk.addEventListener('mouseleave', function() {
        bmk.innerHTML ='<a id="recipeBookmark"><i class="fa fa-bookmark-o"></i></a>';
    });
}