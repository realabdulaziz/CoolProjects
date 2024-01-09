@echo off
title Check OS Architecture

set "SysWow64=%SystemRoot%\SysWow64"
if exist %SysWow64% echo using 64-bit OS (X64)
if not exist %SysWow64% echo using 32-bit OS (X86)
pause