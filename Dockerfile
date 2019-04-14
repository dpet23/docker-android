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
    && apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1

## Install the Android SDK
RUN cd /tmp \
    && wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip \
    && unzip -d /android-sdk-linux android-sdk.zip \
    && echo y | /android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null \
    && echo y | /android-sdk-linux/tools/bin/sdkmanager "platform-tools" >/dev/null \
    && echo y | /android-sdk-linux/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null

## Set up the environment
RUN export ANDROID_HOME=$PWD/android-sdk-linux \
    && export PATH=$PATH:$PWD/android-sdk-linux/platform-tools/ \
    && yes | /android-sdk-linux/tools/bin/sdkmanager --licenses

# Clean up
RUN rm -rv /tmp/*
