#!/bin/bash

# Function to convert date to yyyy-mm-dd format
convert_date() {
    local date=$1
    # Remove quotes and any surrounding whitespace
    date=$(echo "$date" | sed 's/^["[:space:]]*//; s/["[:space:]]*$//')
    
    # If already in yyyy-mm-dd format, return as is (without quotes)
    if [[ $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        echo "$date"
        return
    fi
    
    # Extract components from mm-dd-yyyy or mm-dd-yy format
    if [[ $date =~ ^([0-9]{1,2})-([0-9]{1,2})-([0-9]{2,4})$ ]]; then
        local month="${BASH_REMATCH[1]}"
        local day="${BASH_REMATCH[2]}"
        local year="${BASH_REMATCH[3]}"
        
        # Remove leading zeros before arithmetic
        month=$(echo "$month" | sed 's/^0*//')
        day=$(echo "$day" | sed 's/^0*//')
        
        # Validate month and day
        if [ "$month" -gt 0 ] && [ "$month" -le 12 ] && [ "$day" -gt 0 ] && [ "$day" -le 31 ]; then
            # Add leading zeros back
            month=$(printf "%02d" "$month")
            day=$(printf "%02d" "$day")
            
            # Convert 2-digit year to 4-digit year
            if [ ${#year} -eq 2 ]; then
                if [ "$year" -lt 70 ]; then
                    year="20$year"
                else
                    year="19$year"
                fi
            fi
            
            echo "$year-$month-$day"
        else
            echo "$date"  # Return original if invalid date
        fi
    else
        echo "$date"  # Return original if no match
    fi
}

# Process each markdown file
process_file() {
    local file=$1
    local temp_file="${file}.tmp"
    local in_frontmatter=false
    local in_div=false
    
    # Process the file line by line
    while IFS= read -r line || [ -n "$line" ]; do
        # Handle YAML frontmatter
        if [[ $line == "---" ]]; then
            if [ "$in_frontmatter" = false ]; then
                in_frontmatter=true
            else
                in_frontmatter=false
            fi
            echo "$line" >> "$temp_file"
            continue
        fi
        
        if [ "$in_frontmatter" = true ]; then
            # Convert date in frontmatter
            if [[ $line =~ ^date:.*$ ]]; then
                local old_date=$(echo "$line" | sed 's/^date: *//')
                local new_date=$(convert_date "$old_date")
                echo "date: $new_date" >> "$temp_file"
            else
                echo "$line" >> "$temp_file"
            fi
        else
            # Skip markdown titles (e.g., **Title**)
            if [[ $line =~ ^\*\*.+\*\*$ ]]; then
                continue
            fi
            
            # Skip image links
            if [[ $line =~ ^!\[.*\] ]]; then
                continue
            fi
            
            # Handle div tags
            if [[ $line =~ \<div.*\> ]]; then
                in_div=true
                continue
            fi
            if [[ $line =~ \</div\> ]]; then
                in_div=false
                continue
            fi
            
            # Process content
            if [ "$in_div" = true ] || [[ $line =~ ^\* ]]; then
                # Remove bullet points and leading/trailing spaces
                line=$(echo "$line" | sed 's/^\* *//' | sed 's/^ *//; s/ *$//')
                
                # Skip empty lines or &nbsp; lines
                if [[ $line == "&nbsp;" || -z "$line" ]]; then
                    echo "" >> "$temp_file"
                    continue
                fi
                
                # Output the cleaned line
                if [ -n "$line" ]; then
                    echo "$line" >> "$temp_file"
                fi
            else
                # Pass through lines that aren't in divs or bullet lists
                # but only if they're not empty
                if [ -n "$line" ]; then
                    echo "$line" >> "$temp_file"
                fi
            fi
        fi
    done < "$file"
    
    # Replace original file with processed file
    mv "$temp_file" "$file"
}

# Main script
echo "Starting file processing..."

# Find all markdown files recursively
find . -type f -name "*.md" | while read -r file; do
    echo "Processing: $file"
    process_file "$file"
done

echo "Processing complete."