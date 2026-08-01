# OPlus Core Magisk Module

## DISCLAIMER
- OPlus apps and blobs are owned by OPlus™.
- The MIT license specified here is for the Magisk Module only, not for OPlus apps and blobs.

## Descriptions
System core framework library of  ROM ported from OnePlus 9 Pro (OnePlus9Pro) as a dependency of any OPlus/OnePlus/realme/OPPO Magisk Modules

## For OPlus Apps Porting
- You need to declare this line bellow in your app AndroidManifest.xml at `<application />` to use this OPlus Core:

  `<uses-library android:name="oplus" android:required="false" />`

- Do not do above if your app has it's own library!
- Do not white list the library with your own Magisk Module /system/etc/permissions/ because there might be a conflict!

## Sources
- https://dumps.tadiphone.dev/dumps/oneplus/oneplus9pro qssi-user-13-TP1A.220905.001-1698121073735-release-keys--IN
- https://dumps.tadiphone.dev/dumps/oneplus/op594dl1 qssi-user-14-UKQ1.230924.001-1701915639192-release-keys--US
- https://dumps.tadiphone.dev/dumps/oneplus/op594dl1 qssi-user-14-UP1A.231005.007-1716868681220-release-keys--IN
- lib*.so: https://dumps.tadiphone.dev/dumps/oneplus/op535dl1 qssi-user-14-UKQ1.230924.001-1719909745718-release-keys--IN

## Changelog

v1.3
- Resets module folders/files permissions at post-fs-data
- Move _uninstall.log to /data/adb/logs/

v1.2
- Fix wrong target in latest KernelSU

v1.1
- Abort installation if fail to mount mirror system
- Fix a bug in post-fs-data.sh

v1.0
- Fix descriptors

v0.9
- Fix crashes in SDK 32 and bellow

v0.8
- Fix crashes in Bliss OS ROM

v0.7
- Android 15 QPR2 (BP1A) support
- Update android.view.IRemoteAnimationTargetExt class

v0.6-R
- Fix wrong minimum SDK

v0.6
- Re-add getDefaultThemePath method fix (It was accidentally removed in previous version)

v0.5
- Fix some methods

## Requirements
- Android 9 (SDK 28) and up
- NOT in OPlus ROM
- Magisk or Kitsune Mask or KernelSU or Apatch installed

## Installation Guide & Download Link
- If you are using KernelSU, you need to disable Unmount Modules by Default in KernelSU app settings and install https://github.com/KernelSU-Modules-Repo/meta-overlayfs or https://github.com/KernelSU-Modules-Repo/magic_mount_rs or https://github.com/KernelSU-Modules-Repo/hybrid_mount or https://github.com/maxsteeel/nomount first depending on ROM compatibility
- Install this module https://bicolink.com/Xy via Magisk app or Kitsune Mask app or KernelSU app or Apatch app or Recovery if Magisk or Kitsune Mask installed
- Install any OPlus/OnePlus/realme/OPPO Magisk Module which depends on this module
- Reboot

## Download Tutorial
https://t.me/ryukinotes/97

## Optionals
Global: https://t.me/ryukinotes/35

## Troubleshootings
Global: https://t.me/ryukinotes/34

## Support & Bug Report
- https://t.me/ryukinotes/54
- If you don't do above, issues will be closed immediately

## Credits and Contributors
- @HuskyDG
- https://t.me/androidryukimodsdiscussions
- You can contribute ideas about this Magisk Module here: https://t.me/androidappsportdevelopment

## Sponsors
https://t.me/ryukinotes/25


