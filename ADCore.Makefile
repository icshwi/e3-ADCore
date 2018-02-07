#
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
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
# Author  : william
# email   : william@esss.se
# Date    : generated by 2018Feb01-1130-24CET
# version : 0.0.0 
#
# template file is generated by ./prepare_module.bash with 673bad4dce8e231fad30e8f70c6cfa69dfd15130

# Please look at many other _module_.Makefile in e3-* repository
# 

where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(REQUIRE_TOOLS)/driver.makefile

ADCORE = ADApp

AD_DIR			= $(ADCORE)/ADSrc
NDPLUGIN_DIR	= $(ADCORE)/pluginSrc
INCLUDE_DIR		= $(ADCORE)/../include
TEMPLATE_DIR	= $(ADCORE)/Db

USR_INCLUDES += -I/usr/include/libxml2/
USR_INCLUDES += -I$(EPICS_MODULES)/asyn/4.32.0/R3.15.5/include/
USR_INCLDUES += -I$(where_am_I)/$(AD_DIR)
USR_INCLDUES += -I$(where_am_I)/$(NDPLUGIN_DIR)
USR_INCLUDES += -I$(where_am_I)/$(INCLUDE_DIR)

USR_LDFLAGS += -L $(EPICS_MODULES)/asyn/4.32.0/R3.15.5/lib/linux-x86_64/
USR_LDFLAGS += -Wl,-rpath=$(EPICS_MODULES)/asyn/4.32.0/R3.15.5/lib/linux-x86_64/

USR_LIBS += asyn
USR_LIBS += xml2

################################## Building NDPlugin ##################################

#LIBRARY_IOC += NDPlugin
#DBD         += NDPluginSupport.dbd

# Persuade travis (ubuntu 12.04) to use HDF5 API V2 (1.8 rather than default 1.6)
USR_CXXFLAGS_Linux += -DH5_NO_DEPRECATED_SYMBOLS -DH5Gopen_vers=2

HEADERS += $(NDPLUGIN_DIR)/NDPluginDriver.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginDriver.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginAttribute.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginAttribute.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginAttribute.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginCircularBuff.dbd
HEADERS += $(NDPLUGIN_DIR)/NDArrayRing.h
HEADERS += $(NDPLUGIN_DIR)/NDPluginCircularBuff.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginCircularBuff.cpp
SOURCES += $(NDPLUGIN_DIR)/NDArrayRing.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginColorConvert.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginColorConvert.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginColorConvert.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginFFT.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginFFT.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginFFT.cpp
SOURCES += $(NDPLUGIN_DIR)/fft.c

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginGather.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginGather.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginGather.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginOverlay.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginOverlay.h
HEADERS += $(NDPLUGIN_DIR)/NDPluginOverlayTextFont.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginOverlay.cpp
SOURCES += $(NDPLUGIN_DIR)/NDPluginOverlayTextFont.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginProcess.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginProcess.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginProcess.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginROI.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginROI.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginROI.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginROIStat.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginROIStat.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginROIStat.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginScatter.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginScatter.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginScatter.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginStats.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginStats.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginStats.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginStdArrays.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginStdArrays.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginStdArrays.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginTimeSeries.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginTimeSeries.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginTimeSeries.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginTransform.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginTransform.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginTransform.cpp

DBD_SRCS += $(NDPLUGIN_DIR)/NDPluginAttrPlot.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPluginAttrPlot.h
HEADERS += $(NDPLUGIN_DIR)/CircularBuffer.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginAttrPlot.cpp

DBDS += $(NDPLUGIN_DIR)/NDPosPlugin.dbd
HEADERS += $(NDPLUGIN_DIR)/NDPosPlugin.h
HEADERS += $(NDPLUGIN_DIR)/NDPosPluginFileReader.h
SOURCES += $(NDPLUGIN_DIR)/NDPosPlugin.cpp 
SOURCES += $(NDPLUGIN_DIR)/NDPosPluginFileReader.cpp

