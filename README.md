# OnyxOS

<p align="center">
  <img src="https://img.shields.io/badge/arch-RISC--V%2064--bit%20%7C%20RV32-green" alt="RISC-V">
  <img src="https://img.shields.io/badge/kernel-Rust-orange" alt="Rust">
  <img src="https://img.shields.io/badge/boot-C++20-blue" alt="C++20">
  <img src="https://img.shields.io/badge/shell-Rust-orange" alt="Shell">
  <img src="https://img.shields.io/badge/compiler-C99-yellow" alt="Compiler">
  <img src="https://img.shields.io/badge/license-GPL--3.0-red" alt="GPL-3.0">
</p>

Операционная система для RISC-V (OC2r / Milk-V Duo S). Монолитное ядро на Rust,
загрузчик на C++, userspace shell на Rust, собственный C-компилятор.

## Компоненты

| Компонент | Язык | Описание | Статус |
|-----------|------|----------|--------|
| **OnyxBoot** | C++20 | Загрузчик: FDT, VirtIO, SDHCI, FAT32/ext4, GPT, boot menu | v0.4 |
| **OnyxKernel** | Rust | Монолитное ядро: MM (Sv39), SMP, VFS, TCP/IP, драйверы, 77 syscalls | active |
| **OnyxShell** | Rust | Шелл: 20 команд, табы, история, пайпы/редиректы, globbing | v0.3 |
| **OnyxCompiller** | C99 | C → RV64 → `.onx`, single-pass, самокомпиляция в процессе | MVP |
| **OnyxOS** | — | Документация, скрипты, интеграция | meta |

## Быстрый старт

```bash
# 1. Установить зависимости
sudo pacman -S cmake base-devel curl libarchive    # Arch
sudo apt install cmake build-essential libcurl4-openssl-dev libarchive-dev  # Deb

# 2. Скачать все Onyx-репозитории
./.vent/vent -j 4 Onyx.vent

# 3. Собрать всё
bash scripts/build-all.sh

# 4. Запустить в QEMU
bash scripts/run-qemu.sh
```

## Структура репозитория

```
OnyxOS/
├── Onyx.vent              # Dependency-файл для Vent
├── .vent/
│   ├── vent               # Vent binary
│   └── repos/             # Стянутые репозитории (после запуска Vent)
├── scripts/
│   ├── bootstrap.sh       # Установка Vent + клонирование репозиториев
│   ├── build-all.sh       # Сборка всех компонентов
│   └── run-qemu.sh        # Запуск QEMU (OnyxBoot + OnyxKernel)
├── docs/                  # Документация
│   ├── architecture/      # Архитектура: boot, memory, privilege modes
│   ├── dev/               # Разработка: building, contributing, roadmap
│   ├── hardware/          # Железо: UART, PLIC, CLINT, VirtIO
│   ├── internals/         # Внутренности: coding style, error handling
│   ├── kernel/            # Ядро: процессы, MM, прерывания
│   ├── shell/             # Шелл: команды, internals
│   └── lore/              # Фольклор
├── Makefile               # Skeleton (WIP)
└── README.md
```

## Сборка компонентов по отдельности

### OnyxKernel

```bash
cd .vent/repos/OnyxKernel
cargo build --release
```

### OnyxBoot

```bash
cd .vent/repos/OnyxBoot
make -j$(nproc)
```

### OnyxShell

```bash
cd .vent/repos/OnyxShell
bash build.sh
```

### OnyxCompiller

```bash
cd .vent/repos/OnyxCompiller
make host          # нативный бинар для Linux
make onyx          # кросс-компиляция в .onx
```

## План развития

| Область | Что делаем |
|---------|-----------|
| **OnyxKernel** | FAT32 read, USB URB, symlink, chmod, 32-bit порт, unit-тесты |
| **OnyxCompiller** | Самокомпиляция, multi-file linking, C++ |
| **CI/CD** | GitHub Actions, автотесты в QEMU |
| **Железо** | Проверка на Milk-V Duo S |

Подробнее — [docs/dev/roadmap.md](docs/dev/roadmap.md) и [todo.md](https://github.com/loki5512344/OnyxKernel/blob/main/todo.md).

## Лицензия

GPL-3.0-or-later
