# by juniosxs

# force delete resource cache
rm -rf revanced-resource-cache

echo "Building YouTube ReVanced"
java -jar /sdcard/Download/revanced-cli*.jar patch -pw \
--custom-aapt2-binary custom/aapt2_64 \
--keystore custom/juniosxs.bks \
--alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle /sdcard/Download/revanced-patches*.jar \
--exclusive \
-i Hide" "ads \
-i Video" "ads \
-i External" "downloads \
-i Premium" "heading \
-i Hide" "cast" "button \
-i Hide" "player" "buttons \
-i Remove" "player" "controls" "background \
-i SponsorBlock \
-i Disable" "Shorts" "on" "startup \
-i Theme \
-i Client" "spoof \
-i Bypass" "URL" "redirects \
-i Open" "links" "externally \
-i Vanced" "MicroG" "support \
-i Minimized" "playback \
-i HDR" "auto" "brightness \
-i Remember" "video" "quality \
-i Hide" "ads \
--merge /sdcard/Download/revanced-integrations-*.apk \
/sdcard/Download/*android.youtube*.apk \
--out /sdcard/ReVanced-Youtube.apk

echo "Finished"