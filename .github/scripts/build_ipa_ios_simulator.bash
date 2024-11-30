#!/bin/bash

project="TryCodeSecurity"

xcodebuild archive \
    -archivePath "$project" \
    -destination "generic/platform=iOS Simulator" \
    -project "ios/$project.xcodeproj" \
    -quiet \
    -scheme "$project"

xcodebuild \
    -archivePath "${project}.xcarchive" \
    -exportArchive \
    -exportOptionsPlist ".github/export_ipa_sample.plist" \
    -quiet
