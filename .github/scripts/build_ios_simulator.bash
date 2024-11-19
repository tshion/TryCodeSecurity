#!/bin/bash

project="TryCodeSecurity"
xcodebuild \
    -project "ios/$project.xcodeproj"\
    -target "$project" \
    -arch arm64 \
    -sdk iphonesimulator
