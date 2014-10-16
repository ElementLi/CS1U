# read-input.py asks for 1000 numbers from stdin. Execute read-input.py and make it say "TRIUMPH!"
# If you're unfamiliar with how to execute read-input.py, check out the "Intro to Shell Scripting in Python" video
# Otherwise, type in the command "chmod +ux" followed by the name of the python file. Then you can execute it by typing "./" followed by the python file's name.
# note: nums-0-999 might help
# Thought question: when you execute read-input.py manually, each input will be on one line, so there would be 1000 lines by the end. When you use IO redirection to give it input, all of the output is on one line rather than 1000. Why is that? Hint: What key do you use to signal a newline character? 

cat grep "^[^[0-9]*]$" nums-0-999 | ./read-input.py

