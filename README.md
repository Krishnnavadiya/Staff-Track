# 📊 Staff Track – HR Management System

**Staff Track** is a comprehensive HR Management System built to streamline employee management, time tracking, attendance, and internal organizational workflows. The system is divided into three major components:

- 🔧 **Backend API Server** – Node.js & Express  
- 🖥️ **Web-based Admin Interface** – React + TypeScript  
- 📱 **Mobile Application** – Flutter  

---

## 📁 Project Structure

```
Staff-Track/
├── HRMS-Backend      # Node.js/Express REST API
├── HRMS-Frontend     # React + TypeScript web interface
└── HRMS-app          # Flutter mobile application for employees
```

---

## 🚀 Features

- 👥 **User Management** – Create, update, and manage employee profiles  
- ⏱ **Time Tracking** – Monitor employee work hours and tasks  
- 🗓 **Leave Management** – Submit, track, and approve leave requests  
- 📊 **Project Management** – Assign and monitor project progress  
- 🏖 **Holiday Management** – Configure holidays and time-off policies  
- 🕒 **Attendance Tracking** – Record employee check-ins and check-outs  
- 👨‍👩‍👧 **Team Management** – Organize employees into teams and departments  
- 📌 **Notice Board** – Share company-wide announcements  
- 💰 **Salary Management** – Manage compensation and payroll  
- 📈 **Reporting** – Generate HR insights and performance reports  

---

## 🧰 Tech Stack

### 🖥 Backend – `HRMS-Backend`
- **Runtime**: Node.js + Express  
- **Database**: MongoDB with Mongoose ODM  
- **Authentication**: JWT (JSON Web Tokens)  
- **File Storage**: Cloudinary  
- **Email Services**: Nodemailer  

### 🌐 Frontend – `HRMS-Frontend`
- **Framework**: React with TypeScript  
- **Build Tool**: Vite  
- **UI Libraries**: Tailwind CSS, Material Tailwind, Radix UI  
- **State Management**: Redux Toolkit  
- **Form Handling**: Formik, React Hook Form  
- **API Handling**: Axios  

### 📱 Mobile App – `HRMS-app`
- **Framework**: Flutter  
- **State Management**: GetX  
- **Local Storage**: Get Storage, Shared Preferences  
- **HTTP Client**: Dio  
- **UI Kit**: Material Design Components  

---

## 🛠 Getting Started

### ✅ Backend Setup
```bash
cd HRMS-Backend
npm install
npm run dev
```
> Server runs on the port defined in `.env`

### ✅ Frontend Setup
```bash
cd HRMS-Frontend
npm install
npm run dev
```
> Runs on `http://localhost:5173` by default

### ✅ Mobile App Setup
```bash
cd HRMS-app
flutter pub get
flutter run
```
> Launches on connected device or emulator

---

## 🏗 Architecture

- **Backend API**: Provides data and business logic for all platforms  
- **Web Admin Panel**: Full-featured HR management interface for administrators  
- **Mobile App**: Self-service interface for employees (attendance, leaves, etc.)  

---

## 👥 User Roles

| Role         | Platform(s)     | Permissions                                      |
|--------------|------------------|--------------------------------------------------|
| **Admin**    | Web              | Full access to all system features               |
| **Employee** | Web & Mobile     | Access to personal details, attendance, leaves   |

---

## 📄 License

This project is licensed under the **MIT License**.  
See [`LICENSE`](LICENSE) for details.

---

## 📬 Contact

For queries, suggestions, or support, please reach out to the project maintainers.

---

© 2023 **Staff Track** – All rights reserved.
