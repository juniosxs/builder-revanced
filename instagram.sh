#" by juniosxs
#

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Updating ReVanced Dependencies"
sh update.sh

echo "Building Instagram ReVanced"
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
-e="Hide ads" \
~/storage/downloads/*instagram*.apk

echo "Move Apk to Internal Storage"
mv *instagram*.apk ~/storage/shared/

echo "Finished 😀"
