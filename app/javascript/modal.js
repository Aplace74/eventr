let categoryForm = document.getElementById("category_id")
const buttons = document.querySelectorAll(".btn-modal")

const passParams = (id) => {
  categoryForm.value = id
};

buttons.forEach((button) => {
  button.addEventListener('click', (event) => {
    passParams(event.currentTarget.dataset.category);
  });
});
