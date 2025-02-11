#$1 - src/kernel/
#$2 - output/kernel-headers/
#$3 - variscite/
function create_debian_kernel_headers_package()
{
	KERNEL_SRC_DIR=$1
	OUTPUT_DIR=$2
	ORIG_DIR=$3
	LOCAL_KERNEL_VERSION=`cat ${KERNEL_SRC_DIR}/include/config/kernel.release`
	echo "LOCAL Kernel Version is ${LOCAL_KERNEL_VERSION}"
	rm -rf ${OUTPUT_DIR}
	mkdir -p ${OUTPUT_DIR}/debian
	rm -rf ${OUTPUT_DIR}/kernel
	tar -xjf ${3}/linux-headers_debian_src/kernel-headers-template.tar.bz2 \
		-C ${OUTPUT_DIR}/
	tar -xjf ${3}/linux-headers_debian_src/kernel-arm64-template.tar.bz2 \
		-C ${OUTPUT_DIR}/
	ln -sf ${KERNEL_SRC_DIR} ${OUTPUT_DIR}/kernel-src
	cd ${OUTPUT_DIR}

	LINUX_DEB_COMMON_FILE=debian/linux-kbuild-${LOCAL_KERNEL_VERSION}.install
	LINUX_COMMON_KBUILD_FILE_PATH_NAME=${OUTPUT_DIR}/${LINUX_DEB_COMMON_FILE}
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-kbuild-5.4.3.install \
		${LINUX_COMMON_KBUILD_FILE_PATH_NAME}
	#Prepare the kbuild package
	cat ${ORIG_DIR}/linux-headers_debian_src/kbuild_file_list.txt \
		| while read line || [[ -n $line ]];
		do
			dst=`echo $line | sed 's/kernel-src/kernel/g'`
			echo  "cp $line $dst"
			cp $line $dst
		done
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${LINUX_COMMON_KBUILD_FILE_PATH_NAME}
	sed -i -e "s/kernel-src/\/usr\/lib\/linux-kbuild-${LOCAL_KERNEL_VERSION}/g" \
		${LINUX_COMMON_KBUILD_FILE_PATH_NAME}
	#Prepare linux-headers-5.x file liest
	LINUX_HEADERS_COMMON_DIRS=`find kernel-src/arch/  -type d`
	LINUX_HEADERS_COMMON_INCLUDE_DIRS=`find kernel-src/include  -type d`
	LINUX_HEADERS_FILES=`find kernel-src/arch/ kernel-src/include/ -iname \
		"*.h"  | sed -e "/generated/d" -e "/config/d"`
	LINUX_ASSEMBLY_FILES=`find kernel-src/arch/ kernel-src/include/ \
		-iname "*.S"  | sed -e "/generated/d" -e "/config/d"`
	LINUX_LDS_FILES=`find kernel-src/arch/ kernel-src/include/ \
		-iname "*module*.lds"  | sed -e "/generated/d" -e "/config/d"`
	LINUX_KBUILD_FILES=`find kernel-src/arch/ kernel-src/include/ \
		-iname "*Kbuild*"  | sed -e "/generated/d" -e "/config/d"`
	LINUX_Makefile_FILES=`find kernel-src/arch/ kernel-src/include/ \
		-iname "*Makefile*"  | sed -e "/generated/d" -e "/config/d"`

	LINUX_DEB_COMMON_FILE=debian/linux-headers-${LOCAL_KERNEL_VERSION}-common.install
	LINUX_COMMON_INSTALL_FILE_PATH_NAME=${OUTPUT_DIR}/${LINUX_DEB_COMMON_FILE}
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-headers-5.4.3-common.install \
		${LINUX_COMMON_INSTALL_FILE_PATH_NAME}

	for i in ${LINUX_HEADERS_COMMON_DIRS}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		mkdir -p $dst
	done

	for i in ${LINUX_HEADERS_COMMON_INCLUDE_DIRS}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		mkdir -p $dst
	done

	LINUX_HEADERS_SED_STRING="s/kernel-src/\/usr\/src\/linux-headers-${LOCAL_KERNEL_VERSION}-common/g"
	for i in ${LINUX_HEADERS_FILES}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		cp $i $dst
	done

	for i in ${LINUX_ASSEMBLY_FILES}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		cp $i $dst
	done

	for i in ${LINUX_LDS_FILES}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		cp $i $dst
	done

	for i in ${LINUX_KBUILD_FILES}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		cp $i $dst
	done

	for i in ${LINUX_Makefile_FILES}
	do
		dst=`echo $i | sed -e 's/kernel-src/kernel/g'`
		cp $i $dst
	done
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${LINUX_COMMON_INSTALL_FILE_PATH_NAME}
	sed -i -e ${LINUX_HEADERS_SED_STRING} \
		${LINUX_COMMON_INSTALL_FILE_PATH_NAME}

	#prepare linux-headers-5.x-arm64
	cp ${KERNEL_SRC_DIR}/.config kernel/.config
	cp ${KERNEL_SRC_DIR}/Makefile kernel/Makefile
	cp ${KERNEL_SRC_DIR}/Module.symvers kernel/Module.symvers
	LINUX_ARCH64_HEADERS_FILES=`find kernel-src/arch/arm64/include \
		kernel-src/include/config/ kernel-src/include/generated/ -iname "*.h"`

	LINUX_DEB_COMMON_ARCH64_FILE=debian/linux-headers-${LOCAL_KERNEL_VERSION}-arm64.install
	LINUX_COMMON_ARM64_INSTALL_FILE_PATH_NAME=${OUTPUT_DIR}/${LINUX_DEB_COMMON_ARCH64_FILE}
	LINUX_HEADERS_ARM64_SED_STRING="s/kernel-src/\/usr\/src\/linux-headers-${LOCAL_KERNEL_VERSION}-arm64/g"
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-headers-5.4.3-arm64.install \
		${LINUX_COMMON_ARM64_INSTALL_FILE_PATH_NAME}

	for i in ${LINUX_ARCH64_HEADERS_FILES}
	do
		dst=`echo $i | sed 's/kernel-src/kernel/g'`
		cp $i $dst
	done
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${LINUX_DEB_COMMON_ARCH64_FILE}
	sed -i -e ${LINUX_HEADERS_ARM64_SED_STRING} \
		${LINUX_COMMON_ARM64_INSTALL_FILE_PATH_NAME}


	touch kernel/linux-headers-arm64
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/control \
		${OUTPUT_DIR}/debian/control
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/rules \
		${OUTPUT_DIR}/debian/rules
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/changelog \
		${OUTPUT_DIR}/debian/changelog

	LINUX_HEADERS_ARM64_POSTINSTALL=linux-headers-${LOCAL_KERNEL_VERSION}-arm64.postinst
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-headers-5.4.3-arm64.postinst \
		${OUTPUT_DIR}/debian/${LINUX_HEADERS_ARM64_POSTINSTALL}
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${OUTPUT_DIR}/debian/${LINUX_HEADERS_ARM64_POSTINSTALL}
	LINUX_HEADERS_COMMON_POSTINSTALL=linux-headers-${LOCAL_KERNEL_VERSION}-common.postinst
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-headers-5.4.3-common.postinst \
		${OUTPUT_DIR}/debian/${LINUX_HEADERS_COMMON_POSTINSTALL}
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${OUTPUT_DIR}/debian/${LINUX_HEADERS_COMMON_POSTINSTALL}
	LINUX_KBUILD_POSTINSTALL=linux-kbuild-${LOCAL_KERNEL_VERSION}.postinst
	cp ${ORIG_DIR}/linux-headers_debian_src/debian/linux-kbuild-5.4.3.postinst \
		${OUTPUT_DIR}/debian/${LINUX_KBUILD_POSTINSTALL}
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${OUTPUT_DIR}/debian/${LINUX_KBUILD_POSTINSTALL}

	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${OUTPUT_DIR}/debian/control
	sed -i -e "s/5.4.3/${LOCAL_KERNEL_VERSION}/g" \
		${OUTPUT_DIR}/debian/changelog

	tar -xjf ${3}/linux-headers_debian_src/kernel-arm64-template.tar.bz2 \
		-C ${OUTPUT_DIR}/

	echo "11" > ${OUTPUT_DIR}/debian/compat
	cd ${ORIG_DIR}
	rm -f ${OUTPUT_DIR}/kernel-src
}
