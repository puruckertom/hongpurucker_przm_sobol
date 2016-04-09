############################################
# DO NOT DELETE THIS LINE - used by f90make.
# Everything after the line will be replaced when the Makefile is updated.
# Section updated on Tue Nov  9 11:52:35 2004.
# Makefile for przm
# e:\5\3przm\7.src\Makefile
#
# nmake /n /u -- generates commands for a batch file

#  6 Jan 2004  3:21 pm
#     * added version.rc stuff
#
# 10 Dec 2002  9:44 am
# Base file created by f90make, then edited by hand:
#     * add the przm libs
#     * source is f77 (without "module" statement), therefore
#       needed to add the objects to the target. See $(f77code)

# DOS>nmake > a.del
# DOS>grep -v 'Fixed form source is an obsolescent feature' a.del > b.del

.SUFFIXES: .exe .obj .mod .f90 .f95 .for .f9x .res .rc .rcx

# Fortran preprocessor name: xcoco
# Options:
#    -x :: Read _xcoco.ini
#    -S :: supress final setfile message
fpp = xcoco
fpp_opts = -x -S

FC = lf95

# Lf95 flags
# -dbl -- extend all single precision real items to double precision
# -in -- "Implicit None"
# -info -- variables declared and not used, other stuff
# -nchk -- no checks
# -nconcc -- turn off Fortran carriage control processing for console I/O.
# -pause -- pause after the program terminates
# -wo -- warn obsolescent f90
# -xref -- generate cross-reference information (stored in *.lst)
XREF = -xref # -info

# Debug: Compile and link flags
DEBUGcf = -chk -g -pca -stchk -trace -w -winconsole

# OPTIMIZE: Compile and link flags
OPTIMIZEcf = -nap -nchk -ndal -ng -o1 -npca -ntrace -nsav -nstchk -nw

SRC_Path =
ModuleList = .

f95flags =
ldflags =

# [production options]
!IfDef Xprod
f95flags = -in -zero $(XREF) #-info
!EndIf

# [debug/testing options]
!IfDef Xdebug
f95flags = $(XREF) $(DEBUGcf) -in -zero
ldflags = $(DEBUGlf)
!EndIf

# [WinPRZM options]
!IfDef Xwin
f95flags = -ninfo -in -chk (s) -zero
!EndIf


WinAPI = -ml winapi # -win -nvsw
f95flags = $(f95flags) $(WinAPI)
ldflags  = $(ldflags)  $(WinAPI)

#
# Libraries
NumLib = -Lib SSL2.lib
F2KcliLib = -Lib "F:\Program Files\Lahey-Fujitsu Fortran\v7.0\Win32\Lib\f2kcli.lib"

# Rules:
.f9x.f90 :
        $(fpp) $(fpp_opts)  $@ $<

.rcx.rc :
        $(fpp) $(fpp_opts)  $@ $<

.f90.obj :
      $(FC) -mod $(ModuleList) $(f95flags) -c $< -o $(<B).obj

.for.obj :
      $(FC) -mod $(ModuleList) $(f95flags) -c $< -o $(<B).obj

.rc.res :
      $(FC) -c $<

# Resource Files
RESOURCE_SRC = version.rc
RESOURCE_OBJ = version.res


# przm3123.exe
f90code = $(RESOURCE_OBJ) canopy.obj floatcmp.obj furrow.obj general.obj \
   inivar.obj lambertw.obj wind.obj i_errchk.obj utils.obj iosubs.obj \
   ioluns.obj datemod.obj infnan.obj debug.obj cnfuns.obj cropdate.obj \
   chem.obj  m_readvars.obj debug_cn.obj

f77code = przm3.obj rsexec.obj rsinp1.obj rsinp2.obj rsinp3.obj rsmcar.obj rsprz1.obj \
   rsprz2.obj rsprz3.obj rsprzn.obj rsmisc.obj rsvado.obj rsutil.obj fcscnc.obj 

przm2_INC = cechot.inc cfilex.inc cmcrvr.inc piouni.inc pmxnsz.inc \
   pmxzon.inc

