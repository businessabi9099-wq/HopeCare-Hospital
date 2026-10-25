package com.hopecare;
public class Doctor {
    private int id;
    private String name;
    private String specialization;
    private String days;
    private String time;
    private String image;

    public Doctor(int id, String name, String specialization,
                  String days, String time, String image) {
        this.id = id;
        this.name = name;
        this.specialization = specialization;
        this.days = days;
        this.time = time;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSpecialization() {
        return specialization;
    }

    public String getDays() {
        return days;
    }

    public String getTime() {
        return time;
    }

    public String getImage() {
        return image;
    }
}