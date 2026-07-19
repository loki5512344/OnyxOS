# Known Issues

Актуальные проблемы и недоделки в текущем коде.

## OnyxKernel

| Проблема | Файл | Статус |
|----------|------|--------|
| FAT32 read — lookup/read заглушены | `kernel/src/fs/fat32/` | TODO |
| USB xHCI — только probe, нет URB transfer | `kernel/src/drivers/usb/` | TODO |
| `truncate/ftruncate` только до нуля | `kernel/src/fs/vfs/truncate.rs` | TODO |
| symlink/readlink не реализованы | `kernel/src/fs/onyxfs/` | TODO |
| `chmod/fchmod` — заглушки | `kernel/src/syscall/fs_sys3/` | TODO |
| `getdents64` без батчинга | `kernel/src/syscall/fs_sys3/` | TODO |
| fork без передачи argv/envp | `kernel/src/syscall/fs_sys3/extra.rs` | TODO |
| UDP/DHCP/DNS отсутствуют | `kernel/src/net/` | TODO |
| Нет unit-тестов | — | TODO |
| 32-bit порт (~50%) | `arch/bits.rs`, `boot_32.rs` | WIP |

## OnyxCompiller

| Проблема | Статус |
|----------|--------|
| Самокомпиляция не достигнута | P0 |
| Multi-file linking (один .c → один .onx) | TODO |
| Глобальные инициализаторы массивов/строк | TODO |
| C++ фронтенд не написан | TODO |
| Нет автоматического прогона тестов | TODO |

## OnyxOS

| Проблема | Статус |
|----------|--------|
| Makefile — скелет, не все цели работают | WIP |
| Нет CI/CD (GitHub Actions) | TODO |

## Решённые проблемы (исторические)

Все проблемы из предыдущей версии (`known_issues.md` SlipperOS) исправлены:

- ✅ Контекст свитч — работает (SMP, per-CPU run queues)
- ✅ Page allocator — bitmap + slab, есть contiguous
- ✅ VirtIO Legacy — не используется, только v2
- ✅ Trap handler — S-mode, stvec
- ✅ UART/VirtIO адреса — FDT-driven
- ✅ ELF загрузчик — onx::load работает
- ✅ Shell — все 20 команд работают
- ✅ Sv39 map_page — аллоцирует page tables
