# Roadmap

## v0.1 — SlipperKernel: костяк ✅
- [x] UART консоль (NS16550A)
- [x] CLINT таймер
- [x] PLIC прерывания
- [x] Bump + Page allocator
- [x] Sv39 identity map
- [x] VirtIO block (v2 MMIO, базовая инициализация)
- [x] FDT-парсер (memory, UART, VirtIO)
- [x] Slip shell (7 команд)
- [x] Panic handler
- [x] Разделение на SlipperBoot / SlipperKernel / SlipperOS

## SlipperBoot: загрузчик (v0.4)
- [x] Точка входа _start (naked C++, inline asm)
- [x] UART драйвер (NS16550A, адрес из FDT)
- [x] VirtIO block v2 MMIO (probe, read_sector)
- [x] SDHCI driver (probe, read_sector)
- [x] FAT32 + EXT4 reader
- [x] ELF64 парсер (valid, check_safe, load_all)
- [x] FDT парсер (memory, UART, VirtIO, SDHCI)
- [x] Boot menu (выбор устройства)
- [x] Загрузка `kernel.elf` с диска и запуск

## v0.3 — SlipperKernel: прерывания и задачи
- [ ] Trap handler (S-mode, `stvec`)
- [ ] Реальное переключение контекста в `sched_yield()`
- [ ] Round-robin scheduler по CLINT
- [ ] syscall: ecall handler

## v0.4 — SlipperKernel: VirtIO block v2 MMIO
- [ ] Descriptor-based page allocator (contiguous)
- [ ] Чтение/запись секторов (полноценный драйвер)
- [ ] Прерывания по завершению I/O

## v0.5 — SlipFS + userspace
- [ ] SlipFS (блочная ФС на Rust) — в SlipperKernel
- [ ] ELF загрузчик в ядре
- [ ] Первый userspace процесс в SlipperOS

## v0.6 — SlipperOS: стабильная система
- [ ] CLI тулы (ls, cat, echo, ps) — в SlipperOS
- [ ] Init процесс
- [ ] Работает в OC2r
- [ ] Полная документация

## v1.0 — Релиз
- [ ] Slip shell как userspace программа (SlipperOS)
- [ ] Порт picolibc для C-софта (SlipperOS)
- [ ] Загрузка модулей через SlipperBoot
