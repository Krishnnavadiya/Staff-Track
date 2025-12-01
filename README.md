# ⌚ Luxchono Watches – Digital Luxury Watch Platform

![Backend](https://img.shields.io/badge/Backend-Node.js-43853D?style=flat)
![Framework](https://img.shields.io/badge/Framework-Express-000000?style=flat)
![Database](https://img.shields.io/badge/Database-MongoDB-47A248?style=flat)
![Auth](https://img.shields.io/badge/Auth-JWT-orange?style=flat)
![Frontend](https://img.shields.io/badge/Frontend-React-Tailwind%20CSS-61DAFB?style=flat)
![Cloudinary](https://img.shields.io/badge/Cloud-Cloudinary-blue?style=flat)
![Payment](https://img.shields.io/badge/Payment-Razorpay-2E3192?style=flat)

---

## 📝 Introduction

**Luxchono Watches** is a modern digital e-commerce platform designed to provide customers with an effortless online luxury watch shopping experience. It aggregates top luxury brands, offering seamless browsing, filtering, secure payments, and complete order management.

---

## 🎯 Objectives

- Build an easy-to-use luxury watch purchasing platform.
- Provide a large variety of branded watches.
- Enable smart search and filtering.
- Offer wishlist, cart, checkout, and invoice features.
- Integrate secure online payments using Razorpay.
- Provide an admin dashboard to manage brands, products, users, and orders.

---

## 🧰 Tech Stack

### **Frontend**
- React.js  
- Tailwind CSS  

### **Backend**
- Node.js  
- Express.js  

### **Database**
- MongoDB  

### **Cloud & Third-Party Services**
- Cloudinary (Image storage)  
- Razorpay (Payment gateway)  
- Tawk.to (Live support chat)  

---

## ⚙️ System Functionalities

### 👤 User Features
- User registration with OTP verification  
- Login & authentication  
- Browse products with detailed descriptions  
- Search & filter by brand, category, price  
- Wishlist & Cart system  
- Add/Edit delivery addresses  
- Checkout with Razorpay or Cash on Delivery  
- Order tracking: Pending → Packed → Shipped → Delivered  
- Digital invoice generation  
- View order history  
- Manage profile details  

### 🛡️ Admin Features
- Admin & Root Admin login  
- Create and manage sub-admins  
- Product management with Cloudinary image upload  
- Category & brand management  
- Order management & stock updates  
- User management  
- View invoices  
- Dashboard with statistics  

---

## 📦 Scope

- Complete management of users, products, categories, cart, and orders.  
- Secure token-based authentication.  
- Cloud-based image management.  
- Full e-commerce workflow from browsing → purchase → delivery.  
- Real-time order status updates.  

---

## 🚀 Getting Started

### **Backend Setup**
```bash
cd luxchono-backend
npm install
npm start
```


## 🛠️ Admin Frontend Setup
```bash
cd Luxchono-Admin-frontend
npm install
npm start
```

## 🛠️ User Frontend Setup
```bash
cd luxchono-watch
npm install
npm start
```

---

## 🏗️ Architecture Overview

### 🔙 Backend API  
Handles all server-side logic, authentication, database operations, order processing, and admin functionalities.

### 🛡️ Admin Panel  
Manage:  
- Brands  
- Products  
- Users  
- Orders  

### 🛍️ User Platform  
The customer-facing shopping website where users can:  
- Browse products  
- Add to wishlist  
- Add to cart  
- Checkout  
- Track orders  
- Manage account  

---

## 👥 User Roles

| Role        | Platform      | Permissions                       |
|-------------|---------------|-----------------------------------|
| Admin       | Admin Panel   | Full Access                       |
| Root Admin  | Admin Panel   | Create/manage sub-admins          |
| User        | User App      | Shopping & account features       |

---

## 🔗 Important Links

- **GitHub Repository:** *Luxchono*  
- **Live Deployment:**  
  - **Admin Panel:** https://luxchono-admin.vercel.app/  
  - **User Platform:** https://luxchono-watch.vercel.app/  

---

## 🏁 Conclusion

Luxchono Watches is a complete, scalable, and secure luxury watch e‑commerce system. It includes essential features such as authentication, product filtering, wishlist, cart, checkout, Razorpay payments, and order tracking.  
The admin panel further enhances operations by offering full control over users, products, and orders—making the overall system robust and production-ready.

---

© 2024 *Luxchono Watches – All rights reserved.*
