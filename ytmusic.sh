# by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YT Music ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt/arm64-v8a/aapt2 \
--patch-bundle revanced/revanced-patches*.jar \
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
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*youtube.music*.apk \
--out YTMusic-ReVanced.apk

echo "Move Apk to Internal Storage"
mv YTMusic-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
