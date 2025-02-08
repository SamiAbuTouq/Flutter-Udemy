# Quiz App

## Overview

The Quiz App is a Flutter-based application designed to provide an engaging and interactive way for users to test their knowledge on various topics. Users are presented with multiple-choice questions, can select their answers, and receive instant feedback. At the end of the quiz, a summary of their performance is displayed, helping them review their answers.

## UI Design

You can view the app's design on Figma:
[Quiz App Figma Design](https://www.figma.com/design/EkXoQirW5YGx1tpjrrvyQc/quiz-app?node-id=0-1&t=EeHnmqdtF2HEMvMG-1)

## Features

- Interactive quiz interface
- Tracks user answers
- Displays results with a summary
- Modular and scalable code structure
- User-friendly UI
- Dynamic question loading

## Project Structure 📁

```
lib/
├── main.dart                    # Entry point of the application
├── quiz.dart                    # Core quiz widget
├── start_screen.dart            # Initial screen of the quiz
├── questions_screen.dart        # Displays quiz questions
├── results_screen.dart          # Shows quiz results
│
├── data/
│   ├── questions.dart           # Contains quiz questions
│
├── models/
│   ├── quiz_question.dart       # Model for a quiz question
│
├── questions_summary/
│   ├── questions_summary.dart   # Summary of user answers
│   ├── question_identifier.dart # Identifies question numbers
│   ├── summary_item.dart        # Represents a summary item
│
├── widgets/
│   ├── answer_button.dart       # Custom button for answers
```

## App Explanation ✨

The app consists of several key components:

1. **Start Screen** 🏁:
   - Welcomes users with a friendly message and quiz logo.
   - Features a "Start Quiz" button to begin.

2. **Questions Screen** ❓:
   - Displays one question at a time.
   - Presents randomized multiple-choice answers.
   - Tracks user selections.

3. **Results Screen** 🏆:
   - Shows the user's score (correct answers).
   - Summarizes questions, highlighting correct/incorrect answers.
   - Offers a "Restart Quiz" option.

4. **Quiz Logic** 🔄:
   - Manages navigation between screens.
   - Handles answer selection and score calculation.

5. **Design** 🌌:
   - Cosmic-themed gradient background 🌠.
   - Custom fonts (Poppins) for readability 🅰️.
   - Responsive layouts for various screen sizes 📱.


## Installation 🛠️

1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/quiz-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd quiz-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Requirements

- Flutter SDK
- Dart SDK
- Compatible IDE (VS Code, Android Studio, etc.)


