# InnoD Fam Tracker

![JavaScript](https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![React](https://img.shields.io/badge/-React-61DAFB?style=flat-square&logo=react&logoColor=white)
![HTML5](https://img.shields.io/badge/-HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/-CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![Supabase](https://img.shields.io/badge/-Supabase-3FCF8E?style=flat-square&logo=supabase&logoColor=white)
![Slack](https://img.shields.io/badge/-Slack-4A154B?style=flat-square&logo=slack&logoColor=white)
![Railway](https://img.shields.io/badge/-Railway-0B0D0E?style=flat-square&logo=railway&logoColor=white)
![Figma](https://img.shields.io/badge/-Figma-F24E1E?style=flat-square&logo=figma&logoColor=white)
![Git](https://img.shields.io/badge/-Git-F05032?style=flat-square&logo=git&logoColor=white)

A Fam points tracking platform for Innovative Design at USC that centralizes member participation data and automates point assignments through an AI-powered Slack agent. View at https://adwithi28.github.io/innodfamtracker/

## Overview

InnoD Fam Tracker replaces the club’s previous manual points-tracking workflow with a centralized database and automated Slack integration.

Previously, point submissions were often sent as photos in a Slack channel and manually reviewed, identified, and added to spreadsheets or other tracking systems. This process was time-consuming, difficult to maintain, and vulnerable to missed submissions or incorrect totals.

The platform streamlines this workflow by allowing leadership to:

- Manage members and Fam assignments across semesters
- Create reusable point-based tasks
- Assign points to one or many members at once
- Track individual and Fam performance
- Preserve member histories across semesters
- Process Slack submissions through an AI-powered agent
- Store shared data in Supabase rather than individual browser storage

Although the system was designed for Innovative Design at USC, the architecture can be adapted for other student organizations that use team-based participation, attendance, or rewards systems. 

## Features

- **Shared Cloud Database** – Store club data in Supabase so all authorized users see the same information
- **AI Slack Agent** – Analyze point submissions and automate task assignment workflows
- **Responsive UI** – Custom interface designed in Figma and rendered through HTML
- **Fam Leaderboard** – View semester-specific Fam rankings, point totals, progress bars, and member contributions
- **Member Management** – Add, search, filter, sort, and remove club members
- **Member Profiles** – View permanent member details, semester history, current points, lifetime points, and activity logs
- **Semester Management** – Create, rename, reset, delete, and revisit previous semesters
- **Fam Assignments** – Assign members to different Fams each semester
- **Fam Head Roles** – Track Fam Heads independently each semester so leadership roles reset during semester rollover
- **Custom Tasks** – Create, edit, and delete activities with configurable point values
- **Point Assignment** – Assign a completed task to one member (single assignment) or multiple members at once (bulk assignment)
- **Search and Filtering** – Filter members by Fam, Hex Class, Driver status, Fam Head status, semester, name, or points
- **Activity History** – View recent point assignments and complete individual activity logs

## Architecture

```text
┌─────────────────────────────────────────────────────────────────────┐
│                       FRONTEND TRACKER                              │
│                    HTML + CSS + React                              │
│                                                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────────┐  │
│  │ Leaderboard  │  │   Members    │  │        Profiles          │  │
│  │     Page     │  │     Page     │  │                          │  │
│  └──────┬───────┘  └──────┬───────┘  └────────────┬─────────────┘  │
│         │                 │                       │                │
│  ┌──────▼───────┐  ┌──────▼───────┐  ┌────────────▼─────────────┐  │
│  │    Tasks     │  │  Activities  │  │         Settings          │  │
│  │     Page     │  │ Single/Bulk  │  │ Semesters + Fam Config   │  │
│  └──────┬───────┘  └──────┬───────┘  └────────────┬─────────────┘  │
└─────────┼─────────────────┼────────────────────────┼────────────────┘
          │                 │                        │
          └─────────────────┼────────────────────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │      Supabase        │
                 │ PostgreSQL Database  │
                 │                      │
                 │ - semesters          │
                 │ - fams               │
                 │ - members            │
                 │ - member_semesters   │
                 │ - tasks              │
                 │ - completions        │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │    AI Slack Agent    │
                 │     JavaScript       │
                 │                      │
                 │ - Reads submissions  │
                 │ - Analyzes images    │
                 │ - Identifies tasks   │
                 │ - Assigns points     │
                 └──────────┬───────────┘
                            │
                            ▼
                 ┌──────────────────────┐
                 │       Railway        │
                 │ Agent Deployment     │
                 └──────────────────────┘
```

## Tech Stack

- Frontend: HTML, CSS, JavaScript, React
- Database: Supabase with PostgreSQL
- Slack Agent: JavaScript with the Slack API
- AI Processing: Image and submission analysis for automated point assignment
- Design: Figma
- Deployment: GitHub Pages for the frontend and Railway for the Slack agent
- Typography: Victor Mono for headings and Fragment Mono for body text

## Project Structure

``` text
innodfamtracker/
├── index.html
├── README.md
├── LandingPage.png
├── database/
│   └── schema.sql
├── slack-bot/
│   ├── src/
│   │   ├── app.js
│   │   ├── handlers/
│   │   │   ├── messages.js
│   │   │   ├── submissions.js
│   │   │   └── images.js
│   │   ├── services/
│   │   │   ├── ai-service.js
│   │   │   ├── supabase-service.js
│   │   │   └── points-service.js
│   │   └── utils/
│   ├── package.json
│   └── .env.example
└── assets/
    └── screenshots/
```

