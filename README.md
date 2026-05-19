# WFG100 Firmware Index

Static firmware metadata for WWKJ WFG100 ground-station downloads.

The directory is intended to be published with GitHub Pages at:

`https://wwkj-fx.github.io/wfg100-firmware-index`

Firmware assets are currently served by GitHub Pages from `firmware/`.
They can be moved to GitHub Releases later by updating the URLs in the JSON
index files.

## Firmware assets

- `ArduCopter-WFG100-4.6.3.apj`
  - source: `WWKJ-FX/WW-Ardupilot`, branch `WW-Copter-4.6.3`, git `dbd7f704c5f9`
  - sha256: `f149b433ac744213368bba3dfb469a3772f4f683adb7faea540298227dee68ee`
- `ArduCopter-WFG100-4.6.3-with_bl.hex`
  - sha256: `da7585151597de999993258a42818d1686e9fd9c8f502b9638c7d3b8c04f8716`
- `betaflight_2025.12.2_STM32H743_WFG100.hex`
  - source: `WWKJ-FX/ww-betaflight`, branch `ww-2025.12-maintenance`, git `9d8daa77eee6`
  - sha256: `23270692950510ebb3c90185988224baf924d4e5fd64d2901b52ee38f914a866`

## Published endpoints

- `ap/manifest.json`
- `ap/manifest.json.gz`
- `api/targets` served by `api/targets/index.html`
- `api/targets/WFG100` served by `api/targets/WFG100/index.html`
- `api/builds/2025.12.2/WFG100` served by `api/builds/2025.12.2/WFG100/index.html`
- `api/options/2025.12.2` served by `api/options/2025.12.2/index.html`

## Update flow

1. Build ArduPilot WFG100 Copter from `WWKJ-FX/WW-Ardupilot`, branch
   `WW-Copter-4.6.3`.
2. Upload `ArduCopter-WFG100-<version>.apj` to a GitHub Release.
3. Build Betaflight with `TARGET=STM32H743 CONFIG=WFG100`.
4. Upload `betaflight_<version>_STM32H743_WFG100.hex` to the same or a matching
   GitHub Release.
5. Edit the JSON files in this repo to point at the new release assets.
6. Run `pwsh ./scripts/build-index.ps1` to refresh `ap/manifest.json.gz`.
