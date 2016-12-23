TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Declare LabVIEW resources

IRIO_FPGA_DIR = LVfRIO5761/FPGA_Bitfiles
IRIO_FPGA += NiFpga_FlexRIOMod5761_7966.h  NiFpga_FlexRIOMod5761_7966.lvbitx

#=============================

# Build the IOC application
PROD_IOC = fRIO5761

# fRIO5761.dbd will be created and installed
DBD += fRIO5761.dbd

# fRIO5761.dbd will include these files:
fRIO5761_DBD += base.dbd

# fRIO5761_registerRecordDeviceDriver.cpp derives from fRIO5761.dbd
fRIO5761_SRCS += fRIO5761_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
fRIO5761_SRCS_DEFAULT += fRIO5761Main.cpp
fRIO5761_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#fRIO5761_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
#fRIO5761_LIBS += fRIO5761Support

# # ASYN
fRIO5761_DBD += asyn.dbd
fRIO5761_DBD += drvAsynSerialPort.dbd
fRIO5761_DBD += drvAsynIPPort.dbd
fRIO5761_LIBS += asyn

#IRIO
fRIO5761_DBD += $(IRIO_EPICS)/dbd/irioAsyn.dbd
fRIO5761_LIBS += irio-epics
# Finally link IOC to the EPICS Base libraries
fRIO5761_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
