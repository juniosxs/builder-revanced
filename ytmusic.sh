# by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YT Music ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt/arm64-v8a/aapt2 \
--keystore custom/juniosxs.bks \
--keystore-entry-alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle revanced/revanced-patches*.jar \
--warn \
--purge \
--exclusive \
--force \
-i="GmsCore support" \
-i="Bypass certificate checks" \
-i="Hide video ads" \
-i="Remove upgrade button" \
-i="Hide category bar" \
-i="Hide 'Get Music Premium' label" \
-i="Remove background playback restrictions" \
-i="Enable exclusive audio playback" \
-i="Permanent shuffle" \
-i="Permanent repeat" \
-i="Spoof Wi-Fi connection" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*youtube.music*.apk \
--out YTMusic-ReVanced.apk

echo "Move Apk to Internal Storage"
mv YTMusic-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
