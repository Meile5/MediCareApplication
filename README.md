# MediCare Application

**4th Semester Combined Exam Project**  
Courses: Fullstack Development, Mobile Development, IoT, and AI

Developed by **Mario Aaron Florez** and **Meile Kapisaite**

---

##  Overview

MediCare is a fullstack application that combines mobile, web, IoT, and AI, developed as part of the 4th semester combined examination. The system is designed for healthcare professionals and patients, featuring instant messaging, appointment management, long distance vitals monitoring, and AI analysis.

---

## Screenshots

### 📱 Mobile UI
<p float="left">
<img src="images/Screenshot%202025-05-29%20222707.png" alt="Mobile UI" width="200"/>
<img src="images/Screenshot%202025-05-29%20222756.png" width="200"/>
  <img src="images/Screenshot%202025-05-29%20222920.png" width="200"/>
  <img src="images/Screenshot%202025-05-29%20223004.png" width="200"/>
  <img src="images/Screenshot%202025-05-29%20223023.png" width="200"/>
  <img src="images/Screenshot%202025-05-29%20223554.png" width="200"/>
  <img src="images/Screenshot%202025-05-29%20223616.png" width="200"/>
</p>

### 💻 Web UI
<img src="images/Screenshot%202025-05-29%20223634.png" width="250"/>
  <img src="images/Screenshot%202025-05-29%20223650.png" width="250"/>
  <img src="images/Screenshot%202025-05-29%20223709.png" width="250"/>
  <img src="images/Screenshot%202025-05-29%20223740.png" width="250"/>
  <img src="images/Screenshot%202025-05-29%20223753.png" width="250"/>
  <img src="images/Screenshot%202025-05-29%20223814.png" width="250"/>

---

## Deployed Application
  
 **[MediCare Application](https://meile5.github.io/MediCareApplication/)**

 Frontend is deployed to github pages, backend is deployed on fly.io, database is being hosted on Aiven.

---

## Run locally
Backend can be run using dotnet run on 'server/Startup'

Frontend can be run using flutter run on 'clientFlutter', it can run on web or a mobile device

---

## Login credentials
To login as a patient you can use the following credentials:
email: juan@gmail.com
password: 492154

To login as a doctor:
email: signe@medicare.com
password: 492154

## Important Notes
 The "Generate Analysis" feature available in the doctor version of the app only works when running the AI locally, don't use it on the deployed app.

 The "Pair Device" function on the mobile app does not connect to a real device unless an actual IoT device is available and configured.

 The deployed backend can overflow sometimes so if something is not loading correctly just reload or wait a bit
