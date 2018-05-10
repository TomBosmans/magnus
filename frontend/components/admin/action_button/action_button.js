import "./action_button.css";

function initActionButton() {
  const elems = document.querySelectorAll(".fixed-action-btn");
  M.FloatingActionButton.init(elems);
}

document.addEventListener("DOMContentLoaded", initActionButton);
