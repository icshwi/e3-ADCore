#
#  Copyright (c) 2019            Jeong Han Lee
#  Copyright (c) 2017 - 2019     European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : william, Jeong Han Lee
# email   : william@esss.se
#         : jeonghan.lee@gmail.com
# Date    : Friday, September 13 10:28:08 CEST 2019
# version : 0.0.8
#

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS

#EXCLUDE_ARCHS += linux-ppc64e6500
#EXCLUDE_ARCHS += linux-corei7-poky

ifneq ($(strip $(ASYN_DEP_VERSION)),)
asyn_VERSION=$(ASYN_DEP_VERSION)
endif

ifneq ($(strip $(ADSUPPORT_DEP_VERSION)),)
ADSupport_VERSION=$(ADSUPPORT_DEP_VERSION)
endif

# # We don't have 3.14 and 3.16
# ifeq ($(BASE_3_15),YES)

ifneq ($(strip $(PVDATA_DEP_VERSION)),)
pvData_VERSION=$(PVDATA_DEP_VERSION)
endif

ifneq ($(strip $(PVACCESS_DEP_VERSION)),)
pvAccess_VERSION=$(PVACCESS_DEP_VERSION)
endif

ifneq ($(strip $(PVDATABASE_DEP_VERSION)),)
pvDatabase_VERSION=$(PVDATABASE_DEP_VERSION)
endif

ifneq ($(strip $(NORMATIVETYPES_DEP_VERSION)),)
normativeTypes_VERSION=$(NORMATIVETYPES_DEP_VERSION)
endif

# endif # ifeq ($(BASE_3_15),YES)


# ifeq ($(BASE_7_0),YES)	
# ifeq ($(T_A),linux-x86_64)
# USR_LDFLAGS  += -L$(EPICS_BASE)/lib/$(T_A)
# LIB_SYS_LIBS += nt pvDatabase
# endif
# endif # ($(BASE_7_0),YES)	


# The following include paths should be
# matched with definitions in ADSupport.Makefile
## 
ifeq ($(T_A),linux-x86_64)
USR_INCLUDES += -I/usr/include/hdf5/serial
USR_INCLUDES += -I/usr/include/libxml2
# TIFF/BLOSC/JPEG/netcdf
USR_INCLUDES += -I/usr/include
else
USR_INCLUDES += -I$(SDKTARGETSYSROOT)/usr/include/hdf5/serial
USR_INCLUDES += -I$(SDKTARGETSYSROOT)/usr/include/libxml2
USR_INCLUDES += -I$(SDKTARGETSYSROOT)/usr/include
endif


ADCAPP = ADApp

ADCORESRC:=$(ADCAPP)/ADSrc
ADCOREDB:=$(ADCAPP)/Db
PLUGINSRC:=$(ADCAPP)/pluginSrc
NTNDARRAYCONVERTERSRC:=$(ADCAPP)/ntndArrayConverterSrc
IOCBOOT:=iocBoot


HEADERS += $(PLUGINSRC)/NDPluginDriver.h
SOURCES += $(PLUGINSRC)/NDPluginDriver.cpp
SOURCES += $(PLUGINSRC)/throttler.cpp

DBDS    += $(PLUGINSRC)/NDPluginAttribute.dbd
HEADERS += $(PLUGINSRC)/NDPluginAttribute.h
SOURCES += $(PLUGINSRC)/NDPluginAttribute.cpp


DBDS    += $(PLUGINSRC)/NDPluginCircularBuff.dbd
HEADERS += $(PLUGINSRC)/NDArrayRing.h
HEADERS += $(PLUGINSRC)/NDPluginCircularBuff.h
SOURCES += $(PLUGINSRC)/NDPluginCircularBuff.cpp
SOURCES += $(PLUGINSRC)/NDArrayRing.cpp

DBDS    += $(PLUGINSRC)/NDPluginColorConvert.dbd
HEADERS += $(PLUGINSRC)/NDPluginColorConvert.h
SOURCES += $(PLUGINSRC)/NDPluginColorConvert.cpp

