// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('turbo:frame-load', (event) => {
  if (event.target.id === "favorite_modal_frame") {
    const favoriteModal = new bootstrap.Modal(document.getElementById('favoriteModal'));
    favoriteModal.show();
  }
});
