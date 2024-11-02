import requests
import os

# Set up API request
headers = {"Authorization": f"Bearer {os.getenv('GITHUB_TOKEN')}"}
url = "https://api.github.com/repos/apache/incubator-resilientdb/contributors"
response = requests.get(url, headers=headers)

# Check response status
print("Response Status:", response.status_code)
print("Response Content:", response.json())

# Process and write contributors
if response.status_code == 200:
    contributors = response.json()

    # Ensure the docs directory exists
    os.makedirs('docs', exist_ok=True)

    with open('docs/contributors.md', 'w') as file:
        # Add a header and introductory message
        file.write("# Contributors\n\n")
        file.write("Thank you to all the amazing people who contribute to this project! 💙 \n\n")
        file.write("---\n\n")

        # Write each contributor with an avatar and link
        for contributor in contributors:
            file.write(f"![{contributor['login']}]({contributor['avatar_url']}&s=50) ")  # 50px avatar
            file.write(f"[{contributor['login']}]({contributor['html_url']})\n\n")

else:
    print("Error: Could not fetch contributors. Check API token and permissions.")
