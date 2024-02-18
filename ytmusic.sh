# by juniosxs

# Download ReVanced Dependencies
gh release download --skip-existing --repo https://github.com/juniosxs/rev-patches -p '*.jar' -p '*.json' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-integrations -p '*.apk' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-cli -p '*.jar' --dir revanced/
#______________________________________________

# force delete resource cache
rm -rf *cache* *.json

echo "Building YT Music ReVanced"
java -jar revanced/revanced-cli*.jar patch \
--custom-aapt2-binary custom/aapt2_64 \
--keystore custom/juniosxs.bks \
--alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle revanced/revanced-patches*.jar \
--warn \
--purge \
--exclusive \
--force \
-i "Music video ads" \
-i "Codecs unlock" \
-i "Exclusive audio playback" \
-i "Compact header" \
-i "Minimized playback music" \
-i "Hide get premium" \
-i "Remove upgrade button" \
-i "Permanent shuffle" \
-i "Permanent repeat" \
-i "Bypass certificate checks" \
-i "GmsCore support" \
-i "Background play" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*youtube.music*.apk \
--out YTMusic-ReVanced.apk

# Move Apk to Internal Storage
mv YTMusic-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
