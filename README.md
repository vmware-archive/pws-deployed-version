# PWS deployed version

This repo contains the currently deployed versions of every release in release_repos.json

The current.json file is consumed by [https://status.run.pivotal.io](https://status.run.pivotal.io)

# Usage

# get deployed version of an arbitrary deployment

```
export BOSH_DIRECTOR=https://uri.to.bosh:25555
export BOSH_USER=bosh
export BOSH_PASSWORD=sameasmyluggage
export BOSH_CLIENT=someclient
export BOSH_CLIENT_SECRET=somesupersecret

bin/get_deployed_vers <deploymentname> <releasename_1> [releasename_2] [releasename_n]
```

# update the current.json in regards to Pivotal Web Services
```
# same exports as above
bin/update_current
```
