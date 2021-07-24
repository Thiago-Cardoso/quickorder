import Toastify from "toastify-js";

  document.addEventListener('DOMContentLoaded', () => {
    const backgroundColors = {
      alert: "#f44336",
      error: "#f44336",
      notice: "#009688"
    }
    JSON.parse(document.body.dataset.flashMessages).forEach(flashMessage => {
      const [type, message] = flashMessage;
      Toastify(
        {
          text: message,
          duration: 3000,
          close: true,
          backgroundColor: backgroundColors[type],
          stopOnFocus: true
        }
      ).showToast();
    });
  });
