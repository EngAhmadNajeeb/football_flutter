# Football App

## Overview
Football is a dynamic mobile application designed for football enthusiasts who want real-time updates on matches, team lineups, and scores. The app fetches data seamlessly from [Football API (v3)](https://v3.football.api-sports.io), ensuring users get accurate and up-to-date information.

## Features
- 🏅 **Live Match Scores** — Get instant updates on ongoing matches.
- 📅 **Match Schedules** — Stay ahead with upcoming game dates.
- ⚽ **Team Lineups** — View detailed formations and player positions for each match.
- 🔥 **Fast & Lightweight** — Optimized for performance to deliver data quickly.

## Tech Stack
- **Flutter** — For cross-platform mobile development.
- **RESTful API** — Integrated Football API v3 for live data.
- **State Management** — Managed efficiently for smooth UI updates.

## How to Run
1. Clone the repository:
    ```bash
    git clone https://github.com/YourUsername/football-app.git
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the app:
    ```bash
    flutter run
    ```

4. Set up API key:
    - Get an API key from [API Sports](https://www.api-football.com/).
    - Add it to `lib/api/api_service.dart`:
      ```dart
      dio.options.headers['x-rapidapi-key'] =  "YOUR_API_KEY";
      ```

## Screenshots
| Match Details | Team Lineup |
| ------------- | ----------- |
| ![Match Details](https://github.com/EngAhmadNajeeb/football_flutter/blob/main/assets/images/screenshot1.jpg?raw=true) | ![Team Lineup](https://github.com/EngAhmadNajeeb/football_flutter/blob/main/assets/images/screenshot2.jpg?raw=true) 


Made with ❤️ by [Eng Ahmad Najeeb](https://github.com/EngAhmadNajeeb)


⭐ **Feel free to fork this repo and improve it — contributions are welcome!**

