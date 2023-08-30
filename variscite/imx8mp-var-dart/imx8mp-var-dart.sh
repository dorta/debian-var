readonly ARCH_CPU="64BIT"

# SOC
readonly SOC="mx8mp"
readonly SOC_SERIES="imx8"
readonly SOC_FAMILY="imx8m"

#64 bit CROSS_COMPILER config and paths
readonly G_CROSS_COMPILER_64BIT_NAME="arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu"
readonly G_CROSS_COMPILER_ARCHIVE_64BIT="${G_CROSS_COMPILER_64BIT_NAME}.tar.xz"
readonly G_EXT_CROSS_64BIT_COMPILER_LINK="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/${G_CROSS_COMPILER_ARCHIVE_64BIT}"
readonly G_CROSS_COMPILER_64BIT_PREFIX="aarch64-none-linux-gnu-"
readonly G_CROSS_COMPILER_64BIT_PATH="${G_TOOLS_PATH}/${G_CROSS_COMPILER_64BIT_NAME}/bin"

# GIT repositories to fetch
git_repos=(
	"G_UBOOT"
	"G_LINUX_KERNEL"
	"G_IMXBOOT"
	"G_FREERTOS_VAR"
	"G_META_VARISCITE_BSP_COMMON"
	"G_META_VARISCITE_BSP_IMX"
	"G_IMX_ATF"
)

# meta-variscite-bsp-common
readonly G_META_VARISCITE_BSP_COMMON_SRC_DIR="${DEF_SRC_DIR}/meta-variscite-bsp-common"
readonly G_META_VARISCITE_BSP_COMMON_GIT="https://github.com/varigit/meta-variscite-bsp-common"
readonly G_META_VARISCITE_BSP_COMMON_BRANCH="mickledore-var01"
readonly G_META_VARISCITE_BSP_COMMON_REV="61a9f1e114642f144ad05a931eff9fa7c3bf81ef"

# meta-variscite-bsp-imx
readonly G_META_VARISCITE_BSP_IMX_SRC_DIR="${DEF_SRC_DIR}/meta-variscite-bsp-imx"
readonly G_META_VARISCITE_BSP_IMX_GIT="https://github.com/varigit/meta-variscite-bsp-imx"
readonly G_META_VARISCITE_BSP_IMX_BRANCH="mickledore-var01"
readonly G_META_VARISCITE_BSP_IMX_REV="40ba61a78f91deae1011dfd63fbdb1786a15b1c2"

#imx-atf
readonly G_IMX_ATF_SRC_DIR="${DEF_SRC_DIR}/imx-atf"
readonly G_IMX_ATF_GIT="https://github.com/varigit/imx-atf.git"
readonly G_IMX_ATF_BRANCH="lf_v2.8_var01"
readonly G_IMX_ATF_REV="8ea3d56c4fd164b369023f5b7a8ca99bd5d484a4"

# imx-mkimage
readonly G_IMXBOOT_SRC_DIR="${DEF_SRC_DIR}/imx-mkimage"
readonly G_IMXBOOT_GIT="https://github.com/nxp-imx/imx-mkimage.git"
readonly G_IMXBOOT_BRANCH="lf-6.1.22_2.0.0"
readonly G_IMXBOOT_REV="5cfd218012e080fb907d9cc301fbb4ece9bc17a9"
readonly G_IMXBOOT_PATCHES="${G_VARISCITE_PATH}/${MACHINE}/imx-boot-tools/imx-boot/imx-mkimage-imx8m-soc.mak-add-dart-imx8mp-support.patch"

# U-Boot
readonly G_UBOOT_SRC_DIR="${DEF_SRC_DIR}/uboot"
readonly G_UBOOT_GIT="https://github.com/varigit/uboot-imx.git"
readonly G_UBOOT_BRANCH="lf_v2023.04_var01"
readonly G_UBOOT_REV="341b473039306055c34e154af070e941d7cafb14"
G_UBOOT_DEF_CONFIG_MMC="imx8mp_var_dart_defconfig"
readonly G_UBOOT_NAME_FOR_EMMC='imx-boot-sd.bin'
readonly UBOOT_FW_UTILS_DIR="${G_META_VARISCITE_BSP_IMX_SRC_DIR}/recipes-bsp/u-boot/u-boot-fw-utils/${MACHINE}"

# BlueZ
readonly BLUEZ5_DIR="${G_META_VARISCITE_BSP_COMMON_SRC_DIR}/recipes-connectivity/bluez5/files"

