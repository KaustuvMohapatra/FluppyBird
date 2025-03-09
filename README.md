# FluppyBird - A Flutter-Based Flappy Bird Clone  

FluppyBird is a simple Flappy Bird clone built using the **Flutter** framework and the **Flame** game engine. It features smooth animations, realistic physics, and engaging gameplay, making it a fun project to explore Flutter’s game development capabilities.  

## Features  
- Classic Flappy Bird gameplay  
- Built using Flutter and Flame  
- Smooth animations & physics  
- Sound effects (optional)  
- Score tracking  

## Setup & Installation  

To run the game on your local machine, follow these steps:  

### **1️⃣ Prerequisites**  
Ensure you have the following installed:  
- Flutter SDK (Latest Stable Version) → [Download Here](https://flutter.dev/docs/get-started/install)  
- Dart SDK (Included with Flutter)  
- Android Studio or VS Code with Flutter extension  
- Git for cloning the repository  

### **2️⃣ Clone the Repository**  
Run the following command to clone the project:  

```sh
git clone https://github.com/KaustuvMohapatra/FluppyBird.git
cd FluppyBird
```

### **3️⃣ Install Dependencies**
Inside the project folder, run:
``` sh
flutter pub get
```

### **4️⃣ Run the Game**
For Android emulator or physical device:
```sh
flutter run
```

For Web (if supported):
```sh
flutter run -d chrome
```

## How It Works
- Tap the screen to make the bird flap and avoid obstacles.
- The score increases as you pass through pipes.
- The game ends if the bird hits the ground or a pipe.
