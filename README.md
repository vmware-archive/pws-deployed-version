# PWS deployed version

This repo contains the currently deployed version of:

- [CF-release](https://bosh.io/releases/github.com/cloudfoundry/cf-release)
- [Diego-release](https://bosh.io/releases/github.com/cloudfoundry-incubator/diego-release)
- [etcd-release](https://bosh.io/releases/github.com/cloudfoundry-incubator/etcd-release)
- [garden-linux-release](https://bosh.io/releases/github.com/cloudfoundry-incubator/garden-linux-release)

The current.json file is consumed by [https://status.run.pivotal.io](https://status.run.pivotal.io)

# Usage

# log into bosh

```
export BOSH_DIRECTOR=https://uri.to.bosh:25555
export BOSH_USER=bosh
export BOSH_PASSWORD=sameasmyluggage

bin/get_deployed_vers <deploymentname> <releasename_1> [releasename_2] [releasename_n]
```

# Requirements

jq >= 1.5 in $PATH
