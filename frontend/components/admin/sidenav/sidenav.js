import "./sidenav.css";

function initSidenav() {
  const elems = document.querySelectorAll(".sidenav");
  M.Sidenav.init(elems);
}

document.addEventListener("DOMContentLoaded", initSidenav);
