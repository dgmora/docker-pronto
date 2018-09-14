# Docker-pronto

A docker image to run code linting with [pronto](https://github.com/prontolabs/pronto)

## Running it

Set one of the following environment variables in CI:
```
PRONTO_GITHUB_ACCESS_TOKEN
PRONTO_GITLAB_API_PRIVATE_TOKEN
PRONTO_BITBUCKET_USERNAME
PRONTO_BITBUCKET_PASSWORD
```

Run this:
```
docker run -e "PRONTO_GITHUB_ACCESS_TOKEN=$PRONTO_GITHUB_ACCESS_TOKEN" -v $(pwd):/usr/src/app dgmora/pronto pronto run -c origin/master -f github_pr
```

Then, you will have comments in that PR.
