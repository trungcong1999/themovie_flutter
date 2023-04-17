#!/bin/bash
set -e
# Application Configuration
APP_NAME="Your app name"
BUNDLE_ID="com.yourcompany.yourapp"
APP_VERSION="1.0"
APK_PATH="/path/to/your/app.apk"
IPA_PATH="/path/to/your/app.ipa"

# Google Play Configuration
PLAY_STORE_KEY="path/to/your/key.json"
TRACK="alpha"
RELEASE_NOTES="Notes for the new version"

# App Store Configuration 
APP_STORE_USERNAME="youremail@example.com"
APP_STORE_PASSWORD="yourpassword"
APP_SPECIFIC_PASSWORD="yourappspecificpassword"
ITC_TEAM_ID="yourteamid"
ITC_PROVIDER_ID="yourproviderid"

# Selecting a deployment platform
PLATFORM=$1
if [[ $PLATFORM == "android" ]]; then
    # Deploy to Google Play
    echo "Deploying to Google Play..."
    fastlane supply --json_key $PLAY_STORE_KEY --track $TRACK --apk $APK_PATH --skip_upload_metadata --skip_upload_images --skip_upload_screenshots --skip_upload_aab --skip_upload_obbs --skip_upload_bundle --release_notes $RELEASE_NOTES
elif [[ $PLATFORM == "ios" ]]; then
    # Deploy to App Store
    echo "Deploying to App Store..."
    fastlane deliver --username $APP_STORE_USERNAME --password $APP_SPECIFIC_PASSWORD --app_identifier $BUNDLE_ID --ipa $IPA_PATH --skip_screenshots --skip_metadata --team_id $ITC_TEAM_ID --provider $ITC_PROVIDER_ID --submit_for_review
else
    # If the correct platform is not selected, an error message will appear
    echo "Please specify platform as 'android' or 'ios'"
    exit 1
fi

# install fastlane (install ruby:  sudo apt-get install -y ruby ruby-dev build-essential)
# run gem install fastlane -NV
# run fastlane init (main)
# run fastlane deliver init
# run fastlane supply init
# run fastlane run configure_setup
# run fastlane run configure_add_device
# run fastlane run configure_add_app_service
# run fastlane run configure_add_app_group
# run fastlane run configure_add_keychain_access_group
# run fastlane run configure_add_url_scheme
# run fastlane run configure_add_background_mode
# run fastlane run configure_add_capabilities
# run fastlane run configure_add_app_id
# run fastlane run configure_add_bundle_id
# run fastlane run configure_add_provisioning_profile
# run fastlane run configure_add_team
# run fastlane run configure_add_apple_pay_merchant_id
# run fastlane run configure_add_apple_pay_certificate


# run chmod+x deploy_app_to_store.sh
# run ./deploy_app_to_store.sh android
# run./deploy_app_to_store.sh ios

