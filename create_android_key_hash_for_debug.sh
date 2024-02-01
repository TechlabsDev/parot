#!/bin/bash
cd ..
chmod -R +x parot
cd parot || exit
keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -keypass android | openssl sha1 -binary | openssl base64