HEADERS += $(NDPLUGIN_DIR)/NDPluginFile.h
SOURCES += $(NDPLUGIN_DIR)/NDPluginFile.cpp

DBDS += $(NDPLUGIN_DIR)/NDFileNull.dbd
HEADERS += $(NDPLUGIN_DIR)/NDFileNull.h
SOURCES += $(NDPLUGIN_DIR)/NDFileNull.cpp

ifeq ($(WITH_GRAPHICSMAGICK),YES)
  ifeq ($(GRAPHICSMAGICK_PREFIX_SYMBOLS),YES)
    USR_CXXFLAGS += -DPREFIX_MAGICK_SYMBOLS
  endif
  DBD      += NDFileMagick.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileMagick.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileMagick.cpp
  ifdef GRAPHICSMAGICK_INCLUDE
    USR_INCLUDES += -I$(GRAPHICSMAGICK_INCLUDE)
  endif
endif

ifeq ($(WITH_HDF5),YES)
  DBD      += NDFileHDF5.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5.h
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5Dataset.h
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5AttributeDataset.h
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5Layout.h
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5LayoutXML.h
  HEADERS += $(NDPLUGIN_DIR)/NDFileHDF5VersionCheck.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileHDF5.cpp 
  SOURCES += $(NDPLUGIN_DIR)/NDFileHDF5Dataset.cpp 
  SOURCES += $(NDPLUGIN_DIR)/NDFileHDF5AttributeDataset.cpp 
  SOURCES += $(NDPLUGIN_DIR)/NDFileHDF5LayoutXML.cpp 
  SOURCES += $(NDPLUGIN_DIR)/NDFileHDF5Layout.cpp 
endif

ifeq ($(WITH_JPEG),YES)
  DBD      += NDFileJPEG.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileJPEG.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileJPEG.cpp 
endif

ifeq ($(WITH_NETCDF),YES)
  DBD      += NDFileNetCDF.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileNetCDF.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileNetCDF.cpp
endif

ifeq ($(WITH_NEXUS),YES)
  DBD      += NDFileNexus.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileNexus.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileNexus.cpp 
endif

ifeq ($(WITH_TIFF),YES)
  DBD      += NDFileTIFF.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDFileTIFF.h
  SOURCES += $(NDPLUGIN_DIR)/NDFileTIFF.cpp 
  ifeq ($(SHARED_LIBRARIES),NO)
    # This flag is used to indicate that the TIFF library was built statically
    USR_CXXFLAGS_WIN32 += -DLIBTIFF_STATIC
  endif
endif

ifeq ($(WITH_PVA), YES)
  DBD += NDPluginPva.dbd
  HEADERS += $(NDPLUGIN_DIR)/NDPluginPva.h
  SOURCES += $(NDPLUGIN_DIR)/NDPluginPva.cpp
endif

ifdef HDF5_INCLUDE
  USR_INCLUDES += -I$(HDF5_INCLUDE)
endif
ifdef SZIP_INCLUDE
  USR_INCLUDES += -I$(SZIP_INCLUDE)
endif
ifdef XML2_INCLUDE
  USR_INCLUDES += -I$(XML2_INCLUDE)
endif

#######################################################################################

DBDS	+= $(AD_DIR)/ADSupport.dbd

HEADERS	+= $(AD_DIR)/ADCoreVersion.h
HEADERS	+= $(AD_DIR)/NDAttribute.h
HEADERS	+= $(AD_DIR)/NDAttributeList.h
HEADERS	+= $(AD_DIR)/NDArray.h
HEADERS	+= $(AD_DIR)/PVAttribute.h
HEADERS	+= $(AD_DIR)/paramAttribute.h
HEADERS	+= $(AD_DIR)/functAttribute.h
HEADERS	+= $(AD_DIR)/asynNDArrayDriver.h
HEADERS	+= $(AD_DIR)/ADDriver.h

