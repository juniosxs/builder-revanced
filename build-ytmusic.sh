# by juniosxs

# force delete resource cache
rm -rf revanced-resource-cache

echo "Building YT Music ReVanced"
java -jar /sdcard/Download/revanced-cli*.jar patch -pw \
--custom-aapt2-binary custom/aapt2_64 \
--keystore custom/juniosxs.bks \
--alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle /sdcard/Download/revanced-patches*.jar \
--exclusive \
-i Music" "video" "ads \
-i Codecs" "unlock \
-i Exclusive" "audio" "playback \
-i Compact" "header \
-i Minimized" "playback" "music \
-i Hide" "get" "premium \
-i Remove" "upgrade" "button \
-i Bypass" "certificate" "checks \
-i Vanced" "MicroG" "support \
-i Background" "play \
--merge /sdcard/Download/revanced-integrations-*.apk \
/sdcard/Download/*youtube.music*.apk \
--out /sdcard/ReVanced-YTMusic.apk

echo "Finished"