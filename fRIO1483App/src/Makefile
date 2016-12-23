TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Declare LabVIEW resources

IRIO_FPGA_DIR = LVfRIO1483/FPGA_Bitfiles
IRIO_FPGA += NiFpga_FlexRIOMod1483_7966.h  NiFpga_FlexRIOMod1483_7966.lvbitx

#=============================

# Build the IOC application
PROD_IOC = fRIO1483

# fRIO1483.dbd will be created and installed
DBD += fRIO1483.dbd

# fRIO1483.dbd will include these files:
fRIO1483_DBD += base.dbd

# fRIO1483_registerRecordDeviceDriver.cpp derives from fRIO1483.dbd
fRIO1483_SRCS += fRIO1483_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
fRIO1483_SRCS_DEFAULT += fRIO1483Main.cpp
fRIO1483_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#fRIO1483_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
#fRIO1483_LIBS += fRIO1483Support

# # ASYN
fRIO1483_DBD += asyn.dbd
fRIO1483_DBD += drvAsynSerialPort.dbd
fRIO1483_DBD += drvAsynIPPort.dbd
fRIO1483_LIBS += asyn

#IRIO
fRIO1483_DBD += $(IRIO_EPICS)/dbd/irioAsyn.dbd
fRIO1483_LIBS += irio-epics
# Finally link IOC to the EPICS Base libraries
fRIO1483_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
