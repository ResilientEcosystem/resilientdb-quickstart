import requests
import os

# GitHub repository details
owner = "apache"
repo = "incubator-resilientdb"

# GitHub API URL for releases
url = f"https://api.github.com/repos/{owner}/{repo}/releases"

# Fetch releases
response = requests.get(url)
if response.status_code == 200:
    releases = response.json()

    # Create or update changelog.md
    os.makedirs("../docs", exist_ok=True)
    changelog_content = "# Changelog\n\n"
    for release in releases:
        changelog_content += f"## {release['name']} - {release['published_at']}\n\n"
        changelog_content += f"{release['body']}\n\n"
    
    # Write to file only if content has changed
    filepath = "../docs/changelog.md"
    if not os.path.isfile(filepath) or open(filepath).read() != changelog_content:
        with open(filepath, "w") as file:
            file.write(changelog_content)
else:
    print("Error fetching releases:", response.status_code)
