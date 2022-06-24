# Encrypt It

Encrypt It is an application that encrypts texts with complex mathematical equations and specific encryption algorithms with a complete change in the text letters and their arrangement, which gives more protection and security.


## content
- [What is encryption?](#what-is-text-encryption)
- [What is special about this app?](#what-is-special-about-this-app)
- [Why not use UTF-16?](#why-not-use-utf-16)
- [Skills used in the project](#skills-used-in-the-project)


<img src="https://user-images.githubusercontent.com/87443208/165843645-4c46cfba-5069-4d03-9c7d-bd8c2b4dfa5e.gif" alt="" width="400"/>


## What is text encryption?

Encryption is a process of converting plain text characters into other characters and symbols to produce an unintelligible ciphertext to keep the original text secret.


## What is special about this app?

- Encrypts texts using **special unique algorithms**. ⭐
- A **completely different** ciphertext every time the same text is encrypted (which gives more protection and security). 💪🔐
- Encrypt and protect the text using a password typed by the user. The text can only be decrypted using that password. 🔑
- Easily store encrypted texts in the ***Text Store*** for easy access at any time later and decrypt them using their password. ⚡
- Simple interface and ease of use. 🔥👍


.


## Why not use UTF-16?

Although UTF-16 is a character encoding capable of encoding all 1,112,064 valid character code points in Unicode, it has not been used in the application. **but why?!** 🤔

UTF-16 is a universal fixed-order encoding, but its use makes it easier to hack and discover the encryption algorithm, and access the original text as the hacker converts the characters to their encoding in UTF-16 and then tries to access the encryption equation.
**But if the application uses special algorithms** with a special character arrangement instead of using UTF-16 this makes it difficult for any attempts to decrypt the texts, as the hacker in this case needs to access the length and order of characters used in the encryption process and then try to discover the mathematical equations used in the encryption process.

**So I have adopted the second case in my application to give more protection and security in the encryption process.**


### [Try the app now!](https://play.google.com/store/apps/details?id=malazhariy.encryptIt)

[<img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Google play icon" width="210"/>](https://play.google.com/store/apps/details?id=malazhariy.encryptIt)

---

## Skills used in the project:

- Flutter
- OOP
- Testing
    - Unit testing
- Bloc state management *(Cubit)*
- Google play console
- Clean code
- SOLID principles
  - Single repository
- Model class
- Localization *(Arabic & English)*
- Local storage with Hive *(CRUD)*
- Handling alerts *(user-level Alert dialogs)*
- Responsive UI
- Dark & Light themes
- Biometric authentication
- Google Admob ADs
    - Banner ad
    - Interstitial ad
    - Rewarded ad
    - Native ad
- First-Open showcase
- On-boarding screen
- Native splash screen
- Graphic design
    - UX & UI principles
    - Logo design
    - Animated gifs
    - Neumorphism
    - Custom icons

---

#### Note: The code on GitHub does not contain encryption algorithms.