#LIBRARY_IOC = ADBase
SOURCES	+= $(AD_DIR)/NDAttribute.cpp
SOURCES	+= $(AD_DIR)/NDAttributeList.cpp
SOURCES	+= $(AD_DIR)/NDArrayPool.cpp
SOURCES	+= $(AD_DIR)/NDArray.cpp
SOURCES	+= $(AD_DIR)/asynNDArrayDriver.cpp
SOURCES	+= $(AD_DIR)/ADDriver.cpp
SOURCES	+= $(AD_DIR)/paramAttribute.cpp
ifeq ($(EPICS_LIBCOM_ONLY),YES)
  USR_CXXFLAGS += -DEPICS_LIBCOM_ONLY
else
  SOURCES	+= $(AD_DIR)/PVAttribute.cpp
  SOURCES	+= $(AD_DIR)/functAttribute.cpp
  SOURCES	+= $(AD_DIR)/parseAreaPrefixes.c
  SOURCES	+= $(AD_DIR)/myTimeStampSource.cpp
  SOURCES	+= $(AD_DIR)/myAttributeFunctions.cpp
endif

ifeq (0, 1)

LIB_LIBS += asyn
ifeq ($(EPICS_LIBCOM_ONLY),YES)
  LIB_LIBS += Com
else
  LIB_LIBS += $(EPICS_BASE_IOC_LIBS)
endif
ifeq ($(XML2_EXTERNAL),NO)
  LIB_LIBS += xml2
else
  ifdef XML2_INCLUDE
    USR_INCLUDES += -I$(XML2_INCLUDE)
  endif
  ifdef XML2_LIB
    xml2_DIR     = $(XML2_LIB)
    LIB_LIBS     += xml2
  else
    LIB_SYS_LIBS += xml2
  endif
endif

endif #ifeq (0,1)

###################################### Adding templates ################################

# General
TEMPLATES += $(TEMPLATE_DIR)/NDArrayBase.template
TEMPLATES += $(TEMPLATE_DIR)/ADBase.template
TEMPLATES += $(TEMPLATE_DIR)/ADPrefixes.template

# Plugins
TEMPLATES += $(TEMPLATE_DIR)/NDAttribute.template
TEMPLATES += $(TEMPLATE_DIR)/NDAttributeN.template
TEMPLATES += $(TEMPLATE_DIR)/NDCircularBuff.template
TEMPLATES += $(TEMPLATE_DIR)/NDColorConvert.template
TEMPLATES += $(TEMPLATE_DIR)/NDFFT.template
TEMPLATES += $(TEMPLATE_DIR)/NDFile.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileHDF5.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileJPEG.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileMagick.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileNetCDF.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileNexus.template
TEMPLATES += $(TEMPLATE_DIR)/NDFileTIFF.template
TEMPLATES += $(TEMPLATE_DIR)/NDGather.template
TEMPLATES += $(TEMPLATE_DIR)/NDGatherN.template
TEMPLATES += $(TEMPLATE_DIR)/NDOverlay.template
TEMPLATES += $(TEMPLATE_DIR)/NDOverlayN.template
TEMPLATES += $(TEMPLATE_DIR)/NDPluginBase.template
TEMPLATES += $(TEMPLATE_DIR)/NDPosPlugin.template
TEMPLATES += $(TEMPLATE_DIR)/NDProcess.template
TEMPLATES += $(TEMPLATE_DIR)/NDPva.template
TEMPLATES += $(TEMPLATE_DIR)/NDROI.template
TEMPLATES += $(TEMPLATE_DIR)/NDROIStat.template
TEMPLATES += $(TEMPLATE_DIR)/NDROIStatN.template
TEMPLATES += $(TEMPLATE_DIR)/NDROIStat8.template
TEMPLATES += $(TEMPLATE_DIR)/NDScatter.template
TEMPLATES += $(TEMPLATE_DIR)/NDStats.template
TEMPLATES += $(TEMPLATE_DIR)/NDStdArrays.template
TEMPLATES += $(TEMPLATE_DIR)/NDTimeSeries.template
TEMPLATES += $(TEMPLATE_DIR)/NDTimeSeriesN.template
TEMPLATES += $(TEMPLATE_DIR)/NDTransform.template
TEMPLATES += $(TEMPLATE_DIR)/NDAttrPlotAttr.template
TEMPLATES += $(TEMPLATE_DIR)/NDAttrPlotData.template
TEMPLATES += $(TEMPLATE_DIR)/NDAttrPlot.template

