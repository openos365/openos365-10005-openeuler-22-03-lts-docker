# openos365-10004-openeuler-22-03-lts-docker


## 1 support

* submit a issue
* chat with us: https://matrix.to/#/#openos365:matrix.org

## 2 what

* openos365-10004-openeuler-22-03-lts-docker docker images
  
## 3 why (values)

1. setup repo mirror for China `files/install.sh`
1. pr-install some packages `files/install.sh`
1. pre-config `file/root/`
1. networking problems `using github actions network`
1. save install and update time `build it using schedule actions`
1. publish and track `versions` changes
1. publish and track `yum.repo.d`

## 4 how to use

```
docker pull openos365/openos365-10004-openeuler-22-03-lts-docker-main:latest
docker run -it openos365/openos365-10004-openeuler-22-03-lts-docker-main:latest bash
```
