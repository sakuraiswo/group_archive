function capture() {
  html2canvas(document.querySelector("#content")).then(canvas => {
      document.body.appendChild(canvas);
      var image = canvas.toDataURL("image/png");
      var link = document.createElement('a');
      link.href = image;
      link.download = 'capture.png';
      link.click();
  });
}