# by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YouTube ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--patch-bundle revanced/revanced-patches*.jar \
--merge revanced/revanced-integrations-*.apk \
--custom-aapt2-binary custom/aapt/arm64-v8a/aapt2 \
--keystore custom/revanced.keystore \
--keystore-entry-alias revanced \
--keystore-entry-password revanced \
--keystore-password revanced \
--warn \
--purge \
--exclusive \
--force \
-i="Announcements" \
-i="Bypass URL redirects" \
-i="Bypass image region restrictions" \
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
-i="Miniplayer" \
-i="Open links externally" \
-i="Player flyout menu" \
-i="Remember video quality" \
-i="Remove background playback restrictions" \
-i="Remove player controls background" \
-i="SponsorBlock" \
-i="Spoof video streams" \
-i="Swipe controls" \
-i="Theme" \
-i="Video ads" \
~/storage/downloads/*youtube_*.apk

echo "Move Apk to Internal Storage"
mv *youtube_*.apk ~/storage/shared/

echo "delete options"
rm *.json

echo "Finished 😀"