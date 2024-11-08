import feedparser
import os

# URL of your blog's RSS feed
rss_url = 'https://blog.resilientdb.com/feed.xml'

# Fetch and parse the RSS feed
feed = feedparser.parse(rss_url)

# Path to your TOC file
toc_file_path = 'docs/blog.md'

# Generate the TOC content
toc_content = '# Blog Table of Contents\n\n'
for entry in feed.entries:
    title = entry.title
    link = entry.link
    toc_content += f'- [{title}]({link})\n'

# Write the TOC content to the file
with open(toc_file_path, 'w') as toc_file:
    toc_file.write(toc_content)