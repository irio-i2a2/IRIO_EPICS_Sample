TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Declare LabVIEW resources

IRIO_FPGA_DIR = LVcRIODMA/FPGA_Bitfiles
IRIO_FPGA += NiFpga_cRIODAQDMA_9159.h  NiFpga_cRIODAQDMA_9159.lvbitx

#=============================

# Build the IOC application
PROD_IOC = cRIODMA

# cRIODMA.dbd will be created and installed
DBD += cRIODMA.dbd

# cRIODMA.dbd will include these files:
cRIODMA_DBD += base.dbd

# cRIODMA_registerRecordDeviceDriver.cpp derives from cRIODMA.dbd
cRIODMA_SRCS += cRIODMA_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
cRIODMA_SRCS_DEFAULT += cRIODMAMain.cpp
cRIODMA_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#cRIODMA_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
#cRIODMA_LIBS += cRIODMASupport

# # ASYN
cRIODMA_DBD += asyn.dbd
cRIODMA_DBD += drvAsynSerialPort.dbd
cRIODMA_DBD += drvAsynIPPort.dbd
cRIODMA_LIBS += asyn

#IRIO
cRIODMA_DBD += $(IRIO_EPICS)/dbd/irioAsyn.dbd
cRIODMA_LIBS += irio-epics
# Finally link IOC to the EPICS Base libraries
cRIODMA_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

