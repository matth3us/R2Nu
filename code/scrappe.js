var pagamentos = artoo.scrape('.event-card.transaction.card_present, .event-card.event.payment, .event-card.transaction.card_not_present', {
  id:{
    attr: 'id'
  },
  categoria: {
    sel: '.title',
    method: 'text'
  },
  payee: {
    sel: '.description',
    method: 'text'
  },
  valor: {
    sel: '.amount',
    method: 'text'
  },
  tag: {
    sel: '.tag',
    method: 'text'
  },
  dia: {
    sel: '.time',
    method: 'text'
  },
});

function addZero(dat){
  var str = String(dat);
  if(str.length < 2){return ['0', str].join('');}
  else{return str;}
}

var hoje = new Date();
var nome = ['nubank_',
            [hoje.getFullYear(), addZero(hoje.getMonth()+1), addZero(hoje.getDate())].join('-')
          ].join('');

artoo.saveJson(pagamentos, {filename: nome});
