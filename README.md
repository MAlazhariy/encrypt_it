# Encrypt It

Encrypt It is an application that encrypts texts with unique encryption algorithms with a complete change in text letters and their arrangement, which gives more protection and security.

#### Note: This code does not contain the encryption algorithms.


## content
- [What is encryption?](#what-is-text-encryption)
- [What is special about this app?](#what-is-special-about-this-app)
- [Why not use UTF-16?](#why-not-use-utf-16)
- [Skills used in the project](#skills-used-in-the-project)
- [Screenshots](#screenshots)


<img src="https://user-images.githubusercontent.com/87443208/165843645-4c46cfba-5069-4d03-9c7d-bd8c2b4dfa5e.gif" alt="" width="400"/>


## What is text encryption?

Encryption is a process of converting plain text characters into other characters and symbols to produce an unintelligible ciphertext to keep the original text secret.


## What is special about this app?

- Encrypts texts using **special unique algorithms**. ⭐
- A **completely different** ciphertext every time the same text is encrypted (which gives more protection and security). 💪🔐
- Encrypt and protect the text using a password typed by the user. The text can only be decrypted using that password. 🔑
- Easily store encrypted texts in the ***Text Store*** for easy access at any time later and decrypt them using their password. ⚡
- Simple interface and ease of use. 👍

### [Try the app now 🔥](https://play.google.com/store/apps/details?id=malazhariy.encryptIt)



.


## Why not use UTF-16?

Although UTF-16 is a character encoding capable of encoding all 1,112,064 valid character code points in Unicode, it has not been used in the application. **but why?!** 🤔

UTF-16 is a universal fixed-order encoding, but its use makes it easier to hack and discover the encryption algorithm, and access the original text as the hacker converts the characters to their encoding in UTF-16 and then tries to access the encryption equation.
**But if the application uses special algorithms** with a special character arrangement instead of using UTF-16 this makes it difficult for any attempts to decrypt the texts, as the hacker in this case needs to access the length and order of characters used in the encryption process and then try to discover the mathematical equations used in the encryption process.

**So I have adopted the second case in my application to give more protection and security in the encryption process.**



## Skills used in the project:

- Flutter & Dart
- OOP
- State management *(Cubit)*
- MVC architecture pattern
- Responsive UI
- Localization
- Clean code
- SOLID principles
  - Single responsibility
  - Open-closed
- Testing
    - Unit testing
- Handling alerts *(user-level Alert dialogs)*
- Local storage *(Hive)*
- Dark & Light themes
- Google play console
- Google Admob ADs
    - Banner ad
    - Interstitial ad
    - Rewarded ad
    - Native ad
- Biometric authentication
- First-Open showcase
- On-boarding screen
- Native splash screen
- Graphic design
    - Neumorphism
    - Logo design
    - UI-UX principles
    - Animated gifs
    - Custom icons

## Screenshots:

<img src="https://user-images.githubusercontent.com/87443208/189519829-2eb7c4a4-553d-4806-993c-bb18322af665.jpg" alt="" width="230"/> <img src="https://user-images.githubusercontent.com/87443208/176006539-c544ba8b-8864-4225-9210-7218de166648.jpg" alt="" width="230"/> <img src="https://user-images.githubusercontent.com/87443208/176006573-1901d1b0-3eef-444b-bac0-0439b4a7c69d.jpg" alt="" width="230"/> <img src="https://user-images.githubusercontent.com/87443208/176006612-53e92730-7285-4a66-98fe-0575dcb48c77.jpg" alt="" width="230"/> <img src="https://user-images.githubusercontent.com/87443208/176006649-1bcb11f7-3039-4681-9550-55c7012546de.jpg" alt="" width="230"/>

[<img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Google play icon" width="230"/>](https://play.google.com/store/apps/details?id=malazhariy.encryptIt)


