package com.hopecare;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@WebServlet("/hospital")
public class HospitalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Object LOCK = new Object();

    private static final Path DATA_FILE = Path.of(
        System.getProperty("user.home"),
        "HopeCareData",
        "appointments.txt"
    );

    private static final Path REVIEW_FILE = Path.of(
        System.getProperty("user.home"),
        "HopeCareData",
        "reviews.txt"
    );

    private final List<EmergencyContact> emergencyContacts =
        new ArrayList<>();

    @Override
    public void init() throws ServletException {

        emergencyContacts.add(new EmergencyContact(
            "Dr. Vijay", "Emergency Cardiologist", "8489460395"));

        emergencyContacts.add(new EmergencyContact(
            "Dr. Priya", "Emergency Neurologist", "9655768409"));

        emergencyContacts.add(new EmergencyContact(
            "Dr. Mathes", "Emergency Orthopaedic", "1135661797"));

        emergencyContacts.add(new EmergencyContact(
            "Dr. Dharun", "Emergency Pulmonologist", "XXXXXXXXXX"));

        emergencyContacts.add(new EmergencyContact(
            "Dr. Kavitha", "Emergency Paediatrician", "XXXXXXXXXX"));

        emergencyContacts.add(new EmergencyContact(
            "Hospital Director",
            "Director - Emergency Contact",
            "7092721244"
        ));
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("emergency".equals(action)) {
            showEmergencyContacts(response);

        } else if ("availability".equals(action)) {
            checkAvailability(request, response);

        } else if ("reviews".equals(action)) {
            showReviews(request, response);

        } else {
            response.sendRedirect(
                request.getContextPath() + "/index.jsp"
            );
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("book".equals(action)) {
            bookAppointment(request, response);

        } else if ("review".equals(action)) {
            saveReview(request, response);

        } else {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Unknown action"
            );
        }
    }

    // SAVE PATIENT REVIEW
    private void saveReview(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("patientName");
        String ratingText = request.getParameter("rating");
        String comments = request.getParameter("comments");

        if (!valid(name) || !valid(ratingText)
                || !valid(comments)
                || name.trim().length() > 80
                || comments.trim().length() > 1000) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Please enter your name, rating and comments."
            );
            return;
        }

        int rating;

        try {
            rating = Integer.parseInt(ratingText);
        } catch (NumberFormatException e) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid rating."
            );
            return;
        }

        if (rating < 1 || rating > 5) {
            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Rating must be between 1 and 5."
            );
            return;
        }

        try {
            synchronized (LOCK) {
                Files.createDirectories(REVIEW_FILE.getParent());

                String record = encode(name.trim()) + ","
                    + rating + ","
                    + encode(comments.trim())
                    + System.lineSeparator();

                Files.writeString(
                    REVIEW_FILE,
                    record,
                    StandardCharsets.UTF_8,
                    StandardOpenOption.CREATE,
                    StandardOpenOption.APPEND
                );
            }
        } catch (IOException e) {
            log("Unable to save patient review.", e);
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Could not save review. Please try again."
            );
            return;
        }

        response.sendRedirect(
            request.getContextPath() + "/hospital?action=reviews#reviews"
        );
    }

    // DISPLAY PATIENT REVIEWS
    private void showReviews(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> reviews = new ArrayList<>();

        synchronized (LOCK) {
            if (Files.exists(REVIEW_FILE)) {
                for (String line : Files.readAllLines(
                        REVIEW_FILE, StandardCharsets.UTF_8)) {

                    String[] parts = line.split(",", -1);

                    if (parts.length != 3) {
                        continue;
                    }

                    try {
                        String name = decode(parts[0]);
                        int rating = Integer.parseInt(parts[1]);
                        String comments = decode(parts[2]);

                        if (rating < 1 || rating > 5) {
                            continue;
                        }

                        Map<String, Object> review = new HashMap<>();
                        review.put("patientName", htmlEscape(name));
                        review.put("rating", rating);
                        review.put("comments", htmlEscape(comments));

                        reviews.add(review);

                    } catch (IllegalArgumentException e) {
                        // Ignore invalid review records.
                    }
                }
            }
        }

        request.setAttribute("reviews", reviews);

        request.getRequestDispatcher("/index.jsp")
               .forward(request, response);
    }

    // CHECK APPOINTMENT SLOT AVAILABILITY
    private void checkAvailability(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.setContentType("text/plain;charset=UTF-8");

        String doctor = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        if (!valid(doctor) || !valid(date) || !valid(time)) {
            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );
            response.getWriter().print("INVALID");
            return;
        }

        try {
            int doctorId = Integer.parseInt(doctor);

            synchronized (LOCK) {
                response.getWriter().print(
                    isBooked(doctorId, date, time)
                        ? "BOOKED"
                        : "AVAILABLE"
                );
            }

        } catch (NumberFormatException e) {
            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );
            response.getWriter().print("INVALID");
        } catch (IOException e) {
            log("Unable to check appointment availability.", e);
            response.sendError(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "Unable to check availability."
            );
        }
    }

    // BOOK APPOINTMENT
    private void bookAppointment(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.setContentType("text/plain;charset=UTF-8");

        String name = request.getParameter("patientName");
        String phone = request.getParameter("patientPhone");
        String doctor = request.getParameter("doctorId");
        String date = request.getParameter("date");
        String time = request.getParameter("time");

        if (!valid(name) || !valid(phone) || !valid(doctor)
                || !valid(date) || !valid(time)) {

            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );
            response.getWriter().print(
                "Please fill all appointment fields."
            );
            return;
        }

        if (!phone.trim().matches("[0-9]{10}")) {
            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );
            response.getWriter().print(
                "Enter a valid 10-digit phone number."
            );
            return;
        }

        try {
            int doctorId = Integer.parseInt(doctor);

            synchronized (LOCK) {
                if (isBooked(doctorId, date, time)) {
                    response.getWriter().print(
                        "ALREADY_BOOKED: This slot is already booked."
                    );
                    return;
                }

                Files.createDirectories(DATA_FILE.getParent());

                String record = encode(name.trim()) + ","
                    + encode(phone.trim()) + ","
                    + doctorId + ","
                    + encode(date) + ","
                    + encode(time)
                    + System.lineSeparator();

                Files.writeString(
                    DATA_FILE,
                    record,
                    StandardCharsets.UTF_8,
                    StandardOpenOption.CREATE,
                    StandardOpenOption.APPEND
                );
            }

            response.getWriter().print(
                "SUCCESS: Appointment saved successfully."
            );

        } catch (NumberFormatException e) {
            response.setStatus(
                HttpServletResponse.SC_BAD_REQUEST
            );
            response.getWriter().print("Invalid doctor ID.");

        } catch (IOException e) {
            log("Unable to save appointment.", e);
            response.setStatus(
                HttpServletResponse.SC_INTERNAL_SERVER_ERROR
            );
            response.getWriter().print(
                "Could not save appointment. Please try again."
            );
        }
    }

    // CHECK WHETHER A SLOT IS ALREADY BOOKED
    private boolean isBooked(
            int doctorId,
            String date,
            String time)
            throws IOException {

        if (!Files.exists(DATA_FILE)) {
            return false;
        }

        for (String line : Files.readAllLines(
                DATA_FILE, StandardCharsets.UTF_8)) {

            String[] parts = line.split(",", -1);

            if (parts.length != 5) {
                continue;
            }

            try {
                int savedDoctor = Integer.parseInt(parts[2]);
                String savedDate = decode(parts[3]);
                String savedTime = decode(parts[4]);

                if (savedDoctor == doctorId
                        && savedDate.equals(date)
                        && savedTime.equals(time)) {
                    return true;
                }

            } catch (IllegalArgumentException e) {
                // Ignore malformed appointment records.
            }
        }

        return false;
    }
    // DISPLAY EMERGENCY CONTACTS
    private void showEmergencyContacts(
            HttpServletResponse response)
            throws IOException {

        response.setContentType("text/html;charset=UTF-8");

        var out = response.getWriter();

        out.println("<div class='emergency-header'>");
        out.println("🚨 Emergency Contacts</div>");
        out.println("<div class='emergency-list'>");

        for (EmergencyContact contact : emergencyContacts) {
            String phone = contact.getPhone();

            out.println("<div class='emergency-card'>");
            out.println("<div class='emergency-person'>");
            out.println("<span class='doctor-icon'>👨‍⚕️</span>");
            out.println("<div><h3>"
                + htmlEscape(contact.getName()) + "</h3>");
            out.println("<p>"
                + htmlEscape(contact.getRole()) + "</p></div>");
            out.println("</div>");

            if (phone != null && phone.matches("[0-9]{10}")) {
                out.println("<a class='call-button' href='tel:"
                    + phone + "'>📞 " + phone + "</a>");
            } else {
                out.println("<span class='call-button'>"
                    + htmlEscape(phone)
                    + "</span>");
            }

            out.println("</div>");
        }

        out.println("</div>");
    }

    // ENCODE AND DECODE SAVED TEXT
    private String encode(String value) {
        return Base64.getEncoder().encodeToString(
            value.getBytes(StandardCharsets.UTF_8)
        );
    }

    private String decode(String value) {
        return new String(
            Base64.getDecoder().decode(value),
            StandardCharsets.UTF_8
        );
    }

    // VALIDATE REQUIRED VALUES
    private boolean valid(String value) {
        return value != null && !value.trim().isEmpty();
    }

    // ESCAPE HTML SPECIAL CHARACTERS
    private String htmlEscape(String value) {
        if (value == null) {
            return "";
        }

        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
}