# BRCM Utils
readonly BRCM_UTILS_DIR="${G_META_VARISCITE_BSP_IMX_SRC_DIR}/recipes-connectivity/bcm43xx-utils/bcm43xx-utils/imx8mp-var-dart"

# Wireless Utils
readonly VAR_WIRELESS_UTILS_DIR="${G_META_VARISCITE_BSP_COMMON_SRC_DIR}/recipes-connectivity/var-wireless-utils/var-wireless-utils"

# Linux kernel
readonly KERNEL_IMAGE_TYPE="Image.gz"
readonly KERNEL_BOOT_IMAGE_SRC="arch/arm64/boot/"
readonly KERNEL_DTB_IMAGE_PATH="arch/arm64/boot/dts/freescale/"
readonly G_LINUX_KERNEL_SRC_DIR="${DEF_SRC_DIR}/kernel"
readonly G_LINUX_KERNEL_GIT="https://github.com/varigit/linux-imx.git"
readonly G_LINUX_KERNEL_BRANCH="lf-6.1.y_var02"
readonly G_LINUX_KERNEL_REV="931be342d64b9908a9f60ec6afe7012981855341"
readonly G_LINUX_KERNEL_DEF_CONFIG='imx8_var_defconfig'
G_LINUX_DTB="freescale/imx8mp-var-dart-dt8mcustomboard.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-basler-isp0.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-basler-isi0.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy-basler-isp0.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy-basler-isi0.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-basler-isp0-m7.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-basler-isi0-m7.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy-basler-isp0-m7.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy-basler-isi0-m7.dtb
       freescale/imx8mp-var-som-symphony.dtb
       freescale/imx8mp-var-som-symphony-2nd-ov5640.dtb
       freescale/imx8mp-var-som-symphony-basler-isp0.dtb
       freescale/imx8mp-var-som-symphony-basler-isi0.dtb
       freescale/imx8mp-var-som-symphony-2nd-ov5640-m7.dtb
       freescale/imx8mp-var-som-symphony-m7.dtb
       freescale/imx8mp-var-som-symphony-basler-isp0-m7.dtb
       freescale/imx8mp-var-som-symphony-basler-isi0-m7.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-legacy-m7.dtb
       freescale/imx8mp-var-dart-dt8mcustomboard-m7.dtb
       "
# Broadcom BT/WIFI firmware
readonly G_BRCM_FW_SRC_DIR="${DEF_SRC_DIR}/brcmfw"
readonly G_BRCM_FW_REV="11.39.0.18"
readonly MODEL_LIST="${MACHINE}"
readonly G_BRCM_LWB_FW_ARCHIVE="laird-lwb-fcc-firmware-${G_BRCM_FW_REV}.tar.bz2"
readonly G_BRCM_LWB_FW_LINK="https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${G_BRCM_FW_REV}/${G_BRCM_LWB_FW_ARCHIVE}"
readonly G_BRCM_LWB_FW_SHA256SUM="f076de39385368849184036a4828051ea0ed4129c1ec115a45b05cd66605c337"
readonly G_BRCM_LWB5_FW_ARCHIVE="laird-lwb5-fcc-firmware-${G_BRCM_FW_REV}.tar.bz2"
readonly G_BRCM_LWB5_FW_LINK="https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${G_BRCM_FW_REV}/${G_BRCM_LWB5_FW_ARCHIVE}"
readonly G_BRCM_LWB5_FW_SHA256SUM="a9731660ea05bc7625e37314d7f3fd3f70b266aa21a07536baea82213cdfeec2"

# i.MX Graphics
readonly G_GPU_IMX_VIV_PACKAGE_DIR="imx-gpu-viv-6.4.11.p1.2"

# i.MX Graphics G2D libraries for i.MX 8
readonly G_G2D_PACKAGE_DIR="imx-gpu-g2d-6.4.11.p1.2"
G2DPACKAGE="imx-gpu-g2d"

# i.MX Firmware including firmware for VPU, DDR, EPDC, HDMI, DP (Display Port), and SDMA
readonly G_IMX_FIRMWARE_VERSION="8.20"
readonly G_XCVR_FIRMWARE_PACKAGE="imx-firmware-xcvr"

# Cairo 2D graphics library with support for multiple output devices
readonly G_CAIRO_DIR="cairo"

# Libdrm Direct Rendering Manager
readonly G_LIBDRM_DIR="libdrm-2.4.114"

# Vivante GPU libgbm1 libraries
readonly G_GPU_IMX_VIV_GBM_DIR="libgbm1_22.3.6-1+deb12u1"

# Wayland Protocols
readonly G_WAYLAND_PROTOCOL_DIR="wayland-protocols-1.31"

