#" by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building YouTube Music ReVanced"
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
-e="Enable exclusive audio playback" \
-e="GmsCore support" \
-e="Hide 'Get Music Premium' label" \
-e="Hide music video ads" \
-e="Permanent repeat" \
-e="Remove background playback restrictions" \
-e="Remove upgrade button" \
-e="Spoof client" \
~/storage/downloads/*youtube.music*.apk

echo "Move Apk to Internal Storage"
mv *youtube.music*.apk ~/storage/shared/

echo "Finished 😀"
