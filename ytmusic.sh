# by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YouTube Music ReVanced"
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
-i="Bypass certificate checks" \
-i="Enable exclusive audio playback" \
-i="GmsCore support" \
-i="Hide 'Get Music Premium' label" \
-i="Hide video ads" \
-i="Permanent repeat" \
-i="Remove background playback restrictions" \
-i="Remove upgrade button" \
~/storage/downloads/*youtube.music*.apk

echo "Move Apk to Internal Storage"
mv *youtube.music*.apk ~/storage/shared/

echo "delete options"
rm *.json

echo "Finished 😀"