# by juniosxs

# Download ReVanced Dependencies
gh release download --skip-existing --repo https://github.com/juniosxs/rev-patches -p '*.jar' -p '*.json' --dir /sdcard/Download
gh release download --skip-existing --repo https://github.com/juniosxs/rev-integrations -p '*.apk' --dir /sdcard/Download
gh release download --skip-existing --repo https://github.com/juniosxs/rev-cli -p '*.jar' --dir /sdcard/Download
#______________________________________________

# force delete resource cache
rm -rf revanced-resource-cache

echo "Building YouTube ReVanced"
java -jar /sdcard/Download/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt2_64 \
--keystore custom/juniosxs.bks \
--alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle /sdcard/Download/revanced-patches*.jar \
--warn \
--purge \
--resource-cache revanced-resource-cache \
--exclusive \
--force \
-i "Hide ads" \
-i "Video ads" \
-i "External downloads" \
-i "Change header" \
-i "Hide cast button" \
-i "Hide player buttons" \
-i "Remove player controls background" \
-i "SponsorBlock" \
-i "Hide Shorts components" \
-i "Disable resuming Shorts on startup" \
-i "Theme" \
-i "Client spoof" \
-i "Bypass URL redirects" \
-i "Open links externally" \
-i "GmsCore support" \
-i "Minimized playback" \
-i "HDR auto brightness" \
-i "Remember video quality" \
-i "Hide ads" \
-i "Custom player overlay opacity" \
--merge /sdcard/Download/revanced-integrations-*.apk \
/sdcard/Download/*android.youtube*.apk \
--out /sdcard/YouTube-ReVanced.apk

echo "Finished 😀"