DBDS    += $(PLUGINSRC)/NDPluginFFT.dbd
HEADERS += $(PLUGINSRC)/NDPluginFFT.h
SOURCES += $(PLUGINSRC)/NDPluginFFT.cpp
SOURCES += $(PLUGINSRC)/fft.c

DBDS    += $(PLUGINSRC)/NDPluginGather.dbd
HEADERS += $(PLUGINSRC)/NDPluginGather.h
SOURCES += $(PLUGINSRC)/NDPluginGather.cpp

DBDS    += $(PLUGINSRC)/NDPluginOverlay.dbd
HEADERS += $(PLUGINSRC)/NDPluginOverlay.h
HEADERS += $(PLUGINSRC)/NDPluginOverlayTextFont.h
SOURCES += $(PLUGINSRC)/NDPluginOverlay.cpp
SOURCES += $(PLUGINSRC)/NDPluginOverlayTextFont.cpp

DBDS    += $(PLUGINSRC)/NDPluginProcess.dbd
HEADERS += $(PLUGINSRC)/NDPluginProcess.h
SOURCES += $(PLUGINSRC)/NDPluginProcess.cpp

DBDS    += $(PLUGINSRC)/NDPluginROI.dbd
HEADERS += $(PLUGINSRC)/NDPluginROI.h
SOURCES += $(PLUGINSRC)/NDPluginROI.cpp

DBDS    += $(PLUGINSRC)/NDPluginROIStat.dbd
HEADERS += $(PLUGINSRC)/NDPluginROIStat.h
SOURCES += $(PLUGINSRC)/NDPluginROIStat.cpp

DBDS    += $(PLUGINSRC)/NDPluginScatter.dbd
HEADERS += $(PLUGINSRC)/NDPluginScatter.h
SOURCES += $(PLUGINSRC)/NDPluginScatter.cpp

DBDS    += $(PLUGINSRC)/NDPluginStats.dbd
HEADERS += $(PLUGINSRC)/NDPluginStats.h
SOURCES += $(PLUGINSRC)/NDPluginStats.cpp

DBDS    += $(PLUGINSRC)/NDPluginStdArrays.dbd
HEADERS += $(PLUGINSRC)/NDPluginStdArrays.h
SOURCES += $(PLUGINSRC)/NDPluginStdArrays.cpp

DBDS    += $(PLUGINSRC)/NDPluginTimeSeries.dbd
HEADERS += $(PLUGINSRC)/NDPluginTimeSeries.h
SOURCES += $(PLUGINSRC)/NDPluginTimeSeries.cpp

DBDS    += $(PLUGINSRC)/NDPluginTransform.dbd
HEADERS += $(PLUGINSRC)/NDPluginTransform.h
SOURCES += $(PLUGINSRC)/NDPluginTransform.cpp

DBDS    += $(PLUGINSRC)/NDPluginAttrPlot.dbd
HEADERS += $(PLUGINSRC)/NDPluginAttrPlot.h
HEADERS += $(PLUGINSRC)/CircularBuffer.h
SOURCES += $(PLUGINSRC)/NDPluginAttrPlot.cpp

# ADCore R3-7
DBDS    += $(PLUGINSRC)/NDPluginCodec.dbd
HEADERS += $(PLUGINSRC)/NDPluginCodec.h
SOURCES += $(PLUGINSRC)/NDPluginCodec.cpp


DBDS    += $(PLUGINSRC)/NDPosPlugin.dbd
HEADERS += $(PLUGINSRC)/NDPosPlugin.h
HEADERS += $(PLUGINSRC)/NDPosPluginFileReader.h
SOURCES += $(PLUGINSRC)/NDPosPlugin.cpp 
SOURCES += $(PLUGINSRC)/NDPosPluginFileReader.cpp

HEADERS += $(PLUGINSRC)/NDPluginFile.h
SOURCES += $(PLUGINSRC)/NDPluginFile.cpp

DBDS    += $(PLUGINSRC)/NDFileNull.dbd
HEADERS += $(PLUGINSRC)/NDFileNull.h
SOURCES += $(PLUGINSRC)/NDFileNull.cpp



