# by juniosxs

# force delete resource cache
rm -rf *resource-cache

echo "Building YT Music ReVanced"
java -jar revanced/revanced-cli*.jar patch \
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
/mnt/c/Users/junio/Downloads/*youtube.music*.apk \
--out YTMusic-ReVanced.apk

echo "Finished 😀"
