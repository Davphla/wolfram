# Elementary Cellular Automaton (Wolfram Rule 30, 90, 110)

![image](https://github.com/user-attachments/assets/23291e68-9704-417c-b63a-36c0f70af4c3)

This project implements Wolfram's Elementary Cellular Automaton in Haskell. The goal is to simulate and display specific cellular automata rules (specifically rule 30, rule 90, and rule 110) in the terminal, based on user-defined parameters such as rule selection, generation number, window size, and translation.

Wolfram's Elementary Cellular Automaton is a class of simple, one-dimensional cellular automata defined by Stephen Wolfram in the 1980s. These automata are designed to explore how complex patterns and behaviors can emerge from simple rules applied to a grid of cells over time. 

# Installation
## Prerequisites

    Haskell (Stack version 2.1.3 or greater).
    Ensure you are using the lts-23.3 resolver for Haskell's Stack.

## Steps to Install:

    Clone the repository to your local machine:

```
git clone https://github.com/yourusername/elementary-cellular-automaton.git
cd elementary-cellular-automaton
```

Install the dependencies and build the project using Stack:

    stack build


# Usage

To run the program, you will invoke the compiled executable with the desired arguments.
## Syntax:
```
./wolfram --rule <rule_number> --start <generation_number> --lines <lines_to_display> --window <window_size> --move <translation>
```
## Options:

    --rule <rule_number>: The rule number to use for the cellular automaton (mandatory). Options are 30, 90, 110, or any rule between 0 and 255 for bonus functionality.

    --start <generation_number>: The generation number at which to start displaying the automaton. Default is 0.

    --lines <lines_to_display>: The number of generations (lines) to display. If not provided, the program will run indefinitely.

    --window <window_size>: The number of cells to display on each line. If even, the central cell will be displayed in the next cell on the right. Default is 80.

    --move <translation>: A translation applied to the window. If negative, the window moves to the left; if positive, it moves to the right. If not specified or invalid, the program will return an error.

## Example:

To start rule 30 with a window size of 80 and 10 generations:
```
./wolfram --rule 30 --lines 10 --window 80
```
To display 20 generations, starting at generation 5, with a translation to the left:
```
./wolfram --rule 110 --start 5 --lines 20 --window 80 --move -5
```

