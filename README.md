# windows-maintenance

> **Ex ruina, restitutio.**  
> *(Out of ruin, restoration.)*

A secure, robust Windows Batch utility designed to automate system integrity checks and repair component store corruption with zero redundant flags.

## Features

* **Privilege Guardrails:** Automatically detects and enforces Administrator execution rights to prevent partial run failures.
* **Optimized Execution Pipeline:** Invokes `DISM.exe`, `sfc`, and `chkdsk` sequentially without redundant scanning loops.
* **Dynamic Argument Parsing:** Supports targeting specific drive letters sequentially with built-in quote-stripping protection (`~`) to handle malformed inputs.
* **Failsafe Defaults:** Automatically falls back to checking the primary system partition (`C:`) if no specific drive arguments are provided.

## Usage

### Run Default (System Drive)
Right-click the script and select **Run as Administrator** to scan the core operating system files and the `C:` drive.

### Run via Command Line (Targeting Specific Drives)
You can pass target drive letters as arguments directly through an elevated command prompt:
```cmd
integrity-check.bat D: E: F:
