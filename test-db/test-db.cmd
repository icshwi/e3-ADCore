require ADCore,3.2.0
#require busy,c8ea03e
#require calc,4aab3c

epicsEnvSet("P", 			"ADCore")
epicsEnvSet("R", 			":Test-")
epicsEnvSet("PORT", 		"Port")
epicsEnvSet("ADDR", 		"0")
epicsEnvSet("TIMEOUT", 		"1")
epicsEnvSet("NDARRAY_PORT", "NDA_PORT")
epicsEnvSet("NELEMENTS",    20)
epicsEnvSet("NCHANS",		10)
epicsEnvSet("N_CACHE",		20)
epicsEnvSet("PLUGIN_BASE",	"P=$(P), R=$(R), PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT)")
epicsEnvSet("COMMON",	"P=$(P), R=$(R), PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT)")

dbLoadRecords("ADPrefixes.template", "P=$(P), R=$(R), NELEMENTS=$(NELEMENTS)")

dbLoadRecords("NDAttrPlot.template", "P=$(P), R=$(R), PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT)")
dbLoadRecords("NDAttribute.template", "P=$(P), R=$(R)02-, PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT), NCHANS=$(NCHANS)")

dbLoadRecords("NDAttributeN.template", "P=$(P), R=$(R), PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT), NCHANS=$(NCHANS)")

dbLoadRecords("NDAttrPlotAttr.template", "P=$(P), R=$(R), PORT=$(PORT), ATTR_IND=5")
dbLoadRecords("NDAttrPlotData.template", "P=$(P), R=$(R), PORT=$(PORT), AXIS="x", DATA_IND=0, DATA_ADDR=$(ADDR), N_CACHE=20")
dbLoadRecords("NDColorConvert.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDFFT.template", "$(PLUGIN_BASE), NCHANS=$(NCHANS), NAME=WLA")

dbLoadRecords("NDGatherN.template", "$(COMMON), NDARRAY_PORT=$(NDARRAY_PORT), N=5")
dbLoadRecords("NDOverlay.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDOverlayN.template", "$(COMMON), NAME=WLA, O=O, SHAPE=0")

#Pva is not supported yet
#dbLoadRecords("NDPva.template", "$(PLUGIN_BASE)")

dbLoadRecords("NDROI.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDROIStat.template", "$(PLUGIN_BASE), NCHANS=$(NCHANS)")

#Error: syntax error
# at or before "substitute" in path "/epics/modules/ADCore/3.2.0/R3.15.5/db"  file "NDROIStat8.template" line 29
# Why???
#dbLoadRecords("NDROIStat8.template", "$(PLUGIN_BASE), NCHANS=$(NCHANS)")

dbLoadRecords("NDROIStatN.template", "P=$(P), R=$(R)03-, PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NCHANS=$(NCHANS)")

dbLoadRecords("NDScatter.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDStdArrays.template", "$(PLUGIN_BASE), TYPE=Int32, FTVL=LONG, NELEMENTS=10")
dbLoadRecords("NDTimeSeriesN.template", "$(COMMON), NAME=Test, NCHANS=$(NCHANS)")
dbLoadRecords("NDTransform.template", "$(PLUGIN_BASE)")

# busy
require busy,c8ea03e

dbLoadRecords("ADBase.template", "P=$(P), R=$(R), PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT)")
dbLoadRecords("NDCircularBuff.template", "$(PLUGIN_BASE), PRECOUNT=0, POSTCOUNT=10")
dbLoadRecords("NDFile.template", "$(COMMON)")
dbLoadRecords("NDFileHDF5.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDFileNetCDF.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDFileNexus.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDFileTIFF.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDFileJPEG.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDPosPlugin.template", "P=$(P), R=$(R)Npos-, PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT)")
dbLoadRecords("NDProcess.template", "$(PLUGIN_BASE)")
dbLoadRecords("NDTimeSeries.template", "P=$(P), R=$(R)NdTimeS-, PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT), NCHANS=$(NCHANS)")

#Magick is not supported yet
#dbLoadRecords("NDFileMagick.template", "$(PLUGIN_BASE)")

# calc
require calc,4aab3c

dbLoadRecords("NDStats.template", "P=$(P), R=$(R)Stats-, PORT=$(PORT), ADDR=$(ADDR), TIMEOUT=$(TIMEOUT), NDARRAY_PORT=$(NDARRAY_PORT), NCHANS=$(NCHANS), YSIZE=2, XSIZE=4, HIST_SIZE=10")






