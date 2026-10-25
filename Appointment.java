package com.hopecare;
public class Appointment {
    private String patientName;
    private String patientPhone;
    private int doctorId;
    private String date;
    private String time;
    public Appointment(String patientName, String patientPhone,
                       int doctorId, String date, String time) {
        this.patientName = patientName;
        this.patientPhone = patientPhone;
        this.doctorId = doctorId;
        this.date = date;
        this.time = time;
    }
    public String getPatientName() {
        return patientName;
    }

    public String getPatientPhone() {
        return patientPhone;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }
}