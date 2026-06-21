# Roadmap SlipperOS

## v0.1 — Костяк
- [x] UART консоль (NS16550A)
- [x] CLINT таймер
- [x] PLIC прерывания
- [x] Bump + Page allocator
- [x] Sv39 identity map
- [x] Slip shell (7 команд)
- [x] Panic handler

## v0.2 — SlipperBoot (загрузчик)
- [ ] **SlipperBoot** на C++, без единого `.S` файла
- [ ] UART драйвер (адрес из FDT)
- [ ] VirtIO block v2 MMIO (чтение диска, адрес + IRQ из FDT)
- [ ] ELF64 парсер (header + program headers)
- [ ] FDT парсер (память, устройства, UART, VirtIO — по compatible)
- [ ] Загрузка `kernel.elf` с диска и запуск
- [ ] Boot menu через UART (опционально)

## v0.3 — Прерывания и задачи
- [ ] Trap handler (S-mode, `stvec`)
- [ ] Реальное переключение контекста в `sched_yield()`
- [ ] Round-robin scheduler по CLINT
- [ ] syscall: ecall handler

## v0.4 — VirtIO block в ядре (v2 MMIO)
- [x] Подтверждён v2 MMIO (Sedna: `VIRTIO_MMIO_VERSION = 2`, обязателен `VIRTIO_F_VERSION_1`)
- [ ] Descriptor-based page allocator (contiguous)
- [ ] Чтение/запись секторов (драйвер под v2)
- [ ] Прерывания по завершению I/O

## v0.5 — SlipFS + userspace
- [ ] SlipFS (блочная ФС на Rust)
- [ ] Mount, read, write
- [ ] ELF загрузчик в ядре
- [ ] Первый userspace процесс

## v0.6 — Стабильное ядро
- [ ] CLI тулы (ls, cat, echo, ps)
- [ ] Init процесс
- [ ] Работает в OC2r
- [ ] Полная документация

## v1.0 — Релиз
- [ ] Slip shell как userspace программа
- [ ] Порт picolibc для C-софта
- [ ] Загрузка модулей через SlipperBoot
