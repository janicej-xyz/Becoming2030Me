# 🌱 Becoming: 2030Me
**Lightweight macOS AI agent that sends twice-daily nudges for reflection and alignment, designed to guide your journey toward your best self by 2030.**

---

## What It Does

Becoming: 2030Me is a minimalist macOS utility app that supports intentional living by sending you two daily system notifications and a monthly email that summarizes your reflection progress:

### 🔔 Morning Reminder – _10:00 AM_
> “Hi Janice — ready to become 2030Me today?”

- Includes a link to a daily intention-setting form
- Encourages mindful start and goal focus

### 🌙 Evening Reflection – _9:00 PM_
> “How did today go, Janice?”

- Includes a link to a nightly reflection form
- Supports journaling and self-awareness

### 📬 Monthly Summary – *1st of each month*
> “Here’s how July went, Janice 🌱”

- Automatically emails you a summary of the past month’s entries  
- Tracks consistency for AI News, Deep Work, and 100 Reps  
- Highlights your top 3-word themes and gratitude notes


Both notifications:
- Appear even if the app is in the foreground
- Open your browser to Google Forms when clicked
- Repeat automatically every day
- Use `.timeSensitive` to override Focus Mode

---

## 💻 Tech Stack

- **Language:** Swift  
- **Frameworks:** SwiftUI, AppKit, UserNotifications  
- **Key Files:**
  - `Becoming2030MeApp.swift` – Notification scheduling logic
  - `NotificationDelegate.swift` – Handles notification interaction
  - `scripts/monthly_summary_email.gs` – Automates monthly summary email

---

## 📬 Monthly Summary Email

Becoming: 2030Me includes an optional Google Apps Script that sends you a **summary email** on the **1st of each month**, pulling insights from your reflection form.

- Tracks consistency across AI News, Deep Work, and Workouts  
- Surfaces recurring reflection themes from your “3 Words summarize a day” 
- Includes your gratitude notes as a monthly journal  

📁 [`scripts/monthly_summary_email.gs`](./scripts/monthly_summary_email.gs)

---


## 🚀 Getting Started

### Prerequisites
- macOS 13 or later
- Xcode 15+
- Notification permissions enabled
- Google account with access to Apps Script for monthly email automation

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Becoming2030Me.git
   cd Becoming2030Me
   open Becoming2030Me.xcodeproj
2. Customize the Google Form URLsEdit the links in Becoming2030MeApp.swift to point to your own Morning and Evening forms.

3. Build and Run the app in XcodeMake sure notifications are allowed in System Settings > Notifications > Becoming2030Me.

4. Set up the Monthly Summary Email  
   - Open [`scripts/monthly_summary_email.gs`](./scripts/monthly_summary_email.gs) in [Google Apps Script](https://script.google.com)  
   - Link it to your reflection form’s spreadsheet  
   - Set a time-based trigger to run on the 1st of each month

---


## 🧠 Why I Built This

I wanted a gentle ritual that keeps me grounded and connected to my long-term vision — to become my best self by 2030. Instead of using a habit tracker, I designed this as a daily conversation with my future self.

## 📬 Feedback & Contributions

This is a personal tool, but if you're inspired to build your own version, feel free to fork or reach out! I’d love to see how others are approaching intentional self-development with code.
