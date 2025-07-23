# 🌱 Becoming: 2030Me
**Lightweight macOS AI agent that sends twice-daily nudges for reflection and alignment — designed to guide your journey toward your best self by 2030.**

---

## What It Does

Becoming: 2030Me is a minimalist macOS utility app that supports intentional living by sending you two daily system notifications:

### 🔔 Morning Reminder – _10:00 AM_
> “Hi Janice — ready to become 2030Me today?”

- Includes a link to a daily intention-setting form
- Encourages mindful start and goal focus

### 🌙 Evening Reflection – _9:00 PM_
> “How did today go, Janice?”

- Includes a link to a nightly reflection form
- Supports journaling and self-awareness

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

---


## 🚀 Getting Started

### Prerequisites
- macOS 13 or later
- Xcode 15+
- Notification permissions enabled

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Becoming2030Me.git
   cd Becoming2030Me
   open Becoming2030Me.xcodeproj
