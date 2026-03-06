<div align="center">

# ShebaAI
### Your Intelligent Healthcare Companion

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white)](https://djangoproject.com)
[![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

[![License: Academic](https://img.shields.io/badge/License-Academic_Project-red?style=flat-square)](.)
[![University](https://img.shields.io/badge/Leading_University-Sylhet%2C_BD-blue?style=flat-square)](.)
[![Course](https://img.shields.io/badge/CSE_4801-Undergraduate_Project-green?style=flat-square)](.)

---

> Snap a prescription. Get your meds. Never miss a dose.
>
> ShebaAI eliminates the friction between a doctor's handwriting and your medicine cabinet — powered by AI.

</div>

---

## Table of Contents

- [What is ShebaAI?](#what-is-shebaai)
- [Key Features](#key-features)
- [System Architecture](#system-architecture)
- [Tech Stack](#tech-stack)
- [Core Workflows](#core-workflows)
- [Requirements](#requirements)
- [Development Timeline](#development-timeline)
- [Competitive Analysis](#competitive-analysis)
- [Limitations](#limitations)
- [Future Roadmap](#future-roadmap)
- [Team](#team)
- [Academic Info](#academic-info)
- [Disclaimer](#disclaimer)

---

## What is ShebaAI?

ShebaAI is an AI-powered mobile healthcare ecosystem that transforms the way people manage their medications. At its core, it uses an OCR-based AI engine to read handwritten medical prescriptions — and then does the heavy lifting for you.

```
Photo of Prescription
        |
AI extracts medicines, dosages & frequencies
        |
Auto-adds to cart  +  Auto-creates reminders
        |
Order with one tap  +  Never miss a dose
```

No more squinting at illegible handwriting. No more manually searching for each medicine. No more forgotten doses.

---

## Key Features

**AI Prescription Scanner**

Upload a photo of any handwritten prescription. The AI engine extracts medicine names, dosage amounts, and frequency and duration instructions with high accuracy.

**Auto Add-to-Cart**

Extracted medicines are automatically matched against the database and added to your cart. Zero manual searching required.

**Smart Medication Reminders**

Reminders are auto-generated directly from the prescription. A `1-0-1` dosage pattern automatically becomes morning and night push notifications — no setup needed.

**AI Skin Analysis**

Powered by Google Gemini, users can photograph a skin condition and receive a preliminary dermatological assessment with suggested next steps.

**Medicine E-Commerce**

Browse, search, and order medicines directly. Full cart management, checkout with delivery address, and order status tracking.

**Admin Panel**

Complete management dashboard for administrators — users, medicines, orders, inventory, and system content with full CRUD operations.

---

## System Architecture

ShebaAI is built on a three-tier architecture ensuring clean separation of concerns and scalability.

```
+--------------------------------------------------+
|              Flutter Mobile App                  |
|  +------------+  +------------+  +------------+  |
|  |Presentation|  |   Domain   |  |    Data    |  |
|  |   Layer    |  |   Layer    |  |   Layer    |  |
|  |  Screens   |  | Use Cases  |  |  Repos &   |  |
|  |  Widgets   |  | Entities   |  |  Remote DS |  |
|  |  Riverpod  |  | Interfaces |  |  Models    |  |
|  +------------+  +------------+  +------------+  |
+---------------------+----------------------------+
                      |  REST API (HTTPS)
+---------------------v----------------------------+
|             Django Backend Server                |
|  +-----------+  +----------+  +--------------+  |
|  |  Models   |  |  Views / |  |   Services   |  |
|  |  Django   |  |  Serial. |  | AI Analysis  |  |
|  |    ORM    |  |   DRF    |  | Auto-Cart    |  |
|  +-----------+  +----------+  | Auto-Reminder|  |
|                               +--------------+  |
+---------------------+----------------------------+
                      |
+---------------------v----------------------------+
|         AI / OCR Engine  +  Gemini               |
|    Prescription Analysis   .  Skin Analysis      |
+--------------------------------------------------+
```

---

## Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| Mobile Frontend | Flutter + Dart | Cross-platform Android & iOS |
| Architecture Pattern | Clean Architecture | Separation of concerns |
| State Management | Riverpod | Reactive, testable state |
| Backend | Python + Django | REST API server |
| API Layer | Django REST Framework | Serialization & endpoints |
| AI / OCR | Custom OCR Engine | Prescription text extraction |
| Skin AI | Google Gemini | Dermatology analysis |
| Database | PostgreSQL / SQLite | Data persistence |
| UI Design | Figma | Wireframes & prototyping |
| Version Control | Git | Source management |

---

## Core Workflows

### Prescription to Order Flow

```
User
 |
 v
Upload Prescription Image
 |
 v
AI Analysis
 |
 +--[Skin Image]--> Gemini Skin Analysis --------+
 |                                                |
 +--[Prescription]--> OCR Extracts Medicines      |
                           |                      |
                    Medicines Matched?             |
                     |          |                 |
                   [Yes]       [No]               |
                     |          |                 |
              Auto-Add      Show Unmatched        |
              to Cart          List               |
                     |          |                 |
              Auto-Create       |                 |
              Reminders         |                 |
                     |          |                 |
                     +----------+-----------------+
                                |
                     User Reviews Cart & Reminders
                                |
                            Checkout
                                |
                          Order Placed
```

### Reminder Engine Logic

| Dosage Pattern | Generated Reminders |
|---------------|-------------------|
| `1-0-1` | Morning + Night |
| `1-1-1` | Morning + Noon + Night |
| `0-0-1` | Night only |
| `1-0-0` | Morning only |

---

## Requirements

### Functional

- [x] User authentication — register and login
- [x] Prescription upload and AI analysis
- [x] Automatic add-to-cart on prescription match
- [x] Automatic reminder creation from prescription
- [x] Medicine browsing, search, and ordering
- [x] Push notification reminders
- [x] User profile and order history
- [x] AI-powered skin analysis via Gemini
- [x] Admin dashboard with full CRUD
- [x] Order management and status tracking

### Non-Functional

| Requirement | Target |
|------------|--------|
| Screen load time | Under 2 seconds |
| OCR analysis time | Under 5 seconds |
| Security | Token-based auth, encrypted transport |
| Compatibility | Android 6.0+ and iOS 12.0+ |
| Uptime | 99% availability |
| UI Standard | Material Design Guidelines |

---

## Development Timeline

```
Week 1      Phase 1 -- Planning & Architecture
            API contract, DB design, environment setup

Week 2-4    Phase 2 -- Parallel Core Development
            Backend: Auth API, Medicine CRUD, Orders
            Frontend: Static UI, Clean Architecture, Riverpod

Week 4-6    Phase 3 -- Integration & AI Features
            Connect frontend to backend APIs
            AI OCR integration
            Auto-cart and auto-reminder implementation

Week 7      Phase 4 -- Admin Panel & Testing
            Django admin panel, full user flow testing

Week 8      Phase 5 -- Refinement & UAT
            UI polish, performance optimization, user testing

Week 9-10   Phase 6 -- Documentation & Submission
            Report writing, slides, demo preparation
```

---

## Competitive Analysis

| Platform | AI OCR | Auto-Cart | Auto-Reminders | E-Commerce |
|----------|:------:|:---------:|:--------------:|:----------:|
| PharmEasy / Netmeds | No — manual review | No | No | Yes |
| Medisafe / MyTherapy | No — manual input | No | Yes | No |
| Google Lens / Adobe Scan | Yes — generic only | No | No | No |
| **ShebaAI** | **Yes — medical-specific** | **Yes** | **Yes** | **Yes** |

ShebaAI is the only platform integrating all four into a single seamless workflow.

---

## Limitations

**OCR Accuracy** — Heavily stylized or unclear handwriting may reduce extraction quality. Manual review by the user is always recommended.

**Medicine Matching** — Brand name variations, regional abbreviations, or uncommon generics may cause imperfect matches.

**Complex Dosages** — Non-standard dosage instructions may require manual adjustment of generated reminders.

**Connectivity Required** — All core features require an active internet connection.

**Geographic Coverage** — Medicine ordering is initially limited to partnered pharmacy locations.

---

## Future Roadmap

```
v2.0    Doctor appointment booking
        Telemedicine support

v2.5    AI symptom checker
        Medication adherence analytics dashboard

v3.0    Smart wearable integration
        Real-time pharmacy delivery tracking
        Multilingual support -- Bangla first

v3.5    Voice-enabled hands-free operation
        Insurance integration and direct billing
        Doctor and Pharmacist portal
```

---

## Team

| Name | Student ID |
|------|------------|
| Md. Sajedul Islam | 0182210012101197 |
| Riyad Ahmed Sagor | 0182210012101198 |
| Sojib Ahmed | 0182210012101202 |

### Supervisor

**Md. Jehadul Islam Mony**  
Assistant Professor, Department of Computer Science and Engineering  
Leading University, Sylhet — Bangladesh

---

## Academic Info

| Detail | Info |
|--------|------|
| University | Leading University, Sylhet |
| Department | Computer Science and Engineering |
| Course | CSE 4801 — Undergraduate Project |
| Degree | Bachelor of Science in CSE |
| Submission | 8th March, 2026 |

---

## Disclaimer

ShebaAI does not provide medical diagnosis or treatment.

All AI-powered analysis — including prescription reading and skin analysis — is provided for informational purposes only. Results should always be reviewed by the user before taking any action.

Always consult a licensed healthcare professional for medical advice.

---

<div align="center">

Built with dedication at **Leading University, Sylhet** — Bangladesh

*CSE 4801 Undergraduate Project — 2026*

</div>
