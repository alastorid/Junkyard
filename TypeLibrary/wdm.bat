:: This source file is part of Junkyard repository.
:: Licensed under the terms of the GNU General Public License v3 or later.
:: Copyright (C) Biswapriyo Nath
::
:: wdm.bat: Generates wdm.til type library for Hex Rays Decompiler

@echo off
set ver=10.0.18362.0
set folder=%ProgramFiles(x86)%\Windows Kits\10\Include\%ver%
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
-D_M_AMD64 ^
-DDBG=1 ^
-DDEPRECATED_DDK_FNUCTIONS=1 ^
-D_MSC_VER=1926 ^
-D_MSC_FULL_VER=192628807 ^
-DWINVER=0x0A00 ^
-D_WIN32_IE=0x0A00 ^
-DNTDDI_VERSION=0x0A000007 ^
-D_inline=inline ^
-D__inline=inline ^
-D__forceinline=inline ^
-D__volatile=volatile ^
-D__ptr64=__far ^
-D__ptr32=__far ^
-D_Enum_is_bitflag_= ^
-h"%folder%\km\wdm.h" ^
-I"%folder%\shared" ^
-I"%folder%\km" ^
-I"%folder%\km\crt" ^
-e ^
wdm.til
