# read-input.py asks for 1000 numbers from stdin. Execute read-input.py and make it say "TRIUMPH!"
# If you're unfamiliar with how to execute read-input.py, check out the "Intro to Shell Scripting in Python" video
# Otherwise, type in the command "chmod +ux" followed by the name of the python file. Then you can execute it by typing "./" followed by the python file's name.
# note: nums-0-999 might help
# Thought question: when you execute read-input.py manually, each input will be on one line, so there would be 1000 lines by the end. When you use IO redirection to give it input, all of the output is on one line rather than 1000. Why is that? Hint: What key do you use to signal a newline character? 

# Mathod 1
./read-input.py < nums-0-999

# Mathod 2
cat grep "^[^[0-9]*]$" nums-0-999 | ./read-input.py


# List the contents of your home directory and store that in a file
ls > ls.log

# List the contents of your home directory and append it to the same file
ls >> ls.log

# Thought question: what happens if you have a file called foo and you run cat < foo > foo? Intuitively, that would say to use foo as the input to cat and output that to foo. Why isn't that the case? Hint: Try running something that doesn't create any output, for instance: touch bar > foo. Why is foo empty even though the command never tried to write to it? Note that CSH on the Stanford machines has 'noclobber' option set. This will prevent you from overwriting any files ("clobbering" them). That is annoying and will prevent you from doing this exercise. Instead, use ZSH.
# Thought question: what happens if you have a file called foo and you run cat < foo >> foo? Intuitively, that would print out foo and append it to foo, basically doubling the file. Why isn't that the case? Hint: How big is the file at the start and then how big is the file after cat has gone through the first line? Note: ctrl+C is your friend.


# Print the last three lines of table
tail 3

# Print the first three lines of table
head 3

# Print only the second and third lines of table
head -3 table | tail -2


# bad-new-line has a weird number of blank lines after each line of text. Create a file good-new-line that doesn't have a weird number of blank lines after each line of text. They should Replace it with just one line.
# Note: after your first try, if you have an error, it will probably help to consider where the input to tr comes from.
tr -s '\n' < bad-new-line

# We want to know who won the pumpkin size competition (in pumpkinsizes). We are interested in a couple of stats.
# 1 - the top three winners
# 2 - the two smallest pumpkins

grep "([0-9]+$)" pumpkinsizes | sort  -k 2 -t$'|' -n －r

# Note: alphabetically, "10" is before "2" even though 10 is greater than 2 in our pumpkin size competition. Be sure that sort is sorting things numerically.
# Note: what number is "|2" or "|10"? When sorting numerically, you need to make sure that your field only includes numbers, or it won't work. To do this, you can figure out a field delimiter to specify.
# Note: your solution should work regardless of the number of contestants. You should NOT operate under logic like "there are 11 contestants, so getting the top 2 is the same as removing the bottom 9."
# Do part a without including the headers!


# words-sorted should contain the text of Week 5's lab with one word per line and all of the words sorted. Save all of the unique words to one file.
uniq words-sorted > uniq-words


# Save the counts of all repeated words to another file. For instance, if "foo" appears twice, there should be a line in your output 2: foo. If "bar" appears once, it should not appear. NOTE: if you're on a mac, you can't easily do this. Feel free to skip over this one.
uniq -c -d words-sorted > uniq-words-dup

# words contains the text of Week 5's lab formatted normally. You will need to replace spaces with new lines and sort the file so that uniq can work properly. Then, save all of the unique words to one file. Note: uniq only works on sorted input!
tr -s ' ' '\n' < words > new-uniq-words | sort | uniq -c > new-uniq-words


# Normally, wc (word count) prints out the number of lines, words, and bytes in a file in addition to the filename. You want to just get the number of words WITH NO FILENAME.
# Note: the output of wc includes several spaces at the start. This might throw off your column number if you don't take care to get rid of excess spaces.
# Note: One way to get rid of the filename is to pipe input in from standard input. That doesn't answer the question at hand because that solution reduces the power of what we are able to do (and doesn't teach you cut). Your solution must be able to work on multiple files and output the number of words in each file on a separate line, which you can't do just by redirecting a single input file to standard input.
wc words | cut -d ' ' -f -5

# Remember: join requires sorted input!
# As before, pumpkinsizes contains the names and respective weights from the contest, emails contains the names and emails of all pumpkin carving contestants.
# First, join the emails and the pumpkin sizes together.
grep '[0-9]+$' pumpkinsizes | sort > sorted-pumpkinsizes | join emails sorted-pumpkinsizes > emails-joined

# Second, leverage your first solution and then get the email of the winner (only the email; not the name or anything else).
grep '[0-9]+$' emails-joined | sort  -k 2 -t$'|' -n | tail -1 | cut -d ' ' -f 2

# Third, in the interest of misguided efficiency, you don't want to combine the emails and sizes prematurely. You only want to look up the email address of the winner. Instead of joining and then sorting, sort and then join.
grep '[0-9]+$' pumpkinsizes | sort -k 2 -t$'|' -n | tail -1 > winner | join emails winner | cut -d ' ' -f 2


# Given any input for the form (x_1, x_2) where x_i is an integer, put out (x_2, x_1). Use the file sed-numbers.
# Note: sed might require a flag to get the type of regular expressions you're used to.
sed 's/^(\([0-9]*\), \([0-9]*\)/(\2, \1/' sed-numbers


# Given a file that holds a 5x5 table, print out another table that is some permutation. Use the file ‘table’
awk -F '[ ]|-\\[|]' '{ print $1 "|" $2 "|" $3 "|" $4 "|" $5  }' table

# Given a table (in file ‘table’), take its third and fourth columns and wherever they have (x x) as the row, column values make it (y y). Save the columns, however, before they are changed. This should be one command.
#Mathod 1
awk -F '[ ]' '{ if ($3=="x" && $4=="x") print $1,$2" y y",$5; else print $1,$2,$3,$4,$5 }' table | tee -i table 
#Mathod 2? maybe
sed -E 's/\s([x]\s[x]$)/ y y/' table | tee -i table 

#If given two ‘.c’ files, figure out how you would use comm to calculate the ratio of the number of lines that are in both files to the number of lines that are unique to a file (bonus points if you do this as one command!)








