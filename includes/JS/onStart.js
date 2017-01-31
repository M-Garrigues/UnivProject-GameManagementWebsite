$(document).ready(function()
{ 
  var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop(); // on récupère la distance "scrollée" depuis le bas de la page.
  if (scrollBottom<10) {
    $('#footer').css('position','absolute'); //Si elle est inférieure à 10 dès le chargement de la page ==> page non-scrollable, on fixe le footer en bas.  
  }



 
    var wh = $(window).height(); // on récupère la taille de la fenetre
    hb=wh/2 - 232; //c'est la hauteur à laquelle top de .stats devra être au début.

    $('.stats').css("top", hb);

    $(document).scroll(function() { // on détecte un scroll.

      var a = hb - ($(document).scrollTop())/2;

      if($(document).scrollTop() <= 80) 
      { 
        $('.stats').css("top", a);// et on bouge la partie statistiques en fonction.
      } 
      else 
      {
        $('.stats').css("top", hb-40);
      }
    });

});