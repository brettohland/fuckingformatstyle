#!/bin/bash

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory>"
    echo "Example: $0 /path/to/html/files"
    exit 1
fi

target_dir="$1"

# Check if directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' does not exist"
    exit 1
fi

# Process all .html files in the directory and subdirectories
find "$target_dir" -type f -name "*.html" | while read -r file; do
    
    echo "Processing $file..."
    
    # Create a temporary file
    temp_file="${file}.tmp"
    
    # Use awk to process the file
    awk '
    BEGIN { in_code = 0; code = ""; }
    
    # Match opening tag
    /<code class="language-swift">/ {
        in_code = 1
        code = ""
        # Store everything before the tag
        match($0, /<code class="language-swift">/)
        print substr($0, 1, RSTART + RLENGTH - 1)
        # Get any content after the opening tag on same line
        remaining = substr($0, RSTART + RLENGTH)
        if (match(remaining, /<\/code>/)) {
            # Opening and closing on same line
            code = substr(remaining, 1, RSTART - 1)
            # Process the code
            gsub(/"/, "\\\"", code)  # Escape double quotes
            cmd = "SplashHTMLGen \"" code "\""
            cmd | getline result
            close(cmd)
            print result
            print substr(remaining, RSTART)
            in_code = 0
        } else {
            code = remaining
        }
        next
    }
    
    # Match closing tag
    /<\/code>/ && in_code {
        # Add content before closing tag
        match($0, /<\/code>/)
        code = code "\n" substr($0, 1, RSTART - 1)
        
        # Process the accumulated code through SplashHTMLGen
        gsub(/"/, "\\\"", code)  # Escape double quotes
        cmd = "SplashHTMLGen \"" code "\""
        cmd | getline result
        close(cmd)
        print result
        
        # Print the closing tag and anything after it
        print substr($0, RSTART)
        in_code = 0
        code = ""
        next
    }
    
    # Accumulate code content
    in_code {
        if (code == "") {
            code = $0
        } else {
            code = code "\n" $0
        }
        next
    }
    
    # Print all other lines as-is
    !in_code { print }
    ' "$file" > "$temp_file"
    
    # Replace original file with processed version
    mv "$temp_file" "$file"
done

echo "Done processing all HTML files in $target_dir and subdirectories."