// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "controllers"

ActiveStorage.start()

// Auto-dismiss flash notices after 5 seconds
document.addEventListener('turbo:load', () => {
  const notices = document.querySelectorAll('[data-auto-dismiss="true"]');
  notices.forEach(notice => {
    setTimeout(() => {
      notice.style.opacity = '0';
      setTimeout(() => notice.remove(), 500);
    }, 5000);
  });
});

// Initialize AdSense ad units on first page load and Turbo navigations.
document.addEventListener('turbo:load', () => {
  const adSlots = document.querySelectorAll('ins.adsbygoogle:not([data-adsense-initialized])');
  if (!adSlots.length) return;

  adSlots.forEach((slot) => {
    try {
      (window.adsbygoogle = window.adsbygoogle || []).push({});
      slot.setAttribute('data-adsense-initialized', 'true');
    } catch (_) {
      // Ignore if the ad script is still loading or blocked by browser settings.
    }
  });
});
