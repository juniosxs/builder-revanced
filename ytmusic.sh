# by juniosxs

# Download ReVanced Dependencies
gh release download --skip-existing --repo https://github.com/juniosxs/rev-patches -p '*.jar' -p '*.json' --dir /sdcard/Download
gh release download --skip-existing --repo https://github.com/juniosxs/rev-integrations -p '*.apk' --dir /sdcard/Download
gh release download --skip-existing --repo https://github.com/juniosxs/rev-cli -p '*.jar' --dir /sdcard/Download
#______________________________________________

# force delete resource cache
rm -rf revanced-resource-cache

echo "Building YT Music ReVanced"
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
-i "Music video ads" \
-i "Codecs unlock" \
-i "Exclusive audio playback" \
-i "Compact header" \
-i "Minimized playback music" \
-i "Hide get premium" \
-i "Remove upgrade button" \
-i "Bypass certificate checks" \
-i "Vanced MicroG support" \
-i "Background play" \
--merge /sdcard/Download/revanced-integrations-*.apk \
/sdcard/Download/*youtube.music*.apk \
--out /sdcard/YTMusic-ReVanced.apk

echo "Finished 😀"
