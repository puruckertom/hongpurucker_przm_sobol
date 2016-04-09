	xcoco -x -S  version.rc version.rcx
	lf95 -c version.rc
	xcoco -x -S  general.f90 general.f9x
	lf95 -mod . -in -zero -xref -ml winapi -c general.f90 -o general.obj
	lf95 -mod . -in -zero -xref -ml winapi -c i_errchk.f90 -o i_errchk.obj
	lf95 -mod . -in -zero -xref -ml winapi -c wind.f90 -o wind.obj
	lf95 -mod . -in -zero -xref -ml winapi -c canopy.f90 -o canopy.obj
	lf95 -mod . -in -zero -xref -ml winapi -c floatcmp.f90 -o floatcmp.obj
	lf95 -mod . -in -zero -xref -ml winapi -c lambertw.f90 -o lambertw.obj
	lf95 -mod . -in -zero -xref -ml winapi -c furrow.f90 -o furrow.obj
	lf95 -mod . -in -zero -xref -ml winapi -c inivar.f90 -o inivar.obj
	lf95 -mod . -in -zero -xref -ml winapi -c utils.f90 -o utils.obj
	lf95 -mod . -in -zero -xref -ml winapi -c iosubs.f90 -o iosubs.obj
	lf95 -mod . -in -zero -xref -ml winapi -c ioluns.f90 -o ioluns.obj
	lf95 -mod . -in -zero -xref -ml winapi -c datemod.f90 -o datemod.obj
	lf95 -mod . -in -zero -xref -ml winapi -c infnan.f90 -o infnan.obj
	lf95 -mod . -in -zero -xref -ml winapi -c debug.f90 -o debug.obj
	lf95 -mod . -in -zero -xref -ml winapi -c m_readvars.f90 -o m_readvars.obj
	lf95 -mod . -in -zero -xref -ml winapi -c cnfuns.f90 -o cnfuns.obj
	lf95 -mod . -in -zero -xref -ml winapi -c cropdate.f90 -o cropdate.obj
	lf95 -mod . -in -zero -xref -ml winapi -c chem.f90 -o chem.obj
	lf95 -mod . -in -zero -xref -ml winapi -c debug_cn.f90 -o debug_cn.obj
	lf95 -mod . -in -zero -xref -ml winapi -c przm3.for -o przm3.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsexec.for -o rsexec.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsinp1.for -o rsinp1.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsinp2.for -o rsinp2.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsinp3.for -o rsinp3.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsmcar.for -o rsmcar.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsprz1.for -o rsprz1.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsprz2.for -o rsprz2.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsprz3.for -o rsprz3.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsprzn.for -o rsprzn.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsmisc.for -o rsmisc.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsvado.for -o rsvado.obj
	lf95 -mod . -in -zero -xref -ml winapi -c rsutil.for -o rsutil.obj
	lf95 -mod . -in -zero -xref -ml winapi -c fcscnc.for -o fcscnc.obj
	del  przm3123.exe  2>nul
	lf95   -ml winapi -out przm3123.exe version.res canopy.obj floatcmp.obj furrow.obj general.obj inivar.obj lambertw.obj wind.obj i_errchk.obj utils.obj iosubs.obj ioluns.obj datemod.obj infnan.obj debug.obj cnfuns.obj cropdate.obj chem.obj m_readvars.obj debug_cn.obj przm3.obj rsexec.obj rsinp1.obj rsinp2.obj rsinp3.obj rsmcar.obj rsprz1.obj rsprz2.obj rsprz3.obj rsprzn.obj rsmisc.obj rsvado.obj rsutil.obj fcscnc.obj -Lib Libs\f2kcli.lib -Lib Libs\WDM.LIB Libs\UTIL.LIB Libs\ADWDM.LIB
	copy przm3123.exe "C:\Express\progs\"
	copy przm3123.exe "C:\OldComputerSetup\921573\e\5\3przm\bin\przmv3123.exe"
	copy przm3123.exe /y "C:\Documents and Settings\lsuarez\Desktop\przm-test\przm312.exe"
