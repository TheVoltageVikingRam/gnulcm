1.
#!/bin/bash

# Default stop word
stopword="STOP"

# Check if a command-line argument is provided
if [ $# -gt 0 ]; then
    stopword=$1
fi

# Read input line by line
while IFS= read -r line; do
    # Check if the line contains the stop word
    if echo "$line" | grep -q "$stopword"; then
        # Print part of the line before the stop word
        echo "$line" | sed "s/$stopword.*//"
        break
    else
        # Print the whole line
        echo "$line"
    fi
done


2.
#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <even|odd> <args...>"
    exit 1
fi

# Extract the first argument
mode=$1
shift # Remove the first argument to process the rest

# Loop through the remaining arguments
index=1
for arg in "$@"; do
    if [[ "$mode" == "even" && $((index % 2)) -eq 0 ]]; then
        echo "$arg"
    elif [[ "$mode" == "odd" && $((index % 2)) -ne 0 ]]; then
        echo "$arg"
    fi
    index=$((index + 1))
done



3.

#!/bin/bash

# Declare an array to map numbers to words
numbers=("zero" "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten"
         "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen"
         "eighteen" "nineteen" "twenty" "thirty" "forty" "fifty" "sixty" "seventy"
         "eighty" "ninety" "hundred")

# Function to convert word numbers into numeric values
word_to_number() {
    local word=$1
    for i in "${!numbers[@]}"; do
        if [ "${numbers[$i]}" = "$word" ]; then
            echo $i
            return
        fi
    done
}

# Read input from standard input
read -r input

# Replace number words with their numeric equivalents
for i in "${!numbers[@]}"; do
    input=${input//${numbers[$i]}/$i}
done

# Replace word operators with their arithmetic equivalents
input=${input//plus/+}
input=${input//minus/-}
input=${input//times/*}
input=${input//by//}

# Evaluate the expression using `bc` (Basic Calculator)
result=$(echo "$input" | bc)

# Print the result
echo "$result"