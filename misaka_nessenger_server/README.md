* go get golang.org/x/mobile/bind
* export ANDROID_HOME="/c/Programming/Android"
* export ANDROID_NDK_HOME="/c/Programming/Android/ndk/25.1.8937393"
* gomobile init
* gomobile bind -target=android -androidapi=21 MisakaNessengerServer
* mv MisakaNessengerServer.aar ../misaka_nessenger/android/app/libs
