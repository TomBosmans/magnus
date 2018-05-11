import "./input.css";

function initCharacterCounter() {
  const elems = document.querySelectorAll("[data-length]");
  M.CharacterCounter.init(elems);
}

document.addEventListener("DOMContentLoaded", initCharacterCounter);
