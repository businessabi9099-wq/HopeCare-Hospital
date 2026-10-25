document.addEventListener("DOMContentLoaded", () => {
  // ===== BUILDING SLIDER - ARROW MATTUM =====
  let i = 0;
  const slides = document.querySelectorAll(".building-slide");
  const next = document.querySelector(".arrow.next");
  const prev = document.querySelector(".arrow.prev");
  
  function show(n) {
    if (!slides.length) return;
    if (n >= slides.length) i = 0;
    else if (n < 0) i = slides.length - 1;
    else i = n;
    slides.forEach(s => s.classList.remove("active"));
    slides[i].classList.add("active");
  }
  if(next) next.addEventListener("click", () => show(i+1));
  if(prev) prev.addEventListener("click", () => show(i-1));

  // ===== MENU =====
  window.toggleMenu = () => {
    document.getElementById("sideMenu").classList.add("open");
  }
  window.closeMenu = () => {
    document.getElementById("sideMenu").classList.remove("open");
  }

  // ===== SCROLL TO ANY SECTION =====
  window.goTo = (id) => {
    const el = document.getElementById(id);
    if (el) {
      el.scrollIntoView({ behavior: "smooth" });
      closeMenu();
    }
  }
  // ===== ALL BLUE BUTTONS FIX =====
  window.viewDoctors = () => goTo('doctors');
  window.bookAppointment = () => goTo('appointment');
  window.viewFacilities = () => goTo('facilities');
  window.viewLocation = () => goTo('location');
  window.viewReviews = () => goTo('reviews');
});
// EMERGENCY POPUP
window.openEmergency = () => {
    const popup = document.getElementById("emergencyPopup");
    if (popup) {
        popup.classList.add("show");
    }
};

window.closeEmergencyPopup = () => {
    const popup = document.getElementById("emergencyPopup");
    if (popup) {
        popup.classList.remove("show");
    }
};
