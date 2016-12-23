#!../../bin/linux-x86_64/cRIOIO

## You may have to change cRIOIO to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet("EPICS_CA_SERVER_PORT", "5064")
epicsEnvSet("EPICS_CA_REPEATER","5065")
epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "YES")
epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","170000")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/cRIOIO.dbd"
cRIOIO_registerRecordDeviceDriver pdbbase

## Init irio device

nirioinit("RIO_0","019ED079","NI 9159","cRIOIO_9159","V1.1",1)
asynRegisterTimeStampSource("RIO_0","irioTimeStamp")

## Load record instances
cd "$(TOP)/iocBoot/$(IOC)"
dbLoadTemplate("PCF0-rio-module.substitution")
dbLoadTemplate("PCF0-rio-ai.substitution")
dbLoadTemplate("PCF0-rio-ao.substitution")
dbLoadTemplate("PCF0-rio-di.substitution")
dbLoadTemplate("PCF0-rio-do.substitution")
dbLoadTemplate("PCF0-rio-auxai.substitution")
dbLoadTemplate("PCF0-rio-auxao.substitution")
dbLoadTemplate("PCF0-rio-auxdi.substitution")
dbLoadTemplate("PCF0-rio-auxdo.substitution")
dbLoadTemplate("PCF0-rio-pointbypoint.substitution")

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
##traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=ebernal"
