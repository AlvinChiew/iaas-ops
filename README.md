# AWS Ops
This is a terraform repository to perform IaaS on AWS Cloud Infrastructure
<br>


## DevOps Cycle
1. Create branch, commit change(s), push branch to Github
2. Create a new pull request (PR). PR check will be Executed by Github Actions to validate changes.
3. Squash and merge PR to `main` branch. Deployment workflow will be executed by GitHub Actions.
## Setting up pre-commit

`pre-commit` is used for lint, validate, and formatting terraform files as well as other utilities check such as secret detection before every commit.

To install, run
```bash
brew tap liamg/tfsec
brew install pre-commit gawk terraform-docs tflint tfsec coreutils

pre-commit install

```
