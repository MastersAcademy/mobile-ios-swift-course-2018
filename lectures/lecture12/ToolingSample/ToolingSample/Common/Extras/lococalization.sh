args=(
  --credentials "$SRCROOT/Common/Extras/secret.json" \ #add secret json for spreadsheet edit permission
  --platform "ios" \
  --spreadsheet "" \ #add spreadsheet ID
  --formats-tab "goloc_formats" \
  --tab "simple_tab" \ #tab name of spreadsheet 
  --key-column "_key" \ 
  --resources "$SRCROOT/ToolingSample/Resources/Localization" \
  --default-localization "en" \
  --default-localization-file-path "$SRCROOT/ToolingSample/Resources/Localization/Base.lproj/Localizable.strings" \
  --empty-localization-match "(^$|^[xX]$)"
)
if [ "${CONFIGURATION}" = "Release" ]; then
    args+=(--stop-on-missing)
fi

"$SRCROOT/Common/Extras/goloc_darwin_amd64" "${args[@]}"
