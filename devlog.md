**#10.20.2025 Time: 5:30 PM
**
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


**#10.20.2025 Time: 6:30 PM**
For this I want to figure out how to implement the tokenized decisions and the Whitespace Helpers. 
1) Tokenizer -- I will not build a complex tokenizer. I will work from a character list. This keeps changes small and easy to test.
2) White Space -- I need a safe whitespace skipper for empty input. 


**#10.20.2025 Time: 8:30 PM**
I forgot to add the main.rkt file so I went ahead and added it and I changed the mode.rkt file a little bit. I created main.rkt, added the language line, and wired a minimal main so I can run the file. 
I also went ahead and added the mode.rkt file and changed it up a little bit. It seems to be working since I tested it with:

(define (main)
  (displayln "All modules loaded successfully!"))
(module+ main
  (main))

I ended up deleting it since it is no longer needed. Just to check to see if the mode is doing the task correctly (which it is)


**#10.20.2025 Time 9:00 PM**
Now I need create helper functions digit? and take-while to scan through a character list while evaluating prefix expressions. To do this I am thinking that I need a A predicate digit? that returns #t only 
for 0 to 9 and a scanner take-while that walks a list and collects leading characters that match a predicate. Finally I need both functions must be safe on empty lists.


**#10.20.2025 Time 9:51 PM**
I found out that there is an error with my helper function digit and take while scanner. Whenever I run my code and give digit values I am getting #f as the output. I need to figure out what the problem is for it.


**#10.20.2025 Time 11:03 PM**
I figured out the reason why I got the error. It was becuase I used numeric comparison operators instead of character comparison functions. I also forgot to handle the case when the list was empty, which caused 
a “contract violation” error when the function tried to take the first element of an empty list.
Now my code is sucessfully running as it should be.


**#10.20.2025 Time 11:25**
Now I need to build a helper that reads an integer token from a character list and returns two things:
1) the integer value, and
2) the remaining characters that were not part of the integer.
The reason why I need this is so that I can parse number literals anywhere in a prefix expression. Later evaluators will chain by passing along the leftover characters.

**#10.21.2025 Time 10:10 AM**
I got an error with my files "system error: no such file or directory; rkt_err=3" even though it is in my directory so now I have to figure that out since I cant run my code unless this is fixed.


**#10.21.2025 Time 7:52 PM**
So there were a bunch of changes that I had to make and forgot to document them as I was updating them.
1) I had to make a new folder in my desktop. 
2) I changed/added some code in my Parse and List function and I changed the name of the file. The parse-int/list function reads a sequence of characters and converts the leading part of it into an integer. It first skips any spaces, 
checks if there’s a negative sign, and then collects all consecutive digits. If the sequence doesn’t start with valid digits, it raises an error. Once it identifies the number, it converts it from characters to an integer and 
returns that number along with the remaining unprocessed characters. 
3) I kept the main function the same since I'm still developing and testing the helper functions separately.
4) I also changed the name of digit and scanner function to just scanner so that it is more simplistic and easier to call later on
5) The other files stayed the same overall. Nothing else changed. Now the code seems to be running correctly without any errors.


**#10.21.2025 Time 10:20 PM**
What I’m implementing: History lets users reference previous results using $n. The project defines $1 as the oldest result, $2 the next, and so on. However whenever I try to run "(history-get-by-id '(9 5) 3)" I am getting a error 
saying that the index is out of range. I think that this might be because I dont have bound checks or there might be unessesary exports.


**#10.21.2025 Time 10:41 PM**
I figured out the error in my code! It was becuase I didnt removed extra exports, add clear bounds checks. I also fixed index mapping by reversing the history when looking it up. This keeps the simple list model with the newest entry 
first while matching the rule that $1 is the oldest. Any time I get an Error it now shows history: bad id, in the console. 
Now I need to write my next function where I am going to implement the arithmitic appliers so that logic isnt duplicated.. etc.


**#10.21.2025 Time 11:05 PM**
So I wrote the code for the arithmetic function. However whenever I run the code I saw that using (/ a b) returned rational numbers like 7/3 and crashed with a raw division-by-zero error when b was 0. I think that I need to add a check to handle division by zero and use integer division with quotient instead of / so the output stays an integer and errors are caught properly.


**#10.21.2025 Time 11:55 PM**
I ran into an error in my arithmitic function. I Using (/ a b) returned rationals (e.g., 7/3) and raised a raw runtime exception on divide-by-zero. I fixed it by switching the quotient to meet integer division requirements and added 
an explicit (when (zero? b) ...) guard to raise a tagged error. 
Now I have completed the arith.rkt function. Now I am going to move onto the next function that I need to work on is the literals.rkt function

**#10.22.2025 Time 12:36 AM**
I got an error in the new function literals.rkt and I am getting the error message "parse: $ expected". This might be because of the string->list is stripping the $ character or could be treating it as a special which is making the parser to 
never actually sees $ at the start of the token. I am going to try to fix this and see if it will fix the output of my code.

**#10.22.2025 Time 1:17 AM**
Earlier, I thought the reason I was getting the error message “parse: $ expected” was because string->list was stripping the $ character or treating it as a special symbol. It wasnt that, instead the issue was with my eval-dollar function. I 
assumed the $ symbol would always appear immediately before the digits, with no leading or trailing spaces. I changed it by skipping whitespace before looking for the $ symbol and checked that the next character is actually #\$ before parsing digits.

