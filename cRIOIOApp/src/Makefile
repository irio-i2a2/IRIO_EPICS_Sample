TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Declare LabVIEW resources

IRIO_FPGA_DIR = LVcRIOIO/FPGA_Bitfiles
IRIO_FPGA += NiFpga_cRIOIO_9159.h  NiFpga_cRIOIO_9159.lvbitx

#=============================

# Build the IOC application
PROD_IOC = cRIOIO

# cRIOIO.dbd will be created and installed
DBD += cRIOIO.dbd

# cRIOIO.dbd will include these files:
cRIOIO_DBD += base.dbd

# cRIOIO_registerRecordDeviceDriver.cpp derives from cRIOIO.dbd
cRIOIO_SRCS += cRIOIO_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
cRIOIO_SRCS_DEFAULT += cRIOIOMain.cpp
cRIOIO_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#cRIOIO_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
#cRIOIO_LIBS += cRIOIOSupport

# # ASYN
cRIOIO_DBD += asyn.dbd
cRIOIO_DBD += drvAsynSerialPort.dbd
cRIOIO_DBD += drvAsynIPPort.dbd
cRIOIO_LIBS += asyn

#IRIO
cRIOIO_DBD += $(IRIO_EPICS)/dbd/irioAsyn.dbd
cRIOIO_LIBS += irio-epics
# Finally link IOC to the EPICS Base libraries
cRIOIO_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

