# Exam randomizer program version 1.0 (using AWK and SED), by Tony R. Kuphaldt
# February 5, 2006
# I am not at all experienced in AWK programming.
# Please try not to laugh too hard at my code!


# This begins the AWK program
BEGIN {

# Seeds random number generator
  srand()

# Completes the filename of the exam file to be processed
  examfile = "temporary_file.exam"

# Reads system date and time
  "date" | getline date
  close("date")  # Necessary to use "getline" again in the future

# Begins randonamee exam with a commented message
  system("echo '# This is a randomized version of exam '" examfile " > randomized_exam.exam") 
  system("echo '# Generated automatically on '" date " >> randomized_exam.exam") 

# Uses SED to extract all preamble lines and place them into "randomized_exam.exam" file
  system("sed -e '/^#(BEGIN_PREAMBLE)/,/^#(END_PREAMBLE)/!d' " examfile " >> randomized_exam.exam") 

# Counts number of questions in the exam file, saves to variable "MAX"
  system("grep BEGIN_Q " examfile " > temp_file.txt")
  "wc -l temp_file.txt" | getline MAX
  close("wc -l temp_file.txt")  # Necessary to use "getline" again in the future


# This loop makes one selection for each of the questions on an exam
  for (x = 1 ; x < (MAX + 1) ; ++x) 
  {

    # Uses SED to select TeX code associated with question number "x" 
    sedarg = sprintf ("/^#(BEGIN_Q%3.3d)/,/^#(ECHO-CAT_BREAK_Q%3.3d)/!d", x, x)
    system("sed -e ' " sedarg " ' " examfile " >> randomized_exam.exam")

    # Uses SED to select concatenation commands associated with question number "x" 
    sedarg = sprintf ("/^#(ECHO-CAT_BREAK_Q%3.3d)/,/^#(END_Q%3.3d)/!d", x, x)
    system("sed -e ' " sedarg " ' " examfile " > temp_file.txt")

    # Uses SED to delete comments from "temp_file.txt", then saves rest to "in_file.txt"
    system("sed -e '/#(/d' temp_file.txt > in_file.txt") 

    select_line()

    # Appends out_file.txt to the output file
    system("cat out_file.txt >> randomized_exam.exam")
  }

# Sets executable permission on "randomized_exam.exam" so it may be run
  system("chmod a+x randomized_exam.exam")

# Clean-up: removes temporary files 
  system("rm in_file.txt out_file.txt temp_file.txt") 

}





# This function is where the random question selection occurs.
function select_line() 
{
  # Counts the number of lines in the input file "in_file.txt"
    "wc -l in_file.txt" | getline range
    close("wc -l in_file.txt")  # Necessary to use "getline" again in the future

  # Generates a random number, between 1 and "range"
    r = int(rand() * range) + 1

  # Diagnostic "printf" statement, shows selection of questions
    printf ("Question = %3.3d   Choices available = %d   Selection = %d \n", x, range, r)

  # Invokes SED to strip "in_file.txt" of all but the selected line
    sedarg = sprintf("%d!d",r)
    system("sed -e ' " sedarg " ' in_file.txt > temp_file.txt")

  # Invokes SED to strip "in_file.txt" of all leading escape characters ("#")
    sedarg = sprintf("s/#cat/cat/g")
    system("sed -e ' " sedarg " ' temp_file.txt > out_file.txt")

  return 
}



