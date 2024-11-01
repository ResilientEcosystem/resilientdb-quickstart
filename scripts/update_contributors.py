import requests
import os

query = """
{
  repository(owner:"apache", name:"incubator-resilientdb") {
    collaborators(first: 100) {
      edges {
        node {
          login
        }
      }
    }
  }
}
"""

headers = {"Authorization": f"Bearer {os.getenv('GITHUB_TOKEN')}"}
response = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
contributors = response.json()['data']['repository']['collaborators']['edges']

with open('docs/contributors.md', 'w') as file:
    file.write("# Contributors\n\n")
    for contributor in contributors:
        file.write(f"- {contributor['node']['login']}\n")
