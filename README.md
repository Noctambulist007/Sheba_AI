# ShebaAI — Your Intelligent Healthcare Companion

<p align="center">
<img src="lu.png" width="120"/>
</p>

## CSE 4801 — Undergraduate Project
**Department of Computer Science and Engineering**  
**Leading University, Sylhet — Bangladesh**

---

## Project Title
**ShebaAI: Your Intelligent Healthcare Companion**

---

## Authors

| Name | Student ID |
|------|------------|
| Md. Sajedul Islam | 0182210012101197 |
| Riyad Ahmed Sagor | 0182210012101198 |
| Sojib Ahmed | 0182210012101202 |

---

## Supervisor
**Md. Jehadul Islam Mony**  
Assistant Professor  
Department of Computer Science and Engineering  
Leading University, Sylhet

---

## Submission Date
**8 March 2026**

---

# Abstract

**ShebaAI** is an innovative mobile healthcare ecosystem designed to simplify and automate medication management.

The core of the system is an **AI-powered Optical Character Recognition (OCR)** engine capable of reading and interpreting handwritten medical prescriptions. Users can upload an image of their prescription and the AI automatically extracts:

- Medicine names  
- Dosage information  
- Frequency of use  

A key innovation is the **automatic add-to-cart feature**. Once the prescription is analyzed, the extracted medicines are automatically matched with the system database and added to the user’s shopping cart.

The system also includes an **intelligent reminder module** that automatically creates medication reminders based on the extracted prescription data. Push notifications are sent to users to remind them when to take medicine.

The backend is developed using **Python and Django**, while the mobile application is built with **Flutter using Clean Architecture and Riverpod** for state management.

ShebaAI integrates:

- AI prescription analysis  
- Automatic medicine cart generation  
- Medicine ordering system  
- Automated medication reminders  

All within a single platform to improve healthcare accessibility and medication adherence.

---

# Introduction

Managing personal healthcare remains a significant challenge for many individuals. One of the most common problems is **reading handwritten medical prescriptions**, which are often difficult to understand.

Patients must then manually search for medicines and manage complex medication schedules.

Poor medication adherence can lead to:

- Reduced treatment effectiveness  
- Increased healthcare costs  
- Medical complications

**ShebaAI** aims to solve these problems by creating an integrated healthcare platform powered by Artificial Intelligence.

The system introduces:

- AI-powered prescription reading  
- Automatic medicine matching
- Automatic cart creation
- Medication reminder system
- Online medicine ordering

The mobile application is built using **Flutter**, while the backend system uses **Python Django REST APIs**.

---

# Problem Description

Managing medication today is a **fragmented and error-prone process**.

Patients often face these problems:

- Illegible handwritten prescriptions
- Manual medicine searching
- Difficulty maintaining medication schedules
- No unified healthcare platform

ShebaAI provides an **all-in-one intelligent healthcare solution**.

---

# Project Goals

- Develop an **AI-based OCR system** to read handwritten prescriptions
- Automatically **extract medicine names and dosage**
- Automatically **add medicines to cart**
- Automatically **create medication reminders**
- Provide **medicine ordering functionality**
- Build a **secure Django backend**
- Develop a **Flutter cross-platform mobile application**
- Create an **admin panel for system management**

---

# Core Features

## 1. AI Prescription Scanner
Users upload a prescription image and the AI extracts medicine details.

## 2. Automatic Add-to-Cart
Matched medicines are automatically added to the user’s cart.

## 3. Automatic Medication Reminders
Reminders are created automatically based on prescription dosage.

## 4. Medicine Ordering
Users can browse medicines and place orders directly.

## 5. User Authentication
Secure user registration and login system.

## 6. User Profile Management
Users can manage personal information and view order history.

## 7. Admin Dashboard
Admins can manage:

- Users
- Medicines
- Orders
- Inventory

---

# System Architecture

The system consists of three main components:

### Mobile Application
Built using **Flutter** with Clean Architecture and Riverpod.

### Backend Server
Built with **Python Django REST Framework**.

### AI Module
Handles:

- Prescription OCR
- Medicine extraction
- AI analysis

---

# Technology Stack

## Mobile App
- Flutter
- Dart
- Riverpod
- Clean Architecture

## Backend
- Python
- Django
- Django REST Framework

## AI
- OCR Engine
- Gemini AI Integration

## Database
- PostgreSQL / MySQL

---

# Development Methodology

The project followed an **Agile development process**:

1. Requirement analysis
2. UI/UX design using Figma
3. Backend API development
4. Flutter mobile app development
5. AI model integration
6. Testing and deployment

---

# Related Work

| Platform | Strengths | Weakness |
|--------|--------|--------|
| PharmEasy / Netmeds | Easy medicine ordering | Manual prescription review |
| Medisafe / MyTherapy | Medication reminders | Manual medicine input |
| Google Lens / Adobe Scan | General OCR | Not medical-specific |
| Wysa / Youper | AI mental health support | No medicine ordering |
| **ShebaAI** | AI OCR + Auto Cart + Reminders + E-commerce | Integrated solution |

---

# Future Improvements

Possible future enhancements include:

- Doctor appointment booking
- Telemedicine support
- AI symptom checker
- Smart wearable integration
- Pharmacy delivery tracking
- Multilingual support

---

# Disclaimer

ShebaAI does **not provide medical diagnosis or treatment**.  
AI analysis is for informational purposes only.

Users should always consult a **licensed healthcare professional** for medical advice.

---

# License

This project is developed as part of an **Undergraduate CSE Project at Leading University**.