## Still need to re-think how we handle the GRAPHICSMAGICK later
## 
ifeq ($(WITH_GRAPHICSMAGICK),YES)
ifeq ($(GRAPHICSMAGICK_PREFIX_SYMBOLS),YES)
USR_CXXFLAGS += -DPREFIX_MAGICK_SYMBOLS
endif
DBD     += $(PLUGINSRC)/NDFileMagick.dbd
HEADERS += $(PLUGINSRC)/NDFileMagick.h
SOURCES += $(PLUGINSRC)/NDFileMagick.cpp
ifdef GRAPHICSMAGICK_HEADERSLUDE
USR_HEADERSLUDES += -I$(GRAPHICSMAGICK_HEADERSLUDE)
endif
endif


# We enabled HDF5, JPEG, NETCDF, NEXUS, TIFF in ADSupport
# So, we follow them
# 
#ifeq ($(WITH_HDF5),YES)
DBDS    += $(PLUGINSRC)/NDFileHDF5.dbd
HEADERS += $(PLUGINSRC)/NDFileHDF5.h
HEADERS += $(PLUGINSRC)/NDFileHDF5Dataset.h
HEADERS += $(PLUGINSRC)/NDFileHDF5AttributeDataset.h
HEADERS += $(PLUGINSRC)/NDFileHDF5Layout.h
HEADERS += $(PLUGINSRC)/NDFileHDF5LayoutXML.h
HEADERS += $(PLUGINSRC)/NDFileHDF5VersionCheck.h

SOURCES += $(PLUGINSRC)/NDFileHDF5.cpp 
SOURCES += $(PLUGINSRC)/NDFileHDF5Dataset.cpp 
SOURCES += $(PLUGINSRC)/NDFileHDF5AttributeDataset.cpp 
SOURCES += $(PLUGINSRC)/NDFileHDF5LayoutXML.cpp 
SOURCES += $(PLUGINSRC)/NDFileHDF5Layout.cpp 
#endif

#ifeq ($(WITH_JPEG),YES)
DBDS    += $(PLUGINSRC)/NDFileJPEG.dbd
HEADERS += $(PLUGINSRC)/NDFileJPEG.h
SOURCES += $(PLUGINSRC)/NDFileJPEG.cpp 
#endif

#ifeq ($(WITH_NETCDF),YES)
DBDS    += $(PLUGINSRC)/NDFileNetCDF.dbd
HEADERS += $(PLUGINSRC)/NDFileNetCDF.h
SOURCES += $(PLUGINSRC)/NDFileNetCDF.cpp
#endif

#ifeq ($(WITH_NEXUS),YES)
DBDS    += $(PLUGINSRC)/NDFileNexus.dbd
HEADERS += $(PLUGINSRC)/NDFileNexus.h
SOURCES += $(PLUGINSRC)/NDFileNexus.cpp 
#endif

#ifeq ($(WITH_TIFF),YES)
DBDS    += $(PLUGINSRC)/NDFileTIFF.dbd
HEADERS += $(PLUGINSRC)/NDFileTIFF.h
SOURCES += $(PLUGINSRC)/NDFileTIFF.cpp 
#endif

ifeq ($(WITH_PVA), YES)
DBDS    += $(PLUGINSRC)/NDPluginPva.dbd
HEADERS += $(PLUGINSRC)/NDPluginPva.h
SOURCES += $(PLUGINSRC)/NDPluginPva.cpp

HEADERS += $(NTNDARRAYCONVERTERSRC)/ntndArrayConverter.h
SOURCES += $(NTNDARRAYCONVERTERSRC)/ntndArrayConverter.cpp
endif


USR_CXXFLAGS += -DHAVE_BLOSC
USR_CXXFLAGS += -DHAVE_BITSHUFFLE

DBDS	+= $(ADCORESRC)/ADSupport.dbd

HEADERS += $(ADCORESRC)/ADCoreVersion.h
HEADERS += $(ADCORESRC)/NDAttribute.h
HEADERS += $(ADCORESRC)/NDAttributeList.h
HEADERS += $(ADCORESRC)/NDArray.h
HEADERS += $(ADCORESRC)/Codec.h
HEADERS += $(ADCORESRC)/PVAttribute.h
HEADERS += $(ADCORESRC)/paramAttribute.h
HEADERS += $(ADCORESRC)/functAttribute.h
HEADERS += $(ADCORESRC)/asynNDArrayDriver.h
HEADERS += $(ADCORESRC)/ADDriver.h

