# PWS deployed version

This repo contains the currently deployed versions of every release in release_repos.json

The current.json file is consumed by [https://status.run.pivotal.io](https://status.run.pivotal.io)

# Usage

```
bin/update_current release version stemcell
```

For example, in CI we can run this script after a cf-deployment succeeds like so:
```
bin/update_current cf-deployment 1.0.0 3445.11
```
