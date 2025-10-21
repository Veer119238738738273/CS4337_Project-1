#10.20.2025 Time: 5:30 PM

Project Description:
In this project you will create a prefix-notation expression calculator. The calculator will prompt
the user for an expression in prefix notation and calculate the result of the inputted expression.
A history will be kept so that previous results can be used in expressions. You are expected to
handle possible errors in the user’s input. Do not forget to follow the “Git/Project Instructions”.

My Approach to the Project:
I will start by breaking the problem into smaller functions. Each function will handle one task, such as parsing numbers, identifying operators, or evaluating an expression. 
Every function will return two things: the computed result and the remaining input that has not yet been processed. I plan to write helper functions first, such as one to skip spaces and one to read a number. 
Then I will write functions for each operator: addition, multiplication, division, and unary negation. Each will call the main evaluation function to handle its operands.
The history of results will be stored as a list. Each new result will be added to the front of the list, and I will pass this list into each call to the evaluator. 
This keeps the program functional and avoids mutable state. Finally, I will write the main loop. It will prompt the user, read input, evaluate the expression, and 
print either the result or an error message. I will also include logic from the provided mode.rkt file to support both interactive and batch modes.

#10.20.2025 Time: 6:30 PM
For this I want to figure out how to implement the tokenized decisions and the Whitespace Helpers. 
1) Tokenizer -- I will not build a complex tokenizer. I will work from a character list. This keeps changes small and easy to test.
2) White Space -- I need a safe whitespace skipper for empty input. 


#10.20.2025 Time: 8:30 PM
I forgot to add the main.rkt file so I went ahead and added it and I changed the mode.rkt file a little bit. I created main.rkt, added the language line, and wired a minimal main so I can run the file. 
I also went ahead and added the mode.rkt file and changed it up a little bit. It seems to be working since I tested it with:

(define (main)
  (displayln "All modules loaded successfully!"))
(module+ main
  (main))

I ended up deleting it since it is no longer needed. Just to check to see if the mode is doing the task correctly (which it is)

#10.20.2025 Time 9:00 PM
Now I need create helper functions digit? and take-while to scan through a character list while evaluating prefix expressions. To do this I am thinking that I need a A predicate digit? that returns #t only 
for 0 to 9 and a scanner take-while that walks a list and collects leading characters that match a predicate. Finally I need both functions must be safe on empty lists.

