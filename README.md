# Docker Git image

[![Docker Stars](https://img.shields.io/docker/stars/dpet23/docker-android.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/dpet23/docker-android.svg)][hub]
[![Image Layers](https://shields.beevelop.com/docker/image/layers/dpet23/docker-android/latest.svg)][hub]
[![Image Size](https://shields.beevelop.com/docker/image/image-size/dpet23/docker-android/latest.svg)][hub]

Docker image for automated testing of Android apps.

Based on the instructions on the [GitLab website](https://about.gitlab.com/2018/10/24/setting-up-gitlab-ci-for-android-projects/).

---

### Supported Tags

* `latest`
* `debian`

View on [Docker Hub][hub]

---

### Build Info

* Based on [Debian Linux](https://www.debian.org/)

---

### Docker Pull Command

```
docker pull dpet23/docker-android
```

---

### Usage

```
docker build -t dpet23/docker-android:debian .
docker run -it --name docker-android dpet23/docker-android:debian /bin/bash
```

[hub]: https://hub.docker.com/r/dpet23/docker-android
