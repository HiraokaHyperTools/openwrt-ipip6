# ipip6 package feed

## ⚠ Officially available since: OpenWrt 23.05.3

ipip6 seems to be merged into official OpenWrt 23.05.3 (Released: Fri, 22 Mar 2024)

- [ds-lite: Add support for IPIP6(RFC2473) tunnel · openwrt/openwrt@21eeb45](https://github.com/openwrt/openwrt/commit/21eeb45420cf12c6df9b39b619f6579b3ec32bb4)
- [luci-proto-ipv6: Add support for IPIP6(RFC2473) tunnel by missing233 · Pull Request #6875 · openwrt/luci](https://github.com/openwrt/luci/pull/6875)

So, it reports conflicts if you are trying to install this `ipip6` package into `OpenWrt 23.05.3`.

## Description

This is an ipip6 package feed containing community maintained package.

## Usage

Check [[OpenWrt Wiki] Build system usage](https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem) about how to build.

To use these packages, add the following line to the feeds.conf
in the OpenWrt buildroot:

```
src-git ipip6 https://github.com/HiraokaHyperTools/openwrt-ipip6.git
```

This feed should be included and enabled by default in the OpenWrt buildroot. To install all its package definitions, run:

```
./scripts/feeds update ipip6
./scripts/feeds install ipip6
```

The ipip6 package should now appear in menuconfig.

```
make menuconfig
```

Enter `Network`:

![2023-08-21_11h10_58](https://github.com/HiraokaHyperTools/openwrt-ipip6/assets/5955540/a4c9d73b-47aa-4188-a682-e6971d76c81a)

Check `ipip6` with `M`:

![2023-08-21_11h11_07](https://github.com/HiraokaHyperTools/openwrt-ipip6/assets/5955540/c79493c3-6730-4ce7-9c24-6969cc6ef7be)

Save to `.config`.

And then `Exit`.

The following command will make package `bin/packages/mipsel_24kc/ipip6/ipip6_0.1-4_all.ipk` or such.

```
make package/ipip6/compile
```

## Download

- [ipip6_0.1-6](https://github.com/HiraokaHyperTools/openwrt-ipip6/releases/download/v0.1-6/ipip6_0.1-6_all.ipk)
