<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,java.util.Map" %>
<!DOCTYPE html>
<button onclick="goTo('Departments')">Departments</button>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HopeCare Hospital</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="top-bar">
  <strong>🏥 HopeCare Hospital</strong>
  <div class="top-right">
     <a href="#about">About us</a>
    <a href="#home">Home</a>
    <button class="emergency-button" onclick="openEmergency()">🚨 Emergency</button>
  </div>
</div>

<header class="main-header">
  <button class="menu-icon" onclick="toggleMenu()" aria-label="Open menu">☰</button>
  <div class="logo-area">
    <span class="hospital-symbol">🏥</span>
    <div><h1>HopeCare Hospital</h1><p>Your health, our care</p></div>
  </div>
</header>

<nav class="side-menu" id="sideMenu">
  <button type="button" class="close-menu" onclick="closeMenu()">×</button>
  <a href="#home" onclick="closeMenu()">🏠 Home</a>
  <a href="#facilities" onclick="closeMenu()">🏥 Hospital Facilities</a>
  <a href="#doctors" onclick="closeMenu()">👨‍⚕️ Doctors</a>
  <a href="#nurses" onclick="closeMenu()">👩‍⚕️ Nurses</a>
  <a href="#departments" onclick="closeMenu()">🩺 Departments</a>
  <a href="#appointment" onclick="closeMenu()">📅 Appointment</a>
  <a href="#location" onclick="closeMenu()">📍 Hospital Location</a>
  <a href="#reviews" onclick="closeMenu()">⭐ Patient Reviews</a>
  <a href="#about" onclick="closeMenu()">ℹ️ About Us</a>
</nav>

<main>  
<div class="home-container" id="home">
  <div class="welcome-section">
    <h2>Welcome to HopeCare Hospital</h2>
    <p>Quality healthcare with compassion, technology and trust.</p>

    <div class="button-area">
      <button onclick="goTo('doctors')">👨‍⚕️ View Doctors</button>
      <button onclick="goTo('appointment')">📅 Book Appointment</button>
      <button onclick="goTo('department')">🏥 Departments</button>
    </div>

    <div class="dashboard">
      <article class="dashboard-card">
        <h3>🏥 Hospital Facilities</h3>
        <p>Explore our modern facilities and patient care services.</p>
        <button onclick="goTo('facilities')">Facilities</button>
      </article>

      <article class="dashboard-card">
        <h3>📍 Hospital Location</h3>
        <p>Find our hospital location and directions.</p>
        <button onclick="goTo('location')">Location</button>
      </article>

      <article class="dashboard-card">
        <h3>⭐ Patient Reviews</h3>
        <p>Read feedback shared by our patients.</p>
        <button onclick="goTo('reviews')">View Reviews</button>
      </article>
    </div>
  </div>

  <div class="home-image">
    <img src="Image/hope.JPG" alt="HopeCare Hospital">
  </div>
</div>
<!-- ================= BUILDINGS - FIXED ================= -->
<section class="building-section" id="buildings">
    <section id="departments" class="page-section content-section">
  <div
   class="section-title"><h2>our Hospital Departments</h2>
    <p>Expert care for every medical need</p></div>
  <div class="department-list">
    <article class="department-item">❤️ Cardiology</article><article class="department-item">🧠 Neurology</article>
    <article class="department-item">🦴 Orthopaedics</article><article class="department-item">🧸 Paediatrics</article>
    <article class="department-item">🩺 General Medicine</article>
  </div>
 </section>
    <div class="building-slider">
        <div class="building-slide active">
            <img src="Image/Building1.JPG" alt="Main Building">
            <div class="building-info">
                <h3>Main Building - Block A</h3>
                <p>Cardiology - 1st Floor </p>
                <p> Neurology - 2nd Floor</p> 
                <p>Emergency & ICU - Ground Floor</p>
            </div>
        </div>

        <div class="building-slide">
            <img src="Image/Building2.JPG" alt="Specialty Block">
            <div class="building-info">
                <h3>Specialty Block - Block B</h3>
                <p>Orthopedics - 1st Floor</p>
                <p> Pediatrics - 2nd- 1st Floor Floor</p> 
                <P>Emergency & ICU - Ground Floor </p>
            </div>
        </div>

        <div class="building-slide">
            <img src="Image/Building3.JPG" alt="Admin Block">
            <div class="building-info">
                <h3>Admin & Director - Block C</h3>
                <p>Director Office, Accounts, Management - Full Control Block</p>
            </div>
        </div>

        <button class="arrow prev">&#10094;</button>
        <button class="arrow next">&#10095;</button>
    </div>
