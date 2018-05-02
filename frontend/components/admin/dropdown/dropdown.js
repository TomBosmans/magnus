import "./dropdown.css";

function initDropdowns() {
  const options = { coverTrigger: false, hover: true };
  const elems = document.querySelectorAll(".dropdown-trigger");
  M.Dropdown.init(elems, options);
}

document.addEventListener("DOMContentLoaded", initDropdowns);
