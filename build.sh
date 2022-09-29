#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER=neel0210
export KBUILD_BUILD_HOST=Catelina

# Variables
export Image="$(pwd)/out/arch/arm64/boot/Image"
export TC="/home/neel/Desktop/toolchain/linaro/bin"
export VMTC="$(pwd)/gcc/linaro"

#
#export CROSS_COMPILE=
export ANDROID_MAJOR_VERSION=q
export ANDROID_PLATFORM_VERSION=10

# Devices
A3=exynos7870-a3y17lte_defconfig
J6=exynos7870-j6lte_defconfig
A6=exynos7870-a6lte_defconfig
J701=exynos7870-j7velte_defconfig
J710=exynos7870-j7xelte_defconfig
J730=exynos7870-j7y17lte_defconfig
J530=exynos7870-j5y17lte_defconfig
G610=exynos7870-on7xelte_defconfig

# 
START(){
	# Calculate compilation time
	START=$(date +"%s")
}
#
END(){
	END=$(date +"%s")
	DIFF=$((END - START))
	echo -e "Kernel has been compiled successfully and it took $((DIFF / 60)) minute(s) and $((DIFF % 60)) second(s)"
	echo "Done!"
}

CLEANK(){
	rm -rf KKRT/AIK/image-new.img
	rm -rf KKRT/AIK/split_img/boot.img-kernel
}