# przm2_LIBS = -Lib Libs\WDM.LIB Libs\UTIL.LIB Libs\ADWDM.LIB "F:\Program Files\Lahey-Fujitsu Fortran\v7.1\Win32\Lib\f2kcli.lib"
przm2_LIBS = -Lib Libs\f2kcli.lib -Lib Libs\WDM.LIB Libs\UTIL.LIB Libs\ADWDM.LIB



targets : przm3123.exe

przm3123.exe : $(f90code) $(f77code)
   del  $@  2>nul
   $(FC) $(ldflags) -out $@ $** $(przm2_LIBS)
   copy $@ "C:\Express\progs\"
   copy $@ "C:\OldComputerSetup\921573\e\5\3przm\bin\przmv3123.exe"
   copy $@ /y "C:\Documents and Settings\lsuarez\Desktop\przm-test\przm312.exe"


### Dependencies:
canopy.obj : canopy.f90 general.obj i_errchk.obj wind.obj
chem.obj : ccrop.inc chem.f90 chydr.inc cmet.inc cmisc.inc cpest.inc \
   general.obj pparm.inc
cnfuns.obj : cnfuns.f90 CHYDR.INC pparm.inc
cropdate.obj : cropdate.f90 datemod.obj debug.obj
datemod.obj : datemod.f90
debug.obj : debug.f90
debug_cn.obj : debug_cn.f90
fcscnc.obj : fcscnc.for infnan.obj ioluns.obj
floatcmp.obj : floatcmp.f90
furrow.obj : cirgt.inc furrow.f90 general.obj lambertw.obj
general.f90 : _xcoco.ini general.f9x
general.obj : general.f90
m_readvars.obj :  m_readvars.f90
cnfuns.obj :  m_readvars.obj cnfuns.f90
i_errchk.obj : i_errchk.f90
infnan.obj : infnan.f90
inivar.obj : general.obj inivar.f90 wind.obj
ioluns.obj : general.obj ioluns.f90
iosubs.obj : general.obj iosubs.f90
lambertw.obj : general.obj lambertw.f90
przm3.obj : cechot.inc cfilex.inc cmcrvr.inc datemod.obj debug.obj \
   general.obj inivar.obj piouni.inc pmxnsz.inc pmxzon.inc przm3.for \
   utils.obj debug.obj
rsexec.obj : ccontr.inc ccumul.inc cin2vd.inc cmdata.inc cprzst.inc \
   cropdate.obj ctrnbc.inc cvadst.inc cvchmk.inc cvmisc.inc cvntr1.inc \
   cvvlm.inc cvwrkm.inc cznwht.inc pcmplr.inc pmxmat.inc pmxnod.inc \
   pmxowd.inc pmxpdt.inc pmxvdt.inc rsexec.for
rsinp1.obj : cropdate.obj ctrace.inc datemod.obj exam.inc general.obj \
   ioluns.obj iosubs.obj pmxyrs.inc rsinp1.for table.inc
rsinp2.obj : caccum.inc cbio.inc cnfuns.obj cnitr.inc cropdate.obj \
   csptic.inc datemod.obj debug.obj floatcmp.obj general.obj hlfdum.inc \
   rsinp2.for wind.obj  m_readvars.obj  utils.obj
rsinp3.obj : cadisc.inc cback.inc cbdisc.inc cbsolv.inc cdaobs.inc \
   cmcstr.inc cpchk.inc cswhda.inc ctpdef.inc cvntr2.inc cworkn.inc \
   pmxnly.inc pmxprt.inc pmxtim.inc pmxtmv.inc rsinp3.for
rsmcar.obj : rsmcar.for
rsmisc.obj : constp.inc rsmisc.for
rsprz1.obj : canopy.obj chem.obj cnfuns.obj cptap.inc cropdate.obj \
   datemod.obj debug.obj furrow.obj rsprz1.for wind.obj
rsprz2.obj : cglbpz.inc rsprz2.for
rsprz3.obj : cptchk.inc rsprz3.for wind.obj
rsprzn.obj : chmsg.inc phmsg.inc rsprzn.for
rsutil.obj : rsutil.for
rsvado.obj : cvaslv.inc cwelem.inc cworka.inc rsvado.for
utils.obj : general.obj utils.f90
version.rc : _xcoco.ini version.rcx
version.res : version.rc
wind.obj : general.obj wind.f90

#End-of-File Makefile

