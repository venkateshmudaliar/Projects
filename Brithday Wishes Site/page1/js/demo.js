/**
 * Particleground demo
 * @author Jonathan Nicol - @mrjnicol
 */

$(document).ready(function() {
  $('#particles').particleground({
    dotColor: '#66D9EF',
    lineColor: '#66CBFF'
  });
  $('.wish').css({
    'margin-top': -($('.wish').height() / 2)
  });
});