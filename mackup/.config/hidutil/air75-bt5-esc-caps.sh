#!/bin/sh

# Apply the mapping only when the Air75 Bluetooth keyboard service appears.
matching='{"VendorID":1452,"ProductID":591,"PrimaryUsagePage":1,"PrimaryUsage":6}'
mapping='{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000029},{"HIDKeyboardModifierMappingSrc":0x700000029,"HIDKeyboardModifierMappingDst":0x700000039}]}'
last_services=

while :; do
  services=$(/usr/bin/hidutil list --ndjson --matching "$matching" | /usr/bin/sed -n '/"type":"service"/s/.*"IORegistryEntryID":\([0-9][0-9]*\).*/\1/p')

  if [ -n "$services" ] && [ "$services" != "$last_services" ]; then
    if /usr/bin/hidutil property --matching "$matching" --set "$mapping" >/dev/null; then
      last_services=$services
    fi
  elif [ -z "$services" ]; then
    last_services=
  fi

  /bin/sleep 10
done
