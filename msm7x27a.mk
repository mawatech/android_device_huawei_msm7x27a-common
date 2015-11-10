#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The GPS configuration appropriate for this device.
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/msm7x27a-common/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Packages
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    libaudioutils

PRODUCT_PACKAGES += \
    libgenlock \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    libqdMetaData \
    memtrack.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw

PRODUCT_PACKAGES += \
    gps.msm7x27a

PRODUCT_PACKAGES += \
    camera.msm7x27a

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    hwmac \
    make_ext4fs \
    setup_fs

# FM Radio
#PRODUCT_PACKAGES += \
#    FM2 \
#    FMRecord \
#    libqcomfm_jni \
#    qcom.fmradio

#wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Files
PRODUCT_COPY_FILES += \
    device/huawei/msm7x27a-common/rootdir/init.huawei.rc:root/init.huawei.rc \
    device/huawei/msm7x27a-common/rootdir/init.huawei.usb.rc:root/init.huawei.usb.rc \
    device/huawei/msm7x27a-common/rootdir/ueventd.huawei.rc:root/ueventd.huawei.rc

PRODUCT_COPY_FILES += \
    device/huawei/msm7x27a-common/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/msm7x27a-common/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/huawei/msm7x27a-common/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/msm7x27a-common/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    device/huawei/msm7x27a-common/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/huawei/msm7x27a-common/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/huawei/msm7x27a-common/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/huawei/msm7x27a-common/configs/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \


PRODUCT_COPY_FILES += \
    device/huawei/msm7x27a-common/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/huawei/msm7x27a-common/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/huawei/msm7x27a-common/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    device/huawei/msm7x27a-common/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/huawei/msm7x27a-common/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    headset.hook.delay=500

PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.remote.autoconnect=true \
    ro.bluetooth.request.master=true \
    ro.bt.bdaddr_path=/data/misc/bluedroid/bdaddr \
    ro.qualcomm.bluetooth.dun=true \
    ro.qualcomm.bluetooth.ftp=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    debug.hwc.dynThreshold=1.9 \
    persist.hwc.mdpcomp.enable=false \
    debug.mdpcomp.logs=0 \
    debug.gralloc.map_fb_memory=1 \
    debug.hwc.fakevsync=1 \
    ro.max.fling_velocity=4000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=240

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=52m \
    dalvik.vm.heapsize=128m

PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM \
    rild.libargs=-d/dev/smd0 \
    ro.telephony.call_ring.delay=100 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.vold.umsdirtyratio=50

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=60

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.gapless.playback.disable=true \
    audio.offload.disable=1

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    config.disable_atlas=true \
    dalvik.vm.jit.codecachesize=0 \
    persist.sys.force_highendgfx=true \
    ro.config.max_starting_bg=6 \
    ro.sys.fw.bg_apps_limit=8
    
# FM Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fm.analogpath.supported=false \
    ro.fm.transmitter=false \
    ro.fm.mulinst.recording.support=false

# Stagefright
PRODUCT_PROPERTY_OVERRIDES += \
   media.stagefright.enable-player=true \
   media.stagefright.enable-meta=false \
   media.stagefright.enable-scan=true \
   media.stagefright.enable-http=true \
   media.stagefright.enable-fma2dp=true \
   media.stagefright.enable-aac=true \
   media.stagefright.enable-qcp=true

PRODUCT_PROPERTY_OVERRIDES += \
   mm.enable.smoothstreaming=true

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
   camera2.portability.force_api=1

# Use ART small mode
PRODUCT_PROPERTY_OVERRIDES += \
   dalvik.vm.dex2oat-filter=balanced \
   dalvik.vm.dex2oat-flags=--no-watch-dog \
   dalvik.vm.image-dex2oat-filter=speed

# ART properties
ADDITIONAL_DEFAULT_PROPERTIES += \
   dalvik.vm.dex2oat-Xms=8m \
   dalvik.vm.dex2oat-Xmx=96m \
   dalvik.vm.image-dex2oat-Xms=48m \
   dalvik.vm.image-dex2oat-Xmx=48m

$(call inherit-product, vendor/huawei/msm7x27a-common/msm7x27a-common-vendor.mk)