SOURCES += $(ADCORESRC)/NDAttribute.cpp
SOURCES += $(ADCORESRC)/NDAttributeList.cpp
SOURCES += $(ADCORESRC)/NDArrayPool.cpp
SOURCES += $(ADCORESRC)/NDArray.cpp
SOURCES += $(ADCORESRC)/asynNDArrayDriver.cpp
SOURCES += $(ADCORESRC)/ADDriver.cpp
SOURCES += $(ADCORESRC)/paramAttribute.cpp

SOURCES += $(ADCORESRC)/PVAttribute.cpp
SOURCES += $(ADCORESRC)/functAttribute.cpp
SOURCES += $(ADCORESRC)/parseAreaPrefixes.c
SOURCES += $(ADCORESRC)/myTimeStampSource.cpp
SOURCES += $(ADCORESRC)/myAttributeFunctions.cpp



# We install all templates whether we enable it or not.
# General
TEMPLATES += $(ADCOREDB)/NDArrayBase.template
TEMPLATES += $(ADCOREDB)/ADBase.template
TEMPLATES += $(ADCOREDB)/ADPrefixes.template

# Plugins
TEMPLATES += $(ADCOREDB)/NDAttribute.template
TEMPLATES += $(ADCOREDB)/NDAttributeN.template
TEMPLATES += $(ADCOREDB)/NDCircularBuff.template
TEMPLATES += $(ADCOREDB)/NDColorConvert.template
TEMPLATES += $(ADCOREDB)/NDFFT.template
TEMPLATES += $(ADCOREDB)/NDFile.template
TEMPLATES += $(ADCOREDB)/NDFileHDF5.template
TEMPLATES += $(ADCOREDB)/NDFileJPEG.template
#TEMPLATES += $(ADCOREDB)/NDFileMagick.template
TEMPLATES += $(ADCOREDB)/NDFileNetCDF.template
TEMPLATES += $(ADCOREDB)/NDFileNexus.template
TEMPLATES += $(ADCOREDB)/NDFileTIFF.template
TEMPLATES += $(ADCOREDB)/NDGather.template
TEMPLATES += $(ADCOREDB)/NDGatherN.template
TEMPLATES += $(ADCOREDB)/NDOverlay.template
TEMPLATES += $(ADCOREDB)/NDOverlayN.template
TEMPLATES += $(ADCOREDB)/NDPluginBase.template
TEMPLATES += $(ADCOREDB)/NDPosPlugin.template
TEMPLATES += $(ADCOREDB)/NDProcess.template
TEMPLATES += $(ADCOREDB)/NDPva.template
TEMPLATES += $(ADCOREDB)/NDROI.template
TEMPLATES += $(ADCOREDB)/NDROIStat.template
TEMPLATES += $(ADCOREDB)/NDROIStatN.template
TEMPLATES += $(ADCOREDB)/NDROIStat8.template
TEMPLATES += $(ADCOREDB)/NDScatter.template
TEMPLATES += $(ADCOREDB)/NDStats.template
TEMPLATES += $(ADCOREDB)/NDStdArrays.template
TEMPLATES += $(ADCOREDB)/NDTimeSeries.template
TEMPLATES += $(ADCOREDB)/NDTimeSeriesN.template
TEMPLATES += $(ADCOREDB)/NDTransform.template
TEMPLATES += $(ADCOREDB)/NDAttrPlotAttr.template
TEMPLATES += $(ADCOREDB)/NDAttrPlotData.template
TEMPLATES += $(ADCOREDB)/NDAttrPlot.template
TEMPLATES += $(ADCOREDB)/NDCodec.template

#SCRIPTS   += $(IOCBOOT)/EXAMPLE_commonPlugins.cmd

TEMPLATES += $(wildcard $(ADCOREDB)/*.req)
TEMPLATES += $(wildcard  ../iocsh/*.req)
SCRIPTS += $(wildcard ../iocsh/*.iocsh)


# db rule is the default in RULES_E3, so add the empty one

.PHONY: db
db:
#
.PHONY: vlibs
vlibs:
#