</section>

<section id="facilities" class="page-section content-section">
  <div class="section-title"><h2>Hospital Facilities</h2><p>Comfort and support for patients and visitors</p></div>
  <div class="facilities">
    <article class="facility"><span>🚗</span><h3>Car Parking</h3><p>Convenient parking for visitors.</p></article>
    <article class="facility"><span>🚻</span><h3>Clean Toilets</h3><p>Clean restroom facilities.</p></article>
    <article class="facility"><span>💧</span><h3>Drinking Water</h3><p>Drinking water for patients and visitors.</p></article>
    <article class="facility"><span>🍱</span><h3>Food</h3><p>Food facilities for patients and visitors.</p></article>
    <article class="facility"><span>☎️</span><h3>Call Support</h3><p>Contact hospital support.</p></article>
  </div>
  <div class="page-navigation"><button onclick="goTo('home')">← Previous</button><button onclick="goTo('doctors')">Next →</button></div>
</section>

<section id="doctors" class="page-section content-section">
  <div class="section-title"><h2>Our Doctors</h2><p>Experienced specialists dedicated to your care</p></div>
  <div class="cards">
    <article class="card"><img src="Image/Vijay.JPG" alt="Dr. Vijay"><div class="card-content"><h3>Dr. Vijay</h3><p>Cardiologist</p><p>10+ Years Experience</p><p>Mon–Fri | 10 AM–2 PM</p><div class="card-buttons"><a class="small-btn" href="tel:8489460395">☎️ Call</a><button class="small-btn" onclick="videoCall()">📹 Video Call</button></div></div></article>
    <article class="card"><img src="Image/Priya.JPG" alt="Dr. Priya"><div class="card-content"><h3>Dr. Priya</h3><p>Neurologist</p><p>12+ Years Experience</p><p>Mon–Sat | 2 PM–6 PM</p><div class="card-buttons"><a class="small-btn" href="tel:9655768409">☎️ Call</a><button class="small-btn" onclick="videoCall()">📹 Video Call</button></div></div></article>
    <article class="card"><img src="Image/Mathes.JPG" alt="Dr. Mathes"><div class="card-content"><h3>Dr. Mathes</h3><p>Orthopaedic</p><p>17+ Years Experience</p><p>Mon–Fri | 9 AM–1 PM</p><div class="card-buttons"><a class="small-btn" href="tel:1135661797">☎️ Call</a><button class="small-btn" onclick="videoCall()">📹 Video Call</button></div></div></article>
    <article class="card"><img src="Image/Kavitha.JPG" alt="Dr. Kavitha"><div class="card-content"><h3>Dr. Kavitha</h3><p>Paediatrician</p><p>8+ Years Experience</p><p>Mon–Fri | 9 AM–1 PM</p><div class="card-buttons"><a class="small-btn" href="tel:8973425468">☎️ Call</a><button class="small-btn" onclick="videoCall()">📹 Video Call</button></div></div></article>
    <article class="card"><img src="Image/Dharun.JPG" alt="Dr. Dharun"><div class="card-content"><h3>Dr. Dharun</h3><p>General Physician</p><p>15+ Years Experience</p><p>Mon–Sat | 8 AM–12 PM</p><div class="card-buttons"><a class="small-btn" href="tel:8973425682">☎️ Call</a><button class="small-btn" onclick="videoCall()">📹 Video Call</button></div></div></article>
  </div>
  <div class="page-navigation"><button onclick="goTo('facilities')">← Previous</button><button onclick="goTo('nurses')">Next →</button></div>
</section>

