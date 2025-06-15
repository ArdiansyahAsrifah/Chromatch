# Chromatch: Your Personal Color & Makeup Assistant

![App Screenshot/GIF](https://place-hold.it/800x400)
<br/><br/> <b>Chromatch</b> helps you discover your personal color season, empowering you to choose makeup and clothing that truly complement your natural beauty. Say goodbye to uncertainty and hello to confident purchasing decisions!

---

## The Problem 🤔

Have you ever bought a new foundation or lipstick, only to find it looks completely different at home than it did in the store? You're not alone. Many beauty enthusiasts struggle to find products that match their unique style and enhance their features. Visiting physical stores often involves dealing with misleading lighting, persuasive sellers, and sanitary concerns. Online shopping, while convenient, lacks the assurance that a product will actually suit you. This leads to frustration, wasted money, and a drawer full of unflattering products.

---

## The Solution ✨

Our app, **Choramatch**, provides a simple yet powerful solution. By leveraging the power of **Machine Learning**, our app analyzes your features to determine your personal color season (e.g., Autumn, Winter, Spring, Summer). Once your season is identified, the app recommends a palette of colors that will make you shine. This enables you to make informed and confident purchasing decisions, ensuring you always look your best.

---

## Core Features 

* 🎨 **Personal Color Analysis:** Get an instant prediction of your color season using your device's camera.
* 💄 **Recommended Palettes:** Receive a curated color palette that complements your determined season.
* 📜 **History:** Keep track of your past analyses to review and compare results.

---

## Tech Stack 🛠️

* **Language:** Swift
* **IDE:** Xcode
* **Machine Learning:** Core ML for on-device image analysis.
* **Local Storage:** Swift Data for saving your analysis history.
* **Camera & Video:** AVFoundation and VideoToolbox for real-time camera access and processing.
* **Facial Recognition:** Vision framework for accurate face scanning.

---

## Getting Started 🚀

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

* macOS (latest version recommended)
* Xcode (latest version recommended, available on the Mac App Store)
* A physical iOS device is recommended for testing camera features.

### How to Run

1.  **Clone the Repository**
    Open your terminal and run the following command to clone the project:
    ```sh
    git clone [https://github.com/your-username/choramatch.git](https://github.com/your-username/chromatch.git)
    cd choramatch
    ```

2.  **Open in Xcode**
    Navigate to the cloned directory and open the `Choramatch.xcodeproj` file. This will launch the project in Xcode.

3.  **Build & Run the Project**
    * Select your target device (e.g., an iPhone simulator or a connected physical iPhone) from the scheme menu at the top of the Xcode window.
    * Click the "Run" button (the play icon ▶) or press `Cmd + R` to build and run the application. The Core ML model is already included in the repository, so no additional setup is needed.

---

## Permissions Required 🔒

To perform the color analysis, the app requires one-time access to your camera.

* **Camera Access:** This is necessary to scan your facial features and provide an accurate color season prediction. The app will prompt you for permission on the first use.

---

## Contributing 🤝

-
---

## License 📄

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
