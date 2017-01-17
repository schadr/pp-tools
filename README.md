This repository contains tools meant to help debugging a photon-platform deployment.


# pcurl
Photon-Platform uses Xenon as it's microservice framework.
Since Xenon is locked down via mutual authentication it is tedious to interact with Xenon directly for debugging purposes.

`pcurl` is just a shell wrapper that lets you interact with Xenon by running your curl command inside the Photon-Controller container.

To use it:
* In your environment, define MGMT_USER. It's the name of the user to
use to ssh to Photon Controller.

* In your environment, also define MGMT_PASSWORD. It's the password of
the MGMT_USER.

* The URL to curl should be https://IP-ADDRESS:19000/...

Example usage:
```
MGMT_USER=my-user MGMT_PASSWORD=my-password ./pcurl https://192.0.2.42:19000/photon/cloudstore/tenants?expand
```

If you are on a multi-user machine, it is better not to define the
environment variables on the command-line: this is shown for your
convenience.
