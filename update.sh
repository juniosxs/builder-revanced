#######
#
echo "Download ReVanced Dependencies"
gh release download --skip-existing --repo https://github.com/ReVanced/revanced-patches -p '*.jar*' -p '*.json' --dir revanced/
gh release download --skip-existing --repo https://github.com/ReVanced/revanced-integrations -p '*.apk*' --dir revanced/
gh release download --skip-existing --repo https://github.com/ReVanced/revanced-cli -p '*.jar*' --dir revanced/
#______________________________________________
