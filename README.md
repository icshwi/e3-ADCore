# e3-ADCore

This repository is intended as the integration of the EPICS ADCore into ESS e3 environment

## Current status

The following plugins are not supported yet

* `NDFileMagick`  depends on the GraphicMagick, not supported in [ADSupport](https://github.com/icshwi/e3-ADSupport).
* `NDPva` depends on the pva modules, not integrated yet in e3

## Configuration compilation and installation

```
$ git clone https://github.com/icshwi/e3-ADCore.git
$ cd e3-ADCore
$ make build install
```

Try to load the library to verify that is properly installed and without _"Undefined Symbols"_ 

```
$ iocsh.bash -r ADCore,<version>
...
Module ADCore version <version> found in /epics/modules/ADCore/<version>/
...
iocInit
Starting iocInit
############################################################################
## EPICS R3.15.5-EEE-3.15.5-patch
## EPICS Base built Jan 10 2018
############################################################################
iocRun: All initialization complete
...
```

## Databases

ADCore templeta files are installed in `/epics/modules/ADCore/<version>/db` folder. 

### Dependencies
Some databases depend from record type defined in other modules:

| External module | Db
|-----------------|--------------|
| busy | ADBase.template NDCircularBuff.template NDFile.template NDFileHDF5.template NDFileNetCDF.template NDFileNexus.template NDFileTIFF.template NDFileJPEG.template NDPosPlugin.template NDProcess.template NDTimeSeries.template |
| calc | NDStats.template |

If you need one of these previous databases, you need to __explicitely require__ them on your startup scipt  

### Database Test

The repository contains a startup script intended to verify that all supported databases are properly loaded by `dbLoadRecords`.

```
$ cd e3-ADCore/test-db
$ iocsh.bash test-db.cmd
```

__Consider that the scope of this script is soleley intend to verify that all databases can be properly loaded (i.e. no error after calling dbLoadRecords is shown). A lot of errors can be generated as result of the `iocinit` call embedded in the iocsh script__