CLEANBUILDS(){
	rm -rf KKRT/ZIP/KKRT/D/a3y17lte/A3.img
	rm -rf KKRT/ZIP/KKRT/D/a6lte/A6.img
	rm -rf KKRT/ZIP/KKRT/D/j6lte/J6.img
	rm -rf KKRT/ZIP/KKRT/D/j7velte/J701.img
	rm -rf KKRT/ZIP/KKRT/D/j7xelte/J710.img
	rm -rf KKRT/ZIP/KKRT/D/j5y17lte/J530.img
	rm -rf KKRT/ZIP/KKRT/D/j7y17lte/J730.img
	rm -rf KKRT/ZIP/KKRT/D/on7xelte/G610.img
	rm -rf KKRT/*.zip
}

CLEANUPLOAD(){
	rm -rf KKRT/*.zip
}

CLEAN(){
	make clean && make mrproper
	rm -rf out/arch/arm64/boot/Image
	rm -rf KKRT/*.zip
	rm -rf KKRT/Image
	rm -rf out
}

PACKALL(){
	CLEANBUILDS
	#
	CLEANK
	echo "Packing A3 Kernel, wait... "
	cp -r ./A3/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/a3y17lte/A3.img
	rm -rf KKRT/*.zip
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-A3.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/a3y17lte/A3.img
	#
	CLEANK
	echo "Packing A6 Kernel, wait... "
	cp -r ./A6/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/a6lte/A6.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-A6.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/a6lte/A6.img
	#
	CLEANK
	echo "Packing J6 Kernel, wait... "
	cp -r ./J6/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/j6lte/J6.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-J6.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD	
	rm -rf KKRT/ZIP/KKRT/D/j6lte/J6.img
	#
	CLEANK
	echo "Packing J701 Kernel, wait... "
	cp -r ./J701/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/j7velte/J701.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-J701.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD	
	rm -rf KKRT/ZIP/KKRT/D/j7velte/J701.img
	#
	CLEANK
	echo "Packing J710 Kernel, wait... "
	cp -r ./J710/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/j7xelte/J710.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-J710.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/j7xelte/J710.img
	#
	CLEANK
	echo "Packing J530 Kernel, wait... "
	cp -r ./J530/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/j5y17lte/J530.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-J530.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/j5y17lte/J530.img
	#
	CLEANK
	echo "Packing J730 Kernel, wait... "
	cp -r ./J730/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/j7y17lte/J730.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-J730.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/j7y17lte/J730.img
	#
	CLEANK
	echo "Packing G610 Kernel, wait... "
	cp -r ./G610/arch/arm64/boot/Image ./KKRT/AIK/split_img/boot.img-kernel	
	bash KKRT/AIK/repackimg.sh
	cp -r ./KKRT/AIK/image-new.img ./KKRT/ZIP/KKRT/D/on7xelte/G610.img
	cd KKRT/ZIP
	./zip.sh
	mv KKRT-SSJ1_Exy7870-.zip KKRT-SSJ1_Exy7870-G610.zip
	cd ../..
	cp -r ./KKRT/ZIP/*.zip ./KKRT/
	UPLOAD
	CLEANUPLOAD
	rm -rf KKRT/ZIP/KKRT/D/on7xelte/G610.img
}

MAKE(){
	echo "============"
	echo "Compiling A3"
	echo "============"
	make $A3 O=A3
	make -j$(nproc --all) O=A3

	echo "============"
	echo "Compiling J6"
	echo "============"
	make $J6 O=J6
	make -j$(nproc --all) O=J6

	echo "============"
	echo "Compiling A6"
	echo "============"
	make $A6 O=A6
	make -j$(nproc --all) O=A6

	echo "==============="
	echo "Compiling J7nxt"
	echo "==============="
	make $J701 O=J701
	make -j$(nproc --all) O=J701

	echo "================"
	echo "Compiling J7 16"
	echo "================"
	make $J710 O=J710
	make -j$(nproc --all) O=J710

	echo "=============="
	echo "Compiling J5 17"
	echo "=============="
	make $J530 O=J530
	make -j$(nproc --all) O=J530

	echo "=============="
	echo "Compiling J7 17"
	echo "=============="
	make $J730 O=J730
	make -j$(nproc --all) O=J730

	echo "=============="
	echo "Compiling J7 P"
	echo "=============="
	make $G610 O=G610
	make -j$(nproc --all) O=G610
}

FLASHING(){
	echo "X......Checking if Kernel ZIP is present or not"
	sleep 2
	cd KKRT
	ZIP=$(find *.zip)
	if [ -f $ZIP ];
	then
		echo "X.....$ZIP is able to be flashed"
	fi
	cd ..
	echo "X......Flashing Kernel"
	echo "X......Rebooting to recovery"
	echo "X......Make sure USB debugging is enabled"
	echo "X......If enabled, press ANYKEY now to reboot to recovery"
	read -n1 -r key
	adb reboot recovery
	echo "X......As soon as you boot into recovery, run ADB sideload and then press ANY KEY"
	read -n1 -r key
	cd KKRT
	adb sideload $ZIP >/dev/null 2>&1
	cd ..
	echo "X......Flashing Done!"
}

# export TC
if [ -d "$TC" ]; then
	echo "building offline; thus exporting paths"
	export CROSS_COMPILE=/home/neel/Desktop/toolchain/19/bin/aarch64-linux-android-
	export CCACHE_EXEC="/usr/bin/ccache"
	export USE_CCACHE=1
	ccache -M 50G
	export CCACHE_COMPRESS=1
	export CCACHE_DIR="/home/neel/Desktop/ccache/.ccache"
else
	echo "Not finding Toolchains at Home/toolchains; thus clonning them; would take some couple of minutes"
	if [ -d "$VMTC" ]; then
		echo exporting paths
		export CROSS_COMPILE=$(pwd)/gcc/bin/aarch64-linux-gnu-
	else
		git clone --depth=1 https://github.com/KakarotKernel/clang.git -b linaro gcc
		export CROSS_COMPILE=$(pwd)/gcc/bin/aarch64-linux-gnu-
	fi
fi

UPLOAD(){
	for i in KKRT/*.zip
	do
	curl -F "document=@$i" --form-string "caption=" "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument?chat_id=${CHAT_ID}&parse_mode=HTML"
	done
}

#
clear
echo "                                                     "
echo " _   __ _   ________ _____                 _       _     "
echo "| | / /| | / /| ___ \_   _|  ___  ___ _ __(_)_ __ | |_ "
echo "| |/ / | |/ / | |_/ / | |   / __|/ __| '__| | '_ \| __|"
echo "|    \ |    \ |    /  | |   \__ \ (__| |  | | |_) | |_  "
echo "| |\  \| |\  \| |\ \  | |   |___/\___|_|  |_| .__/ \__|"
echo "\_| \_/\_| \_/\_| \_| \_/                   |_|         "
echo "            coded by Neel0210  "
echo "Select"
echo "1 = Clean"
echo "2 = Clean Build"
echo "3 = Dirty Build"
echo "4 = Update dependencies"
echo "5 = Flash kernel using adb"
echo "6 = exit"
read n

if [ $n -eq 1 ]; then
	CLEAN
fi

if [ $n -eq 2 ]; then
	echo " " && echo " "
	echo "Select build type"
	echo "1 = Clean build all"
	echo "2 = Test Build"
	echo "3 = Production build"
	read n
	#
	if [ $n -eq 1 ]; then
		CLEAN
		START
		MAKE
		END
	fi
	#
	if [ $n -eq 2 ]; then
		CLEAN
		START
		make $J701 O=J701
		make -j$(nproc --all) O=J701
	fi
	#
	if [ $n -eq 3 ]; then
		CLEAN
		START
		MAKE
		PACKALL
		END
	fi	
	#	
fi

if [ $n -eq 3 ]; then
	START
	MAKE
	PACKALL
	END
fi

if [ $n -eq 4 ]; then
	sudo bash scripts/bin
fi

if [ $n -eq 5 ]; then
	FLASHING
fi