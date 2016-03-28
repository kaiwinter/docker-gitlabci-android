FROM ubuntu:16.04

MAINTAINER Kai Winter (https://github.com/kaiwinter)

RUN apt-get update --yes
RUN apt-get install --yes wget tar unzip openjdk-7-jdk lib32stdc++6 lib32z1
RUN wget --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

RUN tar --extract --gzip --file=android-sdk.tgz

RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-23
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-23.0.3
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
RUN wget --output-document=gradle.zip https://services.gradle.org/distributions/gradle-2.12-bin.zip
RUN unzip -q gradle.zip
ENV ANDROID_HOME $PWD/android-sdk-linux

CMD [""]
