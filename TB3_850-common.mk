#
# Copyright (C) 2014 The CyanogenMod Project
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

$(LOCAL_PATH) := device/samsung/TB3_850-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/Lenovo/TB3_850-common/TB3_850-common-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/Lenovo/TB3_850-common/overlay

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.r_submix.default \
	audio.usb.default \
	libtinyxml \
	libtinycompress

# Camera
PRODUCT_PACKAGES += \
    Snap 

# Gello
PRODUCT_PACKAGES += \
    Gello

# Media
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Media Profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
	$(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \

# MTK stuff
PRODUCT_PACKAGES += \
	libmrdump \
	mrdump_tool \
	guiext-server

# dex2oat
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.boot-dex2oat-threads=4 \
	dalvik.vm.dex2oat-threads=2 \
	dalvik.vm.image-dex2oat-threads=4

# Mediatek's Symbols
PRODUCT_PACKAGES += \
	libxlog \
	libmtk_symbols

# FM Radio
PRODUCT_PACKAGES += \
	FMRadio \
	libfmjni \
	libfmcust \
	libmtkplayer

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/rootdir/system/etc/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

