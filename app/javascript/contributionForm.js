const cards = document.querySelectorAll('.supply-card');

cards.forEach((card) => {
  const rest = card.dataset.rest;
  const minus = card.querySelector('.minus');
  const plus = card.querySelector('.plus');
  const partInput = card.querySelector('.part');
  const incrementers = card.querySelectorAll('.incrementer');
  const counter = card.querySelector('.counter');
  const submitContribution = card.querySelector('.submit');
  incrementers.forEach((incrementer) => {
    let count = parseInt(counter.dataset.count, 10);
    const part = count;
    if (count == rest) { plus.setAttribute('disabled', 'true'); }
    if (count <= 0) { minus.setAttribute('disabled', 'true'); }
    incrementer.addEventListener('click', (event) => {
      let count = parseInt(counter.dataset.count, 10);
      const dataset = parseInt(event.currentTarget.dataset.offset, 10);
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
    });
  });
});