# by juniosxs
#
echo "Download ReVanced Dependencies"
gh release download --skip-existing --repo https://github.com/juniosxs/rev-patches -p '*.jar' -p '*.json' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-integrations -p '*.apk' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-cli -p '*.jar' --dir revanced/
#______________________________________________

echo "force delete resource cache"
rm -rf *cache* *.json

echo "Building YT Music ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt2_64 \
--keystore custom/juniosxs.bks \
--keystore-entry-alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle revanced/revanced-patches*.jar \
--warn \
--purge \
--exclusive \
--force \
-i="Bypass certificate checks" \
-i="Enable exclusive audio playback" \
-i="GmsCore support" \
-i="Hide 'Get Music Premium' label" \
-i="Hide music video ads" \
-i="Minimized playback" \
-i="Remove upgrade button" \
-i="Hide category bar" \
-i="Permanent shuffle" \
-i="Permanent repeat" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*youtube.music*.apk \
--out YTMusic-ReVanced.apk

echo "Move Apk to Internal Storage"
mv YTMusic-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
