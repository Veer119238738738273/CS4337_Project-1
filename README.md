# Prefix Calculator Project

## Overview
This project builds a prefix-notation expression calculator. The program prompts for a prefix expression and computes its result. It keeps a history so later inputs can reference prior results. 
Input is validated and errors are reported with clear messages. Development follows the repository’s Git and project workflow guidelines.

---

## Key Features
- Prefix evaluation for +, -, *, and / operations
- Clear handling of unary minus and negative numbers
- History lookup with $n, where $1 refers to the oldest result
- Strict input checks that reject any extra or trailing text
- Interactive REPL with a prompt, clean output, and reliable error handling
- Functional structure, with helpers returning (value rest) pairs

---

## File Structure
File and its Purpose:
`whiteSpace.rkt` --> Skips leading spaces and tabs. 
`DigitHelperAndScan.rkt` --> Implements `digit?` and `take-while` helpers. 
`ParseAndList.rkt` --> Parses integers and returns `(value rest)`. 
`history.rkt` --> Handles history lookups and indexing (`history-get-by-id`, `result-id`). 
`literal.rkt` --> Evaluates numeric and `$n` literals. 
`negcheck.rkt` --> Distinguishes negative literals from unary minus. 
`arith.rkt` --> Applies binary and unary arithmetic operations.
`eval_core.rkt` --> The main evaluator that ties together all expression logic. 
`line_eval.rkt` --> Evaluates an entire input line and checks for trailing text. 
`io_fmt.rkt` --> Prints formatted results and errors. 
`handle_line.rkt` --> Integrates evaluation and output per user input.
`repl_loop.rkt` --> Implements the interactive Read–Eval–Print Loop.
`main.rkt` --> Program entry point; launches the REPL.
`PrefixCalc.hs` --> Haskell translation of the same algorithm, with `Either`-based error handling.
`devlog.md` --> Progressive log of each development step, problems, and solutions.
