This repository contains tools meant to help debugging a photon-platform deployment.


# pcurl
Photon-Platform uses Xenon as it's microservice framework.
Since Xenon is locked down via mutual authentication it is tedious to interact with Xenon directly for debugging purposes.

`pcurl` is just a shell wrapper that lets you interact with Xenon by running your curl command inside the Photon-Controller container.
