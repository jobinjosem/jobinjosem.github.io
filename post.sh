#!/bin/bash

# Ensure API key loads from .zshrc file
# source ~/.bashrc

# Get current date, year, and month
DATE=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DATEFORPOST=$(date -u '+%Y-%m-%d %H:%M:%S %z')

# Get title from user input
echo "Enter the post title:"
read TITLE

# Get slug from user input
echo "Enter the post slug:"
read SLUG

# Validate slug (e.g., check for spaces or special characters)
if [[ ! "$SLUG" =~ ^[a-z0-9-]+$ ]]; then
    echo "Invalid slug format. Use lowercase letters, numbers, and hyphens only."
    exit 1
fi

# Create year and month directories if they don't exist
mkdir -p "_posts/$YEAR/$MONTH"

# Create the file with YAML frontmatter
cat > "_posts/$YEAR/$MONTH/$DATE-$SLUG.md" <<EOL
---
title: "$TITLE"
date: $DATEFORPOST
categories:
- technical-writing
- AI
tags:
- azure
- kubernetes
keywords:
description: ""
---
<!--
### Description list
Sun
: the star around which the earth orbits

## Block Quote
> This line shows the _block quote_.

> An example showing the \`tip\` type prompt.
{: .prompt-tip }

## Tables

| Company                      | Contact          | Country |
|:-----------------------------|:-----------------|--------:|
| Alfreds Futterkiste          | Maria Anders     | Germany |

## Images

![Desktop View](/assets/img/wsl-bash-customization.png)
_Full screen width and center alignment_ -->
EOL

echo "Post created at _posts/$YEAR/$MONTH/$DATE-$SLUG.md"
