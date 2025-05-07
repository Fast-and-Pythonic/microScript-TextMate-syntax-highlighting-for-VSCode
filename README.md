This is an extension of SYNTAX highlighting according to the TextMate standard for microScript language, for VS Code.

To install the extension, just put the “micro-script-lang” folder in the “.vscode\extensions” directory. And restart VS Code.

In the file "ms-color (ACE Tomorrow Night Bright)-like.jsonc" there is a custom analogue of the standard code color theme from microStudio. Just transfer the code from this file to your "settings.json" file. This custom code color theme is better designed to highlight the syntax of microScript than the standard code color themes.

---

Added code highlighting for:

- Comments

- Keywords:
  - local, global
  - end, return
  - if, elsif, else, then
  - and, or, not
  - while, for, to, by, in, break, continue
  
  - object, class, constructor, extends, super, this, new
  
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

- Variable names ARE NOT HIGHLIGHTED

---

I plan to add a few more pieces in the future. For example, highlighting functions (and possibly object names) of the microScript standard library.








