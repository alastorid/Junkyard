:: This source file is part of Junkyard repository.
:: Licensed under the terms of the GNU General Public License v3 or later.
:: Copyright (C) Biswapriyo Nath
::
:: windows.bat: Generates windows.til type library for Hex Rays Decompiler

@echo off
set ver=10.0.18362.0
set ver2=2019
set ver3=14.29.30133
set folder=%ProgramFiles(x86)%\Windows Kits\10\Include\%ver%
set folder2=%ProgramFiles(x86)%\Microsoft Visual Studio\%ver2%\Enterprise\VC\Tools\MSVC\%ver3%\include
set where=^>nul 2^>nul where tilib64
%where% || path %path%;D:\IDA
%where% || path %path%;C:\Program Files\IDA 7.7

tilib64.exe -c ^
-Cc1 ^
-Ci4 ^
-Cl4 ^
-Cvr ^
-D_WIN32 ^
-D_WIN64 ^
-D_AMD64_ ^
-DAMD64 ^
-D_M_AMD64 ^
-DMSC_NOOPT ^
-DDBG=1 ^
-DDEPRECATED_DDK_FNUCTIONS=1 ^
-D_MSC_VER=1926 ^
-D_MSC_FULL_VER=192628807 ^
-DWINNT=1 ^
-DWINVER=_WIN32_WINNT ^
-D_WIN32_WINNT=0x0A00 ^
-D_WIN32_IE=0x0A00 ^
-DNTDDI_VERSION=WDK_NTDDI_VERSION ^
-DWDK_NTDDI_VERSION=NTDDI_WIN10_FE ^
-DNTDDI_WIN10_FE=0x0A00000A ^
-D_inline=inline ^
-D__inline=inline ^
-D__forceinline=inline ^
-D__volatile=volatile ^
-DDECLSPEC_NOINITALL= ^
-D__ptr64=__far ^
-D__ptr32=__far ^
-D_MSC_EXTENSIONS=1 ^
-Dbool=uint8_t ^
-R ^
-h"%folder%\um\Windows.h" ^
-I"%folder2%" ^
-I"%folder%\shared" ^
-I"%folder%\cppwinrt\winrt" ^
-I"%folder%\ucrt" ^
-I"%folder%\um" ^
-I"%folder%\winrt" ^
-e ^
windows.til
