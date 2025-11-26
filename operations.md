# **Operations (12 Total)**

This system supports three user roles**:**

**1.** **Member,**

**2.** **Trainer**, and 

**3. Administrative Staff**

  

each with four core operations for a total of **12 required operations**. 

* * *

## **Member Operations (4)**

### **1\. Create or Update Member Profile**

-   **Tables:** `Member`
    
-   Members can create an account or update their personal information (email, phone, name).
    

### **2\. Log and View Health Metrics**

-   **Tables:** `HealthMetric`, `Member`
    
-   Members can record new health metrics (weight, height, heart rate, etc.) and view historical data.
    

### **3\. Book or Reschedule a Private Session**

-   **Tables:** `PrivateSession`, `Trainer`, `Room`
    
-   Members can book a private training session by selecting a trainer, room, date, and time.
    
-   Rescheduling updates the existing booking.
    

### **4\. Register for a Group Class**

-   **Tables:** `ClassRegistration`, `ClassSchedule`
    
-   Members can browse upcoming group classes and register for a selected class.
    

* * *

## **Trainer Operations (4)**

### **5\. Create or Update Group Classes**

-   **Tables:** `ClassSchedule`, `Room`, `Trainer`
    
-   Trainers can create new classes or update existing ones (time, room, activity type).
    

### **6\. View Personal Schedule**

-   **Tables:** `ClassSchedule`, `PrivateSession`
    
-   Trainers can view all upcoming group classes and private sessions assigned to them.
    

### **7\. Manage Availability**

-   **Tables:** `TrainerAvailability` (if implemented)
    
-   Trainers can define or modify weekly availability for sessions and classes.
    

### **8\. View Member Information and Health Metrics**

-   **Tables:** `Member`, `HealthMetric`, `ClassRegistration`, `PrivateSession`
    
-   Trainers can view profiles and recent health metrics of members enrolled in their classes or booked for sessions.
    

* * *

## **Administrative Staff Operations (4)**

### **9\. Manage Rooms**

-   **Tables:** `Room`
    
-   Admins can create new rooms, update capacity, or rename rooms.
    

### **10\. Record and Process Payments**

-   **Tables:** `Payment`, `Member`
    
-   Admins can record membership fees, private session payments, or other service payments.
    

### **11\. Monitor and Resolve Booking Conflicts**

-   **Tables:** `PrivateSession`, `ClassSchedule`, `Room`
    
-   Admins can view room or trainer scheduling conflicts and update bookings or room assignments accordingly.
    

### **12\. Manage Equipment Maintenance**

-   **Tables:** `Equipment`
    
-   Admins can update equipment status (e.g., mark items as under maintenance or repaired).
    

* * *

## **Summary Table**

| Role | Operation | Description |
| --- | --- | --- |
| Member | Profile Management | Create/update personal info |
| Member | Log Health Metrics | Add/view weight, heart rate, etc. |
| Member | Book Private Session | Book/reschedule 1-on-1 training |
| Member | Register for Group Class | Join scheduled group sessions |
| Trainer | Manage Classes | Create/update class schedules |
| Trainer | View Schedule | See upcoming classes & sessions |
| Trainer | Manage Availability | Define available timeslots |
| Trainer | View Members' Info | Access health + profile data |
| Admin | Manage Rooms | Create/update rooms & capacity |
| Admin | Process Payments | Record membership/session payments |
| Admin | Resolve Conflicts | Detect and fix booking overlaps |
| Admin | Equipment Maintenance | Track equipment condition |