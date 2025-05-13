This is an extension of SYNTAX highlighting according to the TextMate standard for microScript language, for VS Code. It's syntactic. NOT SEMANTIC.

<details> <summary>To install the extension:</summary>

- 1 - Put the “microScript-syntax-highlighting” folder in the “.vscode\extensions” directory.

- 2 - Enter the command ">Developer: Install Extension from Location...".

- 3 - Select the folder “microScript-syntax-highlighting".

- 4 - And after installing the extension, restart VS Code.

</details>

### My custom code theme, based on "ACE Tomorrow Night Bright". It is specially optimized for microScript syntax. ###

In the file "ms-color (ACE Tomorrow Night Bright)-like.jsonc" there is a custom analogue of the standard code color theme from microStudio. Just transfer the code from this file to your "settings.json" file. This custom code color theme is better designed to highlight the syntax of microScript than the standard code color themes.

---

### Added code highlighting for: ###

- Comments

- Keywords:
  - local, global
  - end, return
  - if, elsif, else, then
  - and, or, not
  - while, for, to, by, in, break, continue
  
  - function, object, class, constructor, extends, super, this, new
  
  - do, after, every, sleep

- Mathematical operators:

  = + - * / % ^
  
  += -= *= /= %=
  
  == != <= >=
  
  & | << >>

- Numbers
- Booleans
- Strings

- In brackets of functions and classes:
  - Named parameters
  - and all the other stuff (comments, keywords, math operators, numbers, booleans, strings)
  - arguments ARE NOT HIGHLIGHTED

- Variable names ARE NOT HIGHLIGHTED

---


<details> <summary> Screenshots with examples of highlighting microScript code</summary>


![Снимок экрана 2025-05-08 135415](https://github.com/user-attachments/assets/73552560-0c1b-45c3-800d-2a40bdee0ae7)


![Снимок экрана 2025-05-08 142932](https://github.com/user-attachments/assets/6e35718d-a507-4e4c-9ccc-9f9cc5add41e)


![Снимок экрана 2025-05-08 140005](https://github.com/user-attachments/assets/e144e7b2-8550-44fa-8fa1-f6bd761bf7ae)


![Снимок экрана 2025-05-08 140033](https://github.com/user-attachments/assets/7356fad9-5902-4e65-ac91-b86c4c40889e)


![Снимок экрана 2025-05-08 140057](https://github.com/user-attachments/assets/e49c9915-f879-426e-9d00-38a1fffd15af)


![Снимок экрана 2025-05-08 142649](https://github.com/user-attachments/assets/5d6a57b9-9741-4734-8b50-2c9151d1f767)


![Снимок экрана 2025-05-08 140713](https://github.com/user-attachments/assets/e27ccb0e-f098-4cf9-878f-385c2f972fa9)


![Снимок экрана 2025-05-08 140735](https://github.com/user-attachments/assets/87c5d479-18fd-42b8-b657-784ebf840ba2)


![Снимок экрана 2025-05-08 140754](https://github.com/user-attachments/assets/1b0e57ba-a5ca-4252-824c-c750fd212dc7)


![Снимок экрана 2025-05-08 140844](https://github.com/user-attachments/assets/d7311b3c-7a0f-423d-b050-6348bfaa3592)


</details>


---

### I plan to add a few more pieces in the future: ###
- Highlighting the tools of the microScript standard library - Functions, System Classes, and etc...
- Add some missing keywords.
- I'll try to post the extensions on VS Code Marketplace. To make them easier to install.
- Also, I will most likely make 2 versions of the extension:
  - 1 - My own microScript code highlighting color theme, based on the “Tomorrow Night Bright” theme.
  - 2 - An almost complete analog of the standard “Tomorrow Night Bright” theme from the Ace editor in microStudio.














