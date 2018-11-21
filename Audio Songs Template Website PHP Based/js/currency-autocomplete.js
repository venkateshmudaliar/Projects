$(function(){
  var currencies = [
    { value: 'Pitbull', data: '' },
    { value: 'Akon', data: '' }
   
  ];
  
  // setup autocomplete function pulling from currencies[] array
  $('#autocomplete').autocomplete({
    lookup: currencies,
    onSelect: function (suggestion) {
      window.open("currencies.value/currencies.value.html","_self")
    }
  });
  

});