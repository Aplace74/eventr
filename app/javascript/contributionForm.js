
const clickEventListener = (event, card, partInput, counter) => {
  let count = parseInt(counter.dataset.count, 10);
  const part = count;
  const rest = card.dataset.rest;
  const dataset = parseInt(event.currentTarget.dataset.offset, 10);
  const submitContribution = card.querySelector('.submit');
  const plus = card.querySelector('.plus');
  const minus = card.querySelector('.minus');

  count += dataset;
  counter.innerHTML = count;
  counter.dataset.count = count;
  partInput.value = count;
  if (count == part) {
    submitContribution.setAttribute('disabled', 'true');
    submitContribution.classList.add('inactive');
  } else { 
    submitContribution.removeAttribute('disabled');
    submitContribution.classList.remove('inactive');
  }
  if (count == rest) {
    plus.setAttribute('disabled', 'true');
  } else { plus.removeAttribute('disabled'); }
  if (count <= 0) {
    minus.setAttribute('disabled', 'true');
  } else { minus.removeAttribute('disabled'); }
}

bindEventListenersToCards = () => {
  const cards = document.querySelectorAll('.supply-card');
  
  cards.forEach((card) => {
    const rest = card.dataset.rest;
    const minus = card.querySelector('.minus');
    const plus = card.querySelector('.plus');
    const partInput = card.querySelector('.part');
    const incrementers = card.querySelectorAll('.incrementer');
    const counter = card.querySelector('.counter');

    incrementers.forEach((incrementer) => {
      let count = parseInt(counter.dataset.count, 10);
      
      if (count == rest) { plus.setAttribute('disabled', 'true'); }
      if (count <= 0) { minus.setAttribute('disabled', 'true'); }
      
      const el = (event) => clickEventListener(event, card, partInput, counter)
      const i = incrementer.cloneNode(true)
      
      incrementer.parentNode.replaceChild(i, incrementer)
      i.addEventListener('click', el);
    });
  });
}

document.addEventListener('DOMContentLoaded', bindEventListenersToCards)