readonly ALSA_CONF_FILES_DIR="alsa-libs"

# Weston
readonly G_WESTON_PACKAGE_DIR="weston/imx8mp-vivante-g2d/weston-11"

readonly IMX_GPU_VIV_DEFAULT_WL_PACKAGE="imx-gpu-viv-core"

# i.MX optimized Audio and Video core codec libraries
readonly G_IMX_CODEC_DIR="imxcodec-4.8.0"

# i.MX optimized core parser
readonly G_IMX_PARSER_DIR="imxparser-4.8.0"

# i.MX VPU Hantro libraries for i.MX 8M Quad, 8M Mini, and 8M Plus
readonly G_IMX_VPU_HANTRO_DIR="imxvpuhantro-1.29.0"

# i.MX VPU Hantro vc8000e Encoder libraries for i.MX 8M Plus
readonly G_IMX_VPU_HANTRO_VC_DIR="imxvpuhantro-vc-1.9.0"

# i.MX VPU Wrapper
readonly G_IMX_VPU_WRAPPER_DIR="imxvpuwrap-4.8.0"

readonly G_IMX_NN_DIR="imx-nn-1.2.0"

IMXGSTPLG="imx-gst1.0-plugin-mx8mp"

# Flashing variables
BOOTLOADER_OFFSET=32

BOOT_DTB="imx8mp-var-dart-dt8mcustomboard.dtb"
DEFAULT_BOOT_DTB="imx8mp-var-dart-dt8mcustomboard.dtb"

HDMI=no
TEE_LOAD_ADDR=0x56000000
ATF_LOAD_ADDR=0x00970000
UBOOT_DTB="imx8mp-var-dart-dt8mcustomboard.dtb"
UBOOT_DTB_EXTRA="imx8mp-var-dart-dt8mcustomboard-legacy.dtb"
UBOOT_DTB_EXTRA2="imx8mp-var-som-symphony.dtb"
IMXBOOT_TARGETS="flash_evk"
IMX_BOOT_TOOL_BL_BIN="bl31-imx8mp.bin"

# default mirror
readonly DEF_DEBIAN_MIRROR="https://ftp.debian.org/debian"

#freertos-variscite
readonly G_FREERTOS_VAR_SRC_DIR="${DEF_SRC_DIR}/freertos-variscite"
readonly G_FREERTOS_VAR_GIT="https://github.com/varigit/freertos-variscite.git"
readonly G_FREERTOS_VAR_BRANCH="mcuxpresso_sdk_2.13.x-var01"
readonly G_FREERTOS_VAR_REV="66cb1c980506524e85364ddadbdaace381c621a6"
readonly CM_BOARD="dart_mx8mp som_mx8mp"
readonly CM_DEMOS=" \
	multicore_examples/rpmsg_lite_str_echo_rtos \
	multicore_examples/rpmsg_lite_pingpong_rtos/linux_remote \
	demo_apps/hello_world \
	multicore_examples/rpmsg_lite_str_echo_rtos \
	multicore_examples/rpmsg_lite_pingpong_rtos/linux_remote \
	demo_apps/hello_world \
"
readonly G_CM_GCC_NAME="gcc-arm-none-eabi-10.3-2021.07"
#
# To avoid scfw compilation errors the Cortex-M gcc toolchain is unpacked in specific folder (G_CM_GCC_OUT_DIR)
# The below line in the scfw Makefile cause the problem selecting a not proper gcc toolchain version
# CROSS_COMPILE = $(TOOLS)/gcc-arm-none-eabi-*/bin/arm-none-eabi-
# https://github.com/varigit/imx-sc-firmware/blob/495e846a5e1ff5d4208c2fb6529397d80c40ebf7/src/scfw_export_mx8qx_b0/Makefile#L343
readonly G_CM_GCC_OUT_DIR="cm-${G_CM_GCC_NAME}"

readonly G_CM_GCC_ARCHIVE="${G_CM_GCC_NAME}-x86_64-linux.tar.bz2"
readonly G_CM_GCC_LINK="https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.07/${G_CM_GCC_ARCHIVE}"
readonly G_CM_GCC_SHA256SUM="8c5b8de344e23cd035ca2b53bbf2075c58131ad61223cae48510641d3e556cea"

#rootfs package group control
#Default compilation of rootfs (Console Base + Multimedia + Graphics)
#set package group below from G_DEBIAN_DISTRO_FEATURE_XX="n" to disable it

#Multimedia - GStreamer Packages - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_MM="y"

#Graphics - Full Graphics and GPU SDK - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_GRAPHICS="y"

#Machine Learning - Machine learning libraries - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_ML="y"
