> [!NOTE]
> Snapshot (2025-10-19) of the core components of my OpenWRT setup.

> [!CAUTION]
> I'm not an OpenWRT expert and don't really know what I'm doing, so please be cautious if using this as a reference. 🐉

# Preserving Configuration After `owut upgrade` on x86_64 OpenWRT
I encountered issues with my configuration being reset after running `owut upgrade` on my x86_64 OpenWRT installation.

First, I simply tried switching from the `generic-ext4-combined-efi.img.gz` image to the `generic-squashfs-combined-efi.img.gz` image, but that didn't preserve my configuration.

Next, I attempted to add the directories I wanted to preserve to `/etc/sysupgrade.conf`, but that didn't work either.

Eventually, I had success using a combination of the `--pre-install` and `--init-script` options, (see https://openwrt.org/docs/guide-user/installation/sysupgrade.owut).

This approach worked by backing up my configuration to a persistent directory before the upgrade and restoring it afterward. Note that I'm using the `generic-squashfs-combined-efi.img.gz` image for this to function correctly.

The folders contain some Ansible deployment tasks along with the scripts—hopefully, you'll find them useful. 😊

---

Perhaps the next step is to try a NixOS-based router setup ❄️, as I suspect this current approach might not be the most stable long-term solution.
