# OnyxOS

Операционная система для RISC-V (OC2r / Milk-V Duo S). Состоит из трёх компонентов:

```
Onyx/
├── OnyxBoot/     — загрузчик (C++)
├── OnyxKernel/   — ядро (Rust, no_std)
└── OnyxOS/       — системный слой (доки, скрипты, userspace)
```

---

## Компоненты

| Компонент | Язык | Назначение | Статус |
|-----------|------|-----------|--------|
| **OnyxBoot** | C++ | UART, FDT, VirtIO, SDHCI, FAT32/EXT4, ELF, boot menu | v0.4 |
| **OnyxKernel** | Rust | Монолитное ядро: MM, процессы, драйверы, shell | В разработке (v0.1) |
| **OnyxOS** | — | Документация, билд-скрипты, в будущем — userspace | Активно |

---

## Сборка

### OnyxKernel

```bash
cd OnyxKernel
cargo build --release

# Запуск в QEMU
qemu-system-riscv64 \
  -machine virt -m 128M -nographic \
  -bios default \
  -kernel target/riscv64gc-unknown-none-elf/release/Onyxos
```

### OnyxBoot

```bash
cd OnyxBoot
make
```

---

## План работ

| Версия | Компонент | Что делаем |
|--------|-----------|-----------|
| v0.1 | OnyxKernel | Костяк ядра: UART, MM, драйверы, shell — **сделано** |
| — | OnyxBoot | Загрузчик на C++: FDT, VirtIO, ELF |
| v0.3 | OnyxKernel | Прерывания, задачи, round-robin, syscall |
| v0.4 | OnyxKernel | VirtIO block v2 MMIO в ядре |
| v0.5 | Оба | SlipFS + первый userspace |
| v0.6 | OnyxOS | CLI-утилиты, init-процесс |
| v1.0 | Все | Slip shell как userspace, picolibc, модули |

Подробнее — [docs/dev/roadmap.md](docs/dev/roadmap.md)

---

## License

GPL-3.0-or-later
