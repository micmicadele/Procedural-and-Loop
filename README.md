# Assembly Input Comparison Program

This is a simple x86 assembly language program written for 32-bit FreeBSD systems. It accepts a single-digit input from the user, compares it to the value `5`, and displays whether the input is **below**, **equal**, or **above** 5. The program loops continuously until the user inputs `'q'` or `'Q'` to quit.

## Features

- Accepts a single-digit input (0–9)
- Compares the digit to the value 5
- Displays appropriate messages:
  - "Input is below 5"
  - "Input is equal to 5"
  - "Input is above 5"
- Loops until user exits with `'q'` or `'Q'`
- Written in NASM for 32-bit FreeBSD using native `syscall` interface
