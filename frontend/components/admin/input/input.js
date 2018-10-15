import Stackedit from "stackedit-js";
import "./input.css";

function initCharacterCounter() {
  const elems = document.querySelectorAll("[data-length]");
  M.CharacterCounter.init(elems);
}

function initStackEdit(field) {
  field.addEventListener("click", () => {
    const stackedit = new Stackedit();

    stackedit.on("fileChange", file => {
      field.value = file.content.text;
      M.updateTextFields();
    });

    stackedit.openFile({
      name: field.id,
      content: {
        text: field.value
      }
    });
  });
}

document.addEventListener("DOMContentLoaded", initCharacterCounter);
document.querySelectorAll(".markdown").forEach(field => {
  initStackEdit(field);
});
