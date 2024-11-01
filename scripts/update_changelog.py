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
    os.makedirs("docs", exist_ok=True)
    with open("docs/changelog.md", "w") as file:
        file.write("# Changelog\n\n")
        for release in releases:
            file.write(f"## {release['name']} - {release['published_at']}\n\n")
            file.write(f"{release['body']}\n\n")
else:
    print("Error fetching releases:", response.status_code)
