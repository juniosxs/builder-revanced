#" by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YouTube ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--patches revanced/patches*.rvp \
--custom-aapt2-binary custom/aapt/arm64-v8a/aapt2 \
--keystore custom/revanced.keystore \
--keystore-entry-alias revanced \
--keystore-entry-password revanced \
--keystore-password revanced \
--purge \
--force \
--exclusive \
-e="Announcements" \
-e="Bypass URL redirects" \
-e="Bypass image region restrictions" \
-e="Change header" \
-Oheader="revanced*" \
-e="Copy video URL" \
-e="Custom player overlay opacity" \
-e="Disable player popup panels" \
-e="Disable resuming Shorts on startup" \
-e="Disable suggested video end screen" \
-e="Disable zoom haptics" \
-e="Downloads" \
-e="GmsCore support" \
-e="Hide Shorts components" \
-e="Hide ads" \
-e="Hide endscreen cards" \
-e="Hide layout components" \
-e="Hide player flyout menu items" \
-e="Hide player overlay buttons" \
-e="Hide video action buttons" \
-e="Miniplayer" \
-e="Open links externally" \
-e="Remember video quality" \
-e="Remove background playback restrictions" \
-e="Remove player controls background" \
-e="SponsorBlock" \
-e="Spoof video streams" \
-e="Swipe controls" \
-e="Theme" \
-OdarkThemeBackgroundColor="@android:color/system_neutral1_900" \
-OlightThemeBackgroundColor="@android:color/system_neutral1_50" \
-e="Video ads" \
~/storage/downloads/*youtube_*.apk

echo "Move Apk to Internal Storage"
mv *youtube_*.apk ~/storage/shared/

echo "Finished 😀"
