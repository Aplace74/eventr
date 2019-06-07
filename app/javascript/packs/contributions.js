import { id } from "postcss-selector-parser";

export function changeContribution() {
  const todo = document.querySelector('.todo');

  if (todo) {
    const inputs = todo.querySelectorAll('input')
    inputs.forEach((input) => {
      input.addEventListener("click", (event) => {
        const id = event.srcElement.id;
        postState(id)
      });
    });
  }
}

const postState = (id) => {
  fetch(`/contributions/${id}/change-state`, {
    method: "POST"
  })
};