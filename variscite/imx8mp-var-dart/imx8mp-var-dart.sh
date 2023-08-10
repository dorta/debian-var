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
	"G_META_VARISCITE_BSP"
)

# meta-variscite-bsp-imx
readonly G_META_VARISCITE_BSP_SRC_DIR="${DEF_SRC_DIR}/meta-variscite-bsp-imx"
readonly G_META_VARISCITE_BSP_GIT="https://github.com/varigit/meta-variscite-bsp-imx"
readonly G_META_VARISCITE_BSP_BRANCH="mickledore-var01"
readonly G_META_VARISCITE_BSP_REV="40ba61a78f91deae1011dfd63fbdb1786a15b1c2"

# U-Boot
readonly G_UBOOT_SRC_DIR="${DEF_SRC_DIR}/uboot"
readonly G_UBOOT_GIT="https://github.com/varigit/uboot-imx.git"
readonly G_UBOOT_BRANCH="lf_v2023.04_var01"
readonly G_UBOOT_REV="341b473039306055c34e154af070e941d7cafb14"
G_UBOOT_DEF_CONFIG_MMC="imx8mp_var_dart_defconfig"
readonly G_UBOOT_NAME_FOR_EMMC='imx-boot-sd.bin'

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

# BRCM Utils
readonly BRCM_UTILS_DIR="${G_META_VARISCITE_BSP_SRC_DIR}/recipes-connectivity/bcm43xx-utils/bcm43xx-utils"

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

readonly G_GPU_IMX_VIV_PACKAGE_DIR="imx-gpu-viv-6.4.3.p1.4"
readonly G_GPU_IMX_VIV_SDK_PACKAGE_DIR="imx-gpu-sdk-6.4.0.p2.0"
readonly GST_MM_VERSION="MM_04.06.02_2108_L5.10.y"
readonly G_GST_PLUGINS_BAD_DIR="MM_04.06.02_2108_L5.10.y"
readonly G2D_PACKAGE_DIR="imx-gpu-g2d-6.4.3.p2.2"
readonly IMX_FIRMWARE_VERSION="8.13"
readonly XCVR_FIRMWARE_PACKAGE="imx-firmware-xcvr"
readonly ALSA_CONF_FILES_DIR="alsa-libs"
readonly WESTON_PACKAGE_DIR="imx8m-vivante-g2d/weston-9"
readonly IMX_GPU_VIV_DEFAULT_WL_PACKAGE="imx-gpu-viv-core"

readonly G_IMX_CODEC_DIR="imxcodec-4.8.0"
readonly G_IMX_PARSER_DIR="imxparser-4.8.0"
readonly G_IMX_VPU_HANTRO_DIR="imxvpuhantro-1.23.0"
readonly G_IMX_VPU_HANTRO_VC_DIR="imxvpuhantro-vc-1.3.0"
readonly G_IMX_VPU_WRAPPER_DIR="imxvpuwrap-4.6.2"
readonly G_IMX_NN_DIR="imx-nn-1.2.0"

IMXGSTPLG="imx-gst1.0-plugin-mx8mp"
G2DPACKAGE="imx-gpu-g2d"

# Flashing variables
BOOTLOADER_OFFSET=32

BOOT_DTB="imx8mp-var-dart-dt8mcustomboard.dtb"
DEFAULT_BOOT_DTB="imx8mp-var-dart-dt8mcustomboard.dtb"

readonly G_IMXBOOT_SRC_DIR="${DEF_SRC_DIR}/imx-mkimage"
readonly G_IMXBOOT_GIT="https://github.com/nxp-imx/imx-mkimage.git"
readonly G_IMXBOOT_BRANCH="lf-5.10.52_2.1.0"
readonly G_IMXBOOT_REV="1112c88470f339dc631e2a7117087f416af6d6b5"
readonly G_IMXBOOT_PATCHES="${G_VARISCITE_PATH}/${MACHINE}/imx-boot-tools/imx-boot/imx-mkimage-imx8m-soc.mak-add-dart-imx8mp-support.patch"

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
readonly G_FREERTOS_VAR_BRANCH="mcuxpresso_sdk_2.11.x-var01"
readonly G_FREERTOS_VAR_REV="400b111535768f7aad0b25d29b09b8a9b352cd5f"
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

# BlueZ
readonly BLUEZ5_DIR="${G_META_VARISCITE_BSP_SRC_DIR}/recipes-connectivity/bluez5/files"

#rootfs package group control
#Default compilation of rootfs (Console Base + Multimedia + Graphics)
#set package group below from G_DEBIAN_DISTRO_FEATURE_XX="n" to disable it

#Multimedia - GStreamer Packages - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_MM="y"

#Graphics - Full Graphics and GPU SDK - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_GRAPHICS="y"

#Machine Learning - Machine learning libraries - Set it to "n" if you want to disable it
readonly G_DEBIAN_DISTRO_FEATURE_ML="y"