#%:
#	echo $(SOURCES)
	


# APP:=calcApp
# APPDB:=$(APP)/Db
# APPSRC:=$(APP)/src


# USR_INCLUDES += -I$(where_am_I)/$(APPSRC)

# USR_CFLAGS   += -Wno-unused-variable
# USR_CFLAGS   += -Wno-unused-function
# USR_CFLAGS   += -Wno-unused-but-set-variable
# USR_CPPFLAGS += -Wno-unused-variable
# USR_CPPFLAGS += -Wno-unused-function
# USR_CPPFLAGS += -Wno-unused-but-set-variable

# TEMPLATES += $(wildcard $(APPDB)/*.db)

# DBDINC_SRCS += $(APPSRC)/swaitRecord.c
# DBDINC_SRCS += $(APPSRC)/sseqRecord.c
# DBDINC_SRCS += $(APPSRC)/aCalcoutRecord.c
# DBDINC_SRCS += $(APPSRC)/sCalcoutRecord.c
# DBDINC_SRCS += $(APPSRC)/transformRecord.c

# DBDINC_DBDS = $(subst .c,.dbd,   $(DBDINC_SRCS:$(APPSRC)/%=%))
# DBDINC_HDRS = $(subst .c,.h,     $(DBDINC_SRCS:$(APPSRC)/%=%))
# DBDINC_DEPS = $(subst .c,$(DEP), $(DBDINC_SRCS:$(APPSRC)/%=%))


# HEADERS += $(APPSRC)/sCalcPostfix.h
# HEADERS += $(APPSRC)/aCalcPostfix.h
# HEADERS += $(DBDINC_HDRS)


# SOURCES += $(APPSRC)/sCalcPostfix.c
# SOURCES += $(APPSRC)/sCalcPerform.c
# SOURCES += $(APPSRC)/aCalcPostfix.c
# SOURCES += $(APPSRC)/aCalcPerform.c

# SOURCES += $(APPSRC)/calcUtil.c
# SOURCES += $(APPSRC)/myFreeListLib.c
# SOURCES += $(APPSRC)/devsCalcoutSoft.c
# SOURCES += $(APPSRC)/devaCalcoutSoft.c
# SOURCES += $(APPSRC)/subAve.c
# SOURCES += $(APPSRC)/swaitRecord.c
# SOURCES += $(APPSRC)/editSseq.st
# SOURCES += $(APPSRC)/interp.c
# SOURCES += $(APPSRC)/arrayTest.c
# SOURCES += $(APPSRC)/aCalcMonitorMem.c
# # DBDINC_SRCS should be last of the series of SOURCES
# SOURCES += $(DBDINC_SRCS)

# DBDS += $(APPSRC)/calcSupport_LOCAL.dbd
# DBDS += $(APPSRC)/calcSupport_withSNCSEQ.dbd
# DBDS += $(APPSRC)/calcSupport_withSSCAN.dbd


# $(DBDINC_DEPS): $(DBDINC_HDRS)

# .dbd.h:
# 	$(DBTORECORDTYPEH)  $(USR_DBDFLAGS) -o  $<


# The following lines could be useful if one uses the external lib
#
# Examples...
# 
# USR_CFLAGS += -fPIC
# USR_CFLAGS   += -DDEBUG_PRINT
# USR_CPPFLAGS += -DDEBUG_PRINT
# USR_CPPFLAGS += -DUSE_TYPED_RSET
# USR_INCLUDES += -I/usr/include/libusb-1.0
# USR_LDFLAGS += -lusb-1.0
# USR_LDFLAGS += -L /opt/etherlab/lib
# USR_LDFLAGS += -lethercat
# USR_LDFLAGS += -Wl,-rpath=/opt/etherlab/lib

## SYSTEM LIBS 
##
# USR_LIBS += boost_regex
# USR_LIBS += readline
# USR_LIBS += xml2

#


