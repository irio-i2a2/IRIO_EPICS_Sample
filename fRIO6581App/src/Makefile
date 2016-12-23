TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Declare LabVIEW resources

IRIO_FPGA_DIR = LVfRIO6581/FPGA_Bitfiles
IRIO_FPGA += NiFpga_FlexRIOMod6581_7965.h  NiFpga_FlexRIOMod6581_7965.lvbitx

#=============================

# Build the IOC application
PROD_IOC = fRIO6581

# fRIO6581.dbd will be created and installed
DBD += fRIO6581.dbd

# fRIO6581.dbd will include these files:
fRIO6581_DBD += base.dbd

# fRIO6581_registerRecordDeviceDriver.cpp derives from fRIO6581.dbd
fRIO6581_SRCS += fRIO6581_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
fRIO6581_SRCS_DEFAULT += fRIO6581Main.cpp
fRIO6581_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#fRIO6581_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
#fRIO6581_LIBS += fRIO6581Support

# # ASYN
fRIO6581_DBD += asyn.dbd
fRIO6581_DBD += drvAsynSerialPort.dbd
fRIO6581_DBD += drvAsynIPPort.dbd
fRIO6581_LIBS += asyn

#IRIO
fRIO6581_DBD += $(IRIO_EPICS)/dbd/irioAsyn.dbd
fRIO6581_LIBS += irio-epics
# Finally link IOC to the EPICS Base libraries
fRIO6581_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
