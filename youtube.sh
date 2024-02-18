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
--alias juniosxs \
--keystore-entry-password juniosxs \
--keystore-password juniosxs \
--patch-bundle revanced/revanced-patches*.jar \
--warn \
--purge \
--exclusive \
--force \
-i "Hide ads" \
-i "Video ads" \
-i "External downloads" \
-i "Swipe controls" \
-i "Change header" \
-i "Hide cast button" \
-i "Hide player buttons" \
-i "Remove player controls background" \
-i "SponsorBlock" \
-i "Hide Shorts components" \
-i "Player flyout menu" \
-i "Disable resuming Shorts on startup" \
-i "Theme" \
-i "Client spoof" \
-i "Bypass URL redirects" \
-i "Open links externally" \
-i "GmsCore support" \
-i "Minimized playback" \
-i "HDR auto brightness" \
-i "Remember video quality" \
-i "Hide ads" \
-i "Custom player overlay opacity" \
-i "Change start page" \
--merge revanced/revanced-integrations-*.apk \
~/storage/downloads/*android.youtube*.apk \
--out YouTube-ReVanced.apk

# Move Apk to Internal Storage
mv YouTube-ReVanced.apk ~/storage/shared/

echo "Finished 😀"
