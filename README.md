# SET (SwiftUI)

Fast, production-style implementation of the **Set** card game for iOS, built with **SwiftUI**, **MVVM**, and **CoreGraphics**-powered custom drawing.

---

## ✨ Features
- Full 81-card deck (color · shape · shading · count)
- Tap to select cards, instant match validation & removal
- Deal 3 more cards · New Game · Shuffle
- Clean, responsive SwiftUI UI (no third-party deps)

---

## 🧠 Architecture
- **MVVM**: pure Swift game model, observable ViewModel, SwiftUI Views
- Stateless rendering; UI binds to derived state
- Custom shapes & overlays via **SwiftUI Path / CoreGraphics** (vector drawing)

---

## 🛠 Tech Stack
- **Swift, SwiftUI**
- **CoreGraphics** (vector shapes, strokes/fills, layered rendering)
- Xcode 15+ · iOS 17+

---

## 🚀 Run
1) Open `SET_GAME.xcodeproj` in Xcode  
2) Choose an iOS Simulator  
3) Press **Run** (⌘R)

> **Build note**  
> The project was renamed earlier; legacy Xcode paths may be broken after cloning.  
> If it doesn’t build: create a fresh **SwiftUI App** and drag sources (`*.swift`) + `Assets.xcassets` with **“Copy items if needed”** and **“Add to target”**, then Run.

---

## 📸 Screenshots
<img src="1xyHp.png" width="320">