<section id="nurses" class="page-section nurse-section">
  <div class="section-title"><h2>Our Nurses</h2><p>Dedicated nursing care in every department</p></div>
  <div class="nurse-summary"><h3>1000+ Nurses Available</h3><p>Every hospital section has dedicated nursing staff.</p><p>🚨 Emergency nurses are available 24/7.</p></div>
  <div class="nurse-departments">
    <article class="nurse-department"><h3>Cardiology</h3><p class="nurse-count">200+ Nurses</p><p>Day &amp; Night Shifts</p><p>🚨 Emergency Support: 7 Nurses</p></article>
    <article class="nurse-department"><h3>Neurology</h3><p class="nurse-count">180+ Nurses</p><p>Day &amp; Night Shifts</p><p>🚨 Emergency Support: 5 Nurses</p></article>
    <article class="nurse-department"><h3>Orthopaedics</h3><p class="nurse-count">160+ Nurses</p><p>Day &amp; Night Shifts</p><p>🚨 Emergency Support: 6 Nurses</p></article>
    <article class="nurse-department"><h3>Paediatrics</h3><p class="nurse-count">160+ Nurses</p><p>Day &amp; Night Shifts</p><p>🚨 Emergency Support: 7 Nurses</p></article>
    <article class="nurse-department"><h3>General Medicine</h3><p class="nurse-count">160+ Nurses</p><p>Day &amp; Night Shifts</p><p>🚨 Emergency Support: 4 Nurses</p></article>
  </div>
  <div class="page-navigation"><button onclick="goTo('doctors')">← Previous</button><button onclick="goTo('appointment')">Next →</button></div>
</section>
<section id="appointment" class="page-section appointment-section">
  <div class="appointment-card">
    <h2>📅 Book an Appointment</h2><p class="appointment-subtitle">Schedule your visit with our specialist doctors</p>
    <form id="appointmentForm">
      <label for="patientName">Patient Name</label><input id="patientName" name="patientName" required maxlength="80">
      <label for="patientPhone">Mobile Number</label><input id="patientPhone" name="patientPhone" type="tel" pattern="[0-9]{10}" maxlength="10" inputmode="numeric" required>
      <label for="doctorId">Choose Doctor</label>
      <select id="doctorId" name="doctorId" required>
        <option value="">Select a doctor</option><option value="1">Dr. Vijay - Cardiologist</option><option value="2">Dr. Priya - Neurologist</option><option value="3">Dr. Mathes - Orthopaedic</option><option value="5">Dr. Kavitha - Paediatrician</option><option value="6">Dr. Dharun - General Physician</option>
      </select>
      <label for="appointmentDate">Appointment Date</label><input id="appointmentDate" name="date" type="date" required>
      <label for="appointmentTime">Appointment Time</label>
      <select id="appointmentTime" name="time" required>
        <option value="">Select a time</option><option>09:00 AM</option><option>10:00 AM</option><option>11:00 AM</option><option>12:00 PM</option><option>01:00 PM</option><option>02:00 PM</option><option>03:00 PM</option><option>04:00 PM</option><option>05:00 PM</option><option>06:00 PM</option>
      </select>
      <button type="submit" class="appointment-submit">Check &amp; Book Appointment</button>
      <p id="bookingMessage" aria-live="polite"></p>
    </form>
  </div>
  <div class="page-navigation"><button onclick="goTo('departments')">← Previous</button><button onclick="goTo('location')">Next →</button></div>
</section>
<section id="location" class="page-section content-section location">
  <div class="section-title"><h2>Hospital Location</h2><p>Find HopeCare Hospital on Google Maps</p></div>
  <div class="map-box"><iframe title="Coimbatore map" src="https://www.google.com/maps?q=Coimbatore,Tamil%20Nadu&output=embed" loading="lazy"></iframe>
    <a class="map-btn" href="https://www.google.com/maps/search/?api=1&query=HopeCare+Hospital+Coimbatore" target="_blank" rel="noopener">📍 Open Google Maps</a>
  </div>
  <div class="page-navigation"><button onclick="goTo('appointment')">← Previous</button><button onclick="goTo('reviews')">Next →</button></div>
</section>

