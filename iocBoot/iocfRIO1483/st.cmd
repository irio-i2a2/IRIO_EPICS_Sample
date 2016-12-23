#!../../bin/linux-x86_64/fRIO1483

## You may have to change fRIO1483 to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet("EPICS_CA_SERVER_PORT", "5064")
epicsEnvSet("EPICS_CA_REPEATER","5065")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "YES")
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","170000")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/fRIO1483.dbd"
fRIO1483_registerRecordDeviceDriver pdbbase


##Init Irio Device

nirioinit("RIO_0","01A34CC7","PXIe-7966R","FlexRIOMod1483_7966","V1.1",1)
asynRegisterTimeStampSource("RIO_0","irioTimeStamp")


## Load record instances
cd "$(TOP)/iocBoot/$(IOC)"
dbLoadTemplate("PCF0-rio-module.substitution")
dbLoadTemplate("PCF0-rio-imagedataacquisition.substitution")
dbLoadTemplate("PCF0-rio-imagewf.substitution")
dbLoadTemplate("PCF0-rio-di.substitution")
dbLoadTemplate("PCF0-rio-do.substitution")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=ebernal"
