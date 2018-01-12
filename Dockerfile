FROM java:openjdk-8

MAINTAINER Kai Winter (https://github.com/kaiwinter)

RUN apt-get --quiet update --yes
RUN apt-get --quiet install --yes lib32stdc++6 lib32z1
RUN wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

RUN tar --extract --gzip --file=android-sdk.tgz

RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-26
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-27
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-27.0.1
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
RUN wget --quiet --output-document=gradle.zip https://services.gradle.org/distributions/gradle-4.1-bin.zip
RUN unzip -q gradle.zip
ENV ANDROID_HOME $PWD/android-sdk-linux