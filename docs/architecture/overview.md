# Архитектура SlipperOS

SlipperOS — монолитное ядро, работающее в S-mode RISC-V.
Bootloader на C++, ядро на Rust, userspace C (picolibc) — см. language_policy.

## Компоненты

- **boot** — точка входа _start, обнуление bss, стек
- **SlipperBoot** — загрузчик с диска (ELF парсер, FDT, boot.cfg) — **v0.2, не реализован**
- **kernel** — инициализация, panic handler
- **drivers** — UART, CLINT, PLIC, VirtIO (block + GPU)
- **mm** — bump allocator, page allocator, Sv39
- **proc** — задачи, round-robin, контекст
- **fs** — slipfs (блочная ФС)
- **shell** — slip shell (UART-based CLI)
- **compositor** — Wayland + GPU (отдельный аддон, не входит в ядро)

## Поток управления

```
OpenSBI → _start → [SlipperBoot] → kernel_main → shell_start
```
