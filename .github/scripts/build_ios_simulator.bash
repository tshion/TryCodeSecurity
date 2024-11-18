#!/bin/bash

project="TryCodeSecurity"
xcodebuild \
    -project "./$project.xcodeproj"\
    -target "$project" \
    -arch arm64 \
    -sdk iphonesimulator
