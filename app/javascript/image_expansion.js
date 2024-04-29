document.addEventListener("DOMContentLoaded", function() {
  const images = document.querySelectorAll('.archive-image img');
  const previewPane = document.getElementById('preview-pane');
  const previewImage = previewPane.querySelector('img');

  images.forEach(image => {
    image.addEventListener('mouseover', function() {
      // フルサイズ画像のURLを取得して設定
      const fullSizeUrl = this.dataset.fullsize;
      previewImage.src = fullSizeUrl;
      previewImage.alt = "Full-size image preview";
      previewPane.style.display = 'block'; // ビューウインドウを表示
    });

    image.addEventListener('mouseout', function() {
      previewPane.style.display = 'none'; // ビューウインドウを非表示
    });
  });
});