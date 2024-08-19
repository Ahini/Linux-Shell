# Task: Basic Linux Commands with a Twist

What are the Linux commands to

1. View the content of a file and display line numbers.
   --> cat -n file.txt
2. Change the access permissions of files to make them readable, writable, and executable by the owner only.
   --> chmod 700 file.txt --> ls -l
3. Check the last 10 commands you have run.
   --> history | tail
4. Check the first 10 commands you have run.
   --> history | head
5. Remove a directory and all its contents.
    --> rm -r dir
6. Create a `fruits.txt` file, add content (one fruit per line) Apple, Mango, Banana, Cherry, Kiwi, Orange, Guava. Then, append "Pineapple" to the end of the file.and display the content.
    --> echo -e "Apple\nMango\nBanana\nCherry\nKiwi\nOrange\nGuava" >> fruits.txt --> echo "Pineapple" >> fruits.txt 
7. Show the first three fruits from the file in reverse order.
    --> head -3 fruits.txt | tac
8. Show the bottom three fruits from the file, and then sort them alphabetically.
    --> tail -3 fruits.txt | head
9. Create another file `Colors.txt`, add content (one color per line), Red, Pink, White, Black, Blue, Orange, Purple, Grey. Then, prepend "Yellow" to the beginning of the file and display the content.
    --> echo -e "Red\nPink\nWhite\nBlack\nBlue\nOrange\nPurple\nGrey" > Colors.txt -->  sed -i '1i Yellow' Colors.txt
10. Find and display the lines that are common between `fruits.txt` and `Colors.txt`.
    --> comm -12 <(sort Colors.txt) <(sort fruits.txt)
11. Count the number of lines, words, and characters in both `fruits.txt` and `Colors.txt`.
    --> wc -lwc fruits.txt Colors.txt
