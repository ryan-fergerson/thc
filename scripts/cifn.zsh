#!/usr/bin/env zsh

# Configurable notes directory
NOTES_DIR="${HOME}/notes"

# Create the notes directory if it doesn't exist
mkdir -p $NOTES_DIR

# Ask the user for the note name using fzf
result=$(cd $NOTES_DIR; command ls | sort -V | fzf --prompt="Select or type a note: " --print-query \
  --preview="bat --style=numbers --color=always --line-range :500 ${NOTES_DIR}/{}" \
  --preview-window=up,80%)

# The first line is the query (what the user typed)
# The second line (if it exists) is the selected note
note_name=$(echo "$result" | sed -n '2p')
query=$(echo "$result" | sed -n '1p')

# Check if the query starts with a special character
if [[ "$query" =~ ^[^a-zA-Z0-9] ]]; then
  # Remove the first character from the query
  note_name="${query:1}"
else
  # If no note was selected, use the query as the note name
  if [ -z "$note_name" ]; then
    note_name="$query"
  fi
fi

# If the note name is not empty
if [ -n "$note_name" ]; then
  # Check if the note name already has the .md extension
  if [[ $note_name != *.md ]]; then
    note_name="${note_name}.md"
  fi

    # The note file path
    note_file="${NOTES_DIR}/${note_name}"

    # Open the note using the text editor
    ${EDITOR:-vi} $note_file
  else
    echo "No note name provided"
fi