<section id="reviews" class="page-section patient-review-page">
  <div class="review-heading"><h2>⭐ Patient Reviews</h2><p>Your experience helps us provide better healthcare.</p></div>
  <div class="review-form-card">
    <h3>Share Your Experience</h3>
    <form class="review-form" action="hospital" method="post">
      <input type="hidden" name="action" value="review">
      <label for="reviewPatientName">Your Name</label><input id="reviewPatientName" name="patientName" maxlength="80" required>
      <label>Rate Your Experience</label>
      <div class="star-rating">
        <input type="radio" id="star5" name="rating" value="5" required><label for="star5">★</label>
        <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
        <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
        <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
        <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
      </div>
      <label for="reviewComments">Your Review</label><textarea id="reviewComments" name="comments" rows="4" maxlength="1000" required></textarea>
      <button type="submit" class="submit-btn">Submit Review</button>
    </form>
  </div>
  <div class="submitted-reviews">
    <h3>What Our Patients Say</h3>
    <div class="reviews-list">
    <%
      List<Map<String,Object>> reviews = (List<Map<String,Object>>) request.getAttribute("reviews");
      if (reviews != null && !reviews.isEmpty()) {
        for (Map<String,Object> review : reviews) {
          int rating = ((Number)review.get("rating")).intValue();
    %>
      <article class="review-card"><h4><%= review.get("patientName") %></h4>
        <div class="display-stars"><% for(int i=1;i<=5;i++){ %><span class="<%= i<=rating ? "filled" : "" %>">★</span><% } %></div>
        <p><%= review.get("comments") %></p>
      </article>
    <% } } else { %>
      <p class="empty-reviews">No reviews yet. Be the first to share your experience!</p>
    <% } %>
    </div>
  </div>
  <div class="page-navigation"><button onclick="goTo('location')">← Previous</button><button onclick="goTo('about')">Next → About Us</button></div>
</section>

<section id="about" class="page-section content-section">
  <div class="section-title"><h2>About Us</h2><p>HopeCare Hospital — Your health, our care</p></div>
  <div class="about-card">
   <h3>*1.Compassionate & Expert Care:*</h3>
HopeCare Hospital provides quality healthcare with compassion, trust and advanced technology.
We have specialist doctors with 10+ years of experience, 1000+ dedicated nurses and 
 24/7 emergency support.</p>
<h3>*2. Advanced Infrastructure:*</h3>
Our hospital has three main blocks - Block A for Cardiology, Neurology and Emergency & ICU,
Block B for Orthopedics, Pediatrics and Oncology, and Block C for Administration and Director Office.
We also provide parking, clean toilets, drinking water, food and call support.
</P>
<h3>*3. Patient-Centered Service:*</h3>
We offer modern medical technology, video call consultations, easy online appointment booking and 
are trusted by thousands of patients with positive reviews. 
Your health is our priority.</p></div>
<div class="page-navigation"><button onclick="goTo('reviews')">← Previous</button><button onclick="goTo('home')">🏠 Back Home</button></div>
</section>
</main>

<div id="emergencyModal" class="modal" role="dialog" aria-modal="true">
  <div class="modal-content"><button class="close-button" onclick="closeEmergency()">×</button>
    <div id="emergencyData">Loading emergency contacts...</div></div>
</div>
<!-- EMERGENCY CONTACT POPUP -->
<div id="emergencyPopup" class="emergency-overlay">
    <div class="emergency-popup">
        <div class="emergency-popup-header">
            <div>
                <h2>🚨 Emergency Contacts</h2>
                <p>24/7 Emergency Support</p>
            </div>
            <button type="button" class="emergency-close"
                    onclick="closeEmergencyPopup()">×</button>
        </div>

        <div class="emergency-grid" id="emergencyContacts">
            <div class="emergency-card">
                <h3>Dr. Vijay</h3>
                <p>Emergency Cardiologist</p>
                <a class="emergency-phone" href="tel:8489460395">
                    <span>📞</span> 8489460395
                </a>
            </div>

            <div class="emergency-card">
                <h3>Dr. Priya</h3>
                <p>Emergency Neurologist</p>
                <a class="emergency-phone" href="tel:9655768409">
                    <span>📞</span> 9655768409
                </a>
            </div>

            <div class="emergency-card">
                <h3>Dr. Mathes</h3>
                <p>Emergency Orthopaedic</p>
                <a class="emergency-phone" href="tel:1135661797">
                    <span>📞</span> 1135661797
                </a>
            </div>

            <div class="emergency-card">
                <h3>Dr. Dharun</h3>
                <p>Emergency Pulmonologist</p>
                <a class="emergency-phone" href="tel:8973425468">
                    <span>📞</span> 8973425468
                </a>
            </div>

            <div class="emergency-card">
                <h3>Dr. Kavitha</h3>
                <p>Emergency Paediatrician</p>
                <a class="emergency-phone" href="tel:8973425682">
                    <span>📞</span> 8973425682
                </a>
            </div>

            <div class="emergency-card">
                <h3>Hospital Director</h3>
                <p>Director Emergency Contact</p>
                <a class="emergency-phone" href="tel:7092721244">
                    <span>📞</span> 7092721244
                </a>
            </div>
        </div>
    </div>
</div>
<script src="script.js"></script>
</body>
</html>