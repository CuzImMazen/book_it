Book It – House Rental App

Book It is a Flutter mobile application for renting and managing houses. Users can browse properties, make bookings, rate and favorite properties. Property owners can list and manage their properties, and approve or modify booking requests.

The app works with a Laravel backend API (not included) to handle listings, users, and bookings.

⚠️ Work in Progress: Some features may be incomplete or require backend setup for full functionality.

🌟 Features:

🏠 Renter

Create an account (admin approval required)
Browse available properties
Book properties (requires owner approval)
Rate properties
Add properties to favorites
Track bookings Pending, Active, Upcoming, Canceled, Completed

🏢 Owner

Create an account (admin approval from dashboard required)
List, add, and delete properties
View booking requests or modifications
Approve or reject 

⚙️ General

API Integration: Communicates with a Laravel backend via REST API. 

Push notifications via Firebase Cloud Messaging (FCM).  🔥

Dark mode support 🌙

Localization: Arabic & English 🌐

📐 Architecture & State Management

Follows MVVM (Model-View-ViewModel) architecture

Uses Cubit for state management

Implements design patterns clean code practices and layered separation:

Data layer – API calls, database

Repository layer – abstracts data sources and error handling 

Cubit / ViewModel layer – manages state and business logic

UI layer – presentation and user interface


💻 Tech Stack :

Frontend: Flutter

Backend: Laravel (not included - not mine)

Communication: REST API

Notifications: Firebase Cloud Messaging