**#10.22.2025 Time 1:35 AM**
So now I want to quickly spend some time mapping out what functions I already have done/completed and what functions I need to implement

Functions I have completed:
1) whiteSpace.rkt – handles spacing and trimming
2) scanner.rkt – reads and categorizes tokens
3) ParseAndList.rkt – builds parse tree lists
4) history.rkt – stores and retrieves past inputs
5) literal.rkt – processes numbers and constants
6) tokenize.rkt – splits input into tokens
7) arith.rkt – performs basic math operations

Functions I need to complete:
1) negcheck.rkt – checks for negative signs
2) eval_core.rkt – evaluates core expressions
3) line_eval.rkt – runs single line evaluation
4) io_fmt.rkt – formats input and output text
5) handle_line.rkt – manages line parsing flow
6) repl_loop.rkt & main.rkt – runs main REPL loop

So, now I think I am going to go ahead and start working on the negcheck.rkt fille where I will check for negative signs in the values. 

**#10.22.2025 Time: 1:50 AM **
I think that I am going to stop where I am and take a break. I wrote a line or two for my negcheck.rkt function. I am going to continue with the code tommorow after a break. 

**#10.22.2025 Time 3:08 PM**
I am going to continue working on my negcheck.rkt function. I right now need to add logic that scans the parsed expression and flips the sign of any literal preceded by a unary minus, so negative numbers are handled correctly during evaluation.

**#10.22.2025 Time 3:54 PM**
I found out that there was an error in my negcheck.rkt function while I was testing to make sure that everything was running correctly. I was getting the error message "car: contract violation". However I did update my code and found the reason to the error. 
It was because I now skip leading whitespace, verify that I actually see a $, then parse the integer id and fetch from history. I also stopped exporting a helper that shouldn’t be public.

**#10.22.2025 Time 4:40 PM**
The goal is to build the core evaluator (eval_core.rkt) that understands prefix operations such as +, *, /, and unary -. It also needs to support history lookups like $n and number literals. Each evaluation should return a pair (value rest) so other parsers can chain results easily.

**#10.22.2025 Time 10:10 PM**
I finished with the eval_core.rkt function and while I was writing it I had a bunch of errors that I had to fix both in eval_core.rkt and ParseAndList regarding blank spaces. Now I was able to resolve the problem and the code seems to be functioning properly now. I am now going to move onto the next fuction which iis line_eval.rkt. In this function I will be parsing a single input line, trimming spaces, tokenizing, calling eval_core, resolving $n history reads and unary minus, then returning the value while appending it to history.

**#10.22.2025 Time 11:03 PM**
I got an error while testing the function with the case (evaluate-line "+ 1 2 2" '()). The issue seems to be that the function does not properly check for leftover characters after evaluating the main expression. It accepts extra input instead of raising an error. I plan to fix this by trimming any trailing whitespace and adding a check that raises an error if extra non-whitespace characters remain in the input.

**#10.22.2025 Time 11:40 PM**
I figured out the error that I had before. I mentioned the solution when I committed the working line_eval.rkt file. I said something along the lines of "I added a whitespace-aware leftover check after evaluation and changed the success return format to (value ok). This made the REPL logic cleaner and consistent with the rule that each line must contain exactly one complete expression".

Now I am going to be moving onto the next function -->  io_fmt.rkt where I will be focusing on the format of the input and output text. 

As a reminder here is all the functions I have completed and all the functions I still need to work on.
Functions I have completed:
1) whiteSpace.rkt – handles spacing and trimming
2) scanner.rkt – reads and categorizes tokens
3) ParseAndList.rkt – builds parse tree lists
4) history.rkt – stores and retrieves past inputs
5) literal.rkt – processes numbers and constants
6) tokenize.rkt – splits input into tokens
7) arith.rkt – performs basic math operations
8) negcheck.rkt – checks for negative signs
9) eval_core.rkt – evaluates core expressions
10) line_eval.rkt – runs single line evaluation

Functions I need to complete:
1) io_fmt.rkt – formats input and output text
2) handle_line.rkt – manages line parsing flow
3) repl_loop.rkt & main.rkt – runs main REPL loop

**#10.23.2025 Time: 12:45 AM**
I just finished with the io_fmt function where I formats input and output text. 

The error I had before was printing exact numbers produced 3 instead of 3.0 and rationals like 7/3 instead of 2.0 when combined with quotient/eval. I fixed this by switching to real->double to force the printed numeric shape and removed unused exports. Now that I am done with this function I am going to work on the next one which is handle_line.rkt. I think that this is going to be my last function today and I will work on the other one later after a break. 

**#10.23.2025 Time 1:34 AM**
I have started on the handle_line function. I havent tested the function to see if it works properly. I think it should but as of now I am going to take a break and work on it later today. I have 2 more things left for this project. 
1) Finish and make sure that the handle_line function works properly
2)  repl_loop.rkt & main.rkt and make sure that the code all compiles and runs properly. 

Once this is done I am going to go through each file and comment the code so that it is more clear on what each thing is doing and quickly create a ReadMe File on github. Once everything works I think that I should be good to go and end the project.
End of session 


**#10.23.2025 Time 12:43 PM**
The goal of the handle_line function is to take a user input line and produce side effects. The function should print either the result or an error message. It should update the history only when the evaluation succeeds. The printed identifier should match the next available index based on the current history length. I was able to complete the function I had a few errors but they didnt seem too hard to fix. I just aligned id printing with the rule “next id = length + 1 (before adding the new value) and after this change my code was working properly.
