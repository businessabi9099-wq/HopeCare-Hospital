package com.hopecare;
public class EmergencyContact {
    private String name;
    private String role;
    private String phone;
    public EmergencyContact(String name, String role, String phone) 
    {
        this.name = name;
        this.role = role;
        this.phone = phone;
    }
    public String getName() {
        return name;
    }
    public String getRole() {
        return role;
    }
    public String getPhone() {
        return phone;
    }
}