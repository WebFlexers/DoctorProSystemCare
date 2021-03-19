package com.WebFlexers.mainpackage;

import java.util.Date;
import java.util.List;

public class Doctor extends Users{

    private List<String> Schedule;
    private static List<String> Specialties;
    private Date date;

    public Doctor(String username, String password, String name, String surname) {
        super(username, password, name, surname);
    }

    /**
     * Doctor inserts the date he is available to check in patients
     */
    public void insertDateAvailability(String doctorAvailability)
    {
        date = new Date();
    }

    /**
     * View doctor's appointment availability
     */
    public void viewAppointmentAvailability(List<String> Schedule)
    {

    }

    /**
     * Cancel patient's appointment only if it's scheduled at least 3 days later compared to the current date.
     */
    public void cancelAppointment(String cancelAppointment)
    {
    }


    /**
     * Initializes available doctors' specialty.(Etc. ophthalmologist,orthopedic,internist)
     */
    public void doctorsSpecialty()
    {
        Specialties.add("ophthalmologist");
        Specialties.add("orthopedic");
        Specialties.add("internist");
    }

}