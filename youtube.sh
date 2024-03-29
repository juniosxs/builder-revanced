# by juniosxs

# Download ReVanced Dependencies
gh release download --skip-existing --repo https://github.com/juniosxs/rev-patches -p '*.jar' -p '*.json' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-integrations -p '*.apk' --dir revanced/
gh release download --skip-existing --repo https://github.com/juniosxs/rev-cli -p '*.jar' --dir revanced/
#______________________________________________

# force delete resource cache
rm -rf *cache* *.json

echo "Building YouTube ReVanced"
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
-i="Announcements" \
-i="Bypass URL redirects" \
-i="Change start page" \
-i="Client spoof" \
-i="Custom player overlay opacity" \
-i="Disable resuming Shorts on startup" \
-i="Disable suggested video end screen" \
-i="Downloads" \
-i="GmsCore support" \
-i="Hide Shorts components" \
-i="Hide ads" \
-i="Hide endscreen cards" \
-i="Hide player buttons" \
-i="Minimized playback" \
-i="Open links externally" \
-i="Player flyout menu" \
-i="Remember video quality" \
-i="SponsorBlock" \
-i="Swipe controls" \
-i="Theme" \
-i="Video ads" \
-i="Change header" \
-i="Hide cast button" \
-i="Remove player controls background" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*android.youtube*.apk \
--out YouTube-ReVanced.apk
# Move Apk to Internal Storage
mv YouTube-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
