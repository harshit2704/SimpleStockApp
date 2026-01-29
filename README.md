# SimpleStockApp

## Overview
SimpleStockApp is a basic iOS application built using **UIKit** and **MVVM architecture**.  
The app fetches a list of stocks from an API, displays them in a list, and shows stock details on selection.  
Stock prices are refreshed every **5 seconds** using API polling.

The project focuses on **clean architecture, scalability, and performance**, rather than UI complexity.

---

## Features
- Fetch stock list from remote API
- Display stock name and price in a table view
- Navigate to stock detail screen
- Poll API every 5 seconds for price updates
- Cancel polling when screen is not visible
- Clean MVVM separation
- Centralized network layer

---

## Project Structure
SimpleStockApp
├── Screens
│ ├── StockList
│ │ ├── StockListViewController.swift
│ │ ├── StockListViewModel.swift
│ │ └── StockListData.swift
│ └── Details
│ └── StockDetailViewController.swift
│
├── Services
│ ├── NetworkManager.swift
│ └── EndPoint.swift
│
├── Views
│ └── StockListTableViewCell.swift
│
├── AppDelegate.swift
├── SceneDelegate.swift
├── Assets.xcassets
├── Main.storyboard
└── Info.plist


---

## Architecture
- **UIKit** for UI
- **MVVM**
  - View: ViewControllers
  - ViewModel: Business logic and data binding
  - Model: Stock data model
- **Singleton NetworkManager** for API handling
- **Swift Concurrency** (`async/await`, `Task`)

---

## Networking
- All API calls are handled by `NetworkManager`
- API endpoints are defined in `EndPoint`
- Easy to add new APIs without changing UI or ViewModel logic

---

## API Polling
- Implemented using `Task`
- Runs every 5 seconds
- Automatically cancelled when screen disappear
- Prevents unnecessary UI refresh by comparing old and new data

---

## Threading
- Network calls run off the main thread
- UI updates are performed on the main thread
- Safe UI handling using `@MainActor`

---

## Scalability
- Feature-based folder structure
- Centralized network layer
- Easy to add new screens and APIs
- Polling can be replaced with WebSockets in future

---

## Performance Considerations
- Non-blocking async network calls
- Minimal memory usage
- Optimized UI updates
- Lightweight models

---

## Requirements
- iOS 26+
- Xcode 26.0+
- Swift 5.7+

---

## Future Enhancements
- WebSocket-based real-time updates
- Caching for offline support
- Unit tests for ViewModel
- Improved error handling UI
- Add stocks to favourite

---

## Notes
This project is designed for **interview and assignment evaluation**, demonstrating clean code practices, scalability, and modern iOS development concepts.
