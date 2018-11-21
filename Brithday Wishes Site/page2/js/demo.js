/**
 * Particleground demo
 * @author Jonathan Nicol - @mrjnicol
 */

$(document).ready(function() {
  $('#particles').particleground({
    dotColor: '#89D1FD',
    lineColor: '#00FFFF'
  });
  $('.wish').css({
    'margin-top': -($('.wish').height() / 2)
  });
});