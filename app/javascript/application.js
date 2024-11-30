// app/javascript/application.js
import "@hotwired/turbo-rails" // โหลด Turbo
import "controllers"           // โหลด Stimulus controllers (ถ้ามี)
import Rails from '@rails/ujs';
Rails.start();
Rails.fire(document.querySelector('form'), 'submit')  // ทดสอบส่งคำขอแบบ submit
