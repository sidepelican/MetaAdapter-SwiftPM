#!/bin/sh -ex

VERSION=6.16.0
wget -O FBAudienceNetwork-${VERSION}.zip https://developers.facebook.com/resources/FBAudienceNetwork-${VERSION}.zip
unzip -o FBAudienceNetwork-${VERSION}.zip

FRAMEWORK1=Static/FBAudienceNetwork.xcframework/ios-arm64/FBAudienceNetwork.framework
FRAMEWORK2=Static/FBAudienceNetwork.xcframework/ios-arm64_x86_64-simulator/FBAudienceNetwork.framework

function updatePlist() {
  local plist=$1
  /usr/libexec/PlistBuddy -c "Set :CFBundleVersion 1.0" ${plist}
  /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier FBAudienceNetwork" ${plist}
}
updatePlist ${FRAMEWORK1}/Info.plist
updatePlist ${FRAMEWORK2}/Info.plist

rm -rf FBAudienceNetwork.xcframework
xcodebuild -create-xcframework -framework ${FRAMEWORK1} -framework ${FRAMEWORK2} -output FBAudienceNetwork.xcframework

rm -rf FBAudienceNetwork-${VERSION}.zip
rm -rf Dynamic
rm -rf Static
