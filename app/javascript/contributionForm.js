const cards = document.querySelectorAll('.supply-card');

cards.forEach((card) => {
  const minus = card.querySelector('.minus');
  const plus = card.querySelector('.plus');
  const partInput = card.querySelector('.part');
  const incrementers = card.querySelectorAll('.incrementer');
  const counter = card.querySelector('.counter');
  const submitContribution = card.querySelector('.submit');
  let count = parseInt(counter.dataset.count, 10);
  const rest = parseInt(card.dataset.rest, 10) + count;

  incrementers.forEach((incrementer) => {
    if (count == rest) { plus.setAttribute('disabled', 'true'); }
    if (count <= 0) { minus.setAttribute('disabled', 'true'); }
    const part = count;
    incrementer.addEventListener('click', (event) => {
      let count = parseInt(counter.dataset.count, 10);
      count += parseInt(event.currentTarget.dataset.offset, 10);
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