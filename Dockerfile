FROM openjdk:8-jdk
LABEL maintainer="dpet23"

## Versions
# `ANDROID_COMPILE_SDK` should match the app's `compileSdkVersion`
ARG ANDROID_COMPILE_SDK="28"
# `ANDROID_BUILD_TOOLS` should match the app's `buildToolsVersion`
ARG ANDROID_BUILD_TOOLS="28.0.2"
# `ANDROID_SDK_TOOLS` is the latest version from https://developer.android.com/studio
ARG ANDROID_SDK_TOOLS="4333796"

## Install packages
RUN apt-get --quiet update --yes \
    && apt-get --quiet install --yes wget unzip lib32stdc++6 lib32z1

## Install the Android SDK
RUN cd /tmp \
    && wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip \
    && mkdir -p /opt/android-sdk-linux \
    && unzip -d /opt/android-sdk-linux android-sdk.zip \
    && echo y | /opt/android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null \
    && echo y | /opt/android-sdk-linux/tools/bin/sdkmanager "platform-tools" >/dev/null \
    && echo y | /opt/android-sdk-linux/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null

## Set up the environment
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $PATH:/opt/android-sdk-linux/platform-tools/
RUN yes | /opt/android-sdk-linux/tools/bin/sdkmanager --licenses

# Clean up
RUN rm -rv /tmp/*
