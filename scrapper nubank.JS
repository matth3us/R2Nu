var pagamentos = artoo.scrape('.event-card.transaction.card_present, .event-card.event.payment, .event-card.transaction.card_not_present', {
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

artoo.saveCsv(pagamentos);
