# Flutter Experiment 1 – Working with Widgets and Layouts

## 24CS2016 – Building Applications using Flutter

### Experiment 1

---

## Aim

To design and develop a Flutter application that displays a list of fruit items using basic Flutter layout and UI widgets such as Row, Column, Container, Card, and ListView, along with a reusable custom widget.

---

## Description

Experiment 1 focuses on understanding the fundamentals of Flutter widgets and layouts.

A simple **Fruit Market** application is developed to display different fruits along with their images, names, descriptions, and prices.

The application uses a reusable custom widget called **FruitItem** to display each fruit in a similar format. This demonstrates how Flutter widgets can be organized and reused efficiently.

---

## Technologies Used

- Flutter
- Dart
- Material Design
- Visual Studio Code
- Google Chrome

---

## Flutter Widgets Used

### MaterialApp
Provides the basic structure and configuration for the Flutter application.

### Scaffold
Provides the main screen structure of the application, including the AppBar and body.

### AppBar
Displays the application title **Fruit Market** at the top of the screen.

### ListView
Displays the fruit items in a vertically scrollable list.

### Card
Displays each fruit inside a separate card with elevation and spacing.

### Container
Provides padding and organizes the content inside each card.

### Row
Arranges the fruit image, fruit details, and arrow icon horizontally.

### Column
Arranges the fruit name, description, and price vertically.

### Text
Displays the fruit name, description, and price.

### Image.asset
Displays the fruit images stored inside the project's assets folder.

### Icon
Displays an arrow icon on each fruit card.

### StatelessWidget
Used to create widgets whose contents do not change dynamically.

---

## Dart Concepts Used

- Classes
- Constructors
- Variables
- String data type
- final keyword
- const keyword
- required keyword
- Named parameters
- Object-Oriented Programming
- Custom reusable widgets

---

## Application Features

The Fruit Market application contains:

- Apple – Fresh Red Apple – ₹180/kg
- Banana – Fresh Yellow Banana – ₹60/dozen
- Mango – Fresh and Juicy Mango – ₹120/kg
- Orange – Fresh Sweet Orange – ₹80/kg

Each fruit is displayed using a customized card containing:

- Fruit image
- Fruit name
- Description
- Price
- Arrow icon

---

## Custom Widget

A reusable custom widget named **FruitItem** is used to display the information of each fruit.

Instead of creating the same layout separately for every fruit, the FruitItem widget can be reused with different fruit names, prices, descriptions, and images.

This makes the application:

- Reusable
- Organized
- Easy to maintain
- Simple to modify

---

## Layout Structure

The application follows the following widget hierarchy:

**MaterialApp → Scaffold → AppBar + ListView → Card → Container → Row → Image + Column + Icon**

The Column contains the fruit name, description, and price.

---

## Assets

Fruit images are stored in the project's:

`assets/images/`

The application uses local image assets to display the fruit pictures.

---

## Output

The final output is a **Fruit Market** application displayed in Google Chrome.

![Fruit Market Output](output1.png)

The screen contains a vertically scrollable list of fruit cards with their respective images, names, descriptions, prices, and icons.

---

## Result

The Flutter application was successfully developed using Row, Column, Container, Card, and ListView widgets. A reusable custom FruitItem widget was also implemented to display multiple fruit items in a structured and consistent manner.

---

## Author

**maanjadhav**

**Course:** B.Tech Computer Science and Engineering (Artificial Intelligence and Machine Learning) 
**Subject:** 24CS2016 – Building Applications using Flutter  
**Experiment:** 1 – Working with Widgets and Layouts

---

## Academic Information

| Details | Information |
|---|---|
| Course Code | 24CS2016 |
| Course Name | Building Applications using Flutter |
| Experiment No. | 1 |
| Experiment Title | Working with Widgets and Layouts |
| Application | Fruit Market |
| Programming Language | Dart |
| Framework | Flutter |
| Platform | Flutter Web / Chrome |

---

## License

This project is developed for academic and educational purposes as part of the 24CS2016 – Building Applications using Flutter laboratory course.

© 2026 maanjadhav. All rights reserved.

---

## Conclusion

Experiment 1 provides a basic understanding of Flutter's widget-based architecture and layout system. It demonstrates how different widgets can be combined and how custom reusable widgets can be created to build a clean and organized user interface.
