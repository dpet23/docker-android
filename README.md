# Docker Android image

[![Docker Stars](https://img.shields.io/docker/stars/dpet23/docker-android.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/dpet23/docker-android.svg)][hub]

Docker image for automated testing of Android apps.

Based on the instructions on the [GitLab website](https://about.gitlab.com/2018/10/24/setting-up-gitlab-ci-for-android-projects/).

---

### Supported Tags

* `debian`
* `alpine`

View on [Docker Hub][hub]

---

### Docker Pull Command

```
docker pull dpet23/docker-android:<tag>
```

---

### Usage

```
docker build -t dpet23/docker-android:<tag> .
docker run -it --name docker-android dpet23/docker-android:<tag> /bin/bash
```

[hub]: https://hub.docker.com/r/dpet23/docker-android
