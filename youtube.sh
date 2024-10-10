# by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YouTube ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt/arm64-v8a/aapt2 \
--patch-bundle revanced/revanced-patches*.jar \
--warn \
--purge \
--exclusive \
--force \
-i="Announcements" \
-i="Bypass URL redirects" \
-i="Bypass image region restrictions" \
-i="Change start page" \
-i="Copy video URL" \
-i="Custom player overlay opacity" \
-i="Disable player popup panels" \
-i="Disable resuming Shorts on startup" \
-i="Disable suggested video end screen" \
-i="Disable zoom haptics" \
-i="Downloads" \
-i="GmsCore support" \
-i="Hide Shorts components" \
-i="Hide ads" \
-i="Hide cast button" \
-i="Hide layout components" \
-i="Hide player buttons" \
-i="Open links externally" \
-i="Remember video quality" \
-i="Remove background playback restrictions" \
-i="Remove player controls background" \
-i="SponsorBlock" \
-i="Spoof client" \
-i="Swipe controls" \
-i="Video ads" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*android.youtube*.apk \
--out YouTube-ReVanced.apk

echo "Move Apk to Internal Storage"
mv YouTube-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
