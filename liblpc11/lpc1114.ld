OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
ENTRY(__cs3_reset)
SEARCH_DIR(.)
GROUP(-lgcc -lc -lcs3 -lcs3unhosted)

MEMORY
{
  ram  (rwx) : ORIGIN = 0x10000000, LENGTH = 4K
  rom  (rx)  : ORIGIN = 0x00000000, LENGTH = 32K
}

/* These force the linker to search for particular symbols from
 * the start of the link process and thus ensure the user's
 * overrides are picked up
 */
EXTERN(__cs3_reset)
/*INCLUDE micro-names.inc
EXTERN(__cs3_interrupt_vector_micro)*/
EXTERN(exception_table)
EXTERN(__cs3_start_asm_generic _start)
/* Bring in the interrupt routines & vector */
EXTERN(__cs3_start_c main __cs3_stack __cs3_heap_end)

__nxp_iap_size_ram = 32;

/* Provide fall-back values */
PROVIDE(__cs3_heap_start = _end);
PROVIDE(__cs3_heap_end = __cs3_region_start_ram + __cs3_region_size_ram);
PROVIDE(__cs3_region_num = (__cs3_regions_end - __cs3_regions) / 20);
PROVIDE(__cs3_stack = __cs3_region_start_ram + __cs3_region_size_ram - __nxp_iap_size_ram);
PROVIDE(__cs3_start_asm = __cs3_start_asm_generic);

SECTIONS
{
  .text :
  {
    CREATE_OBJECT_SYMBOLS
    __cs3_region_start_rom = .;
    _ftext = .;
    *(.cs3.region-head.rom)
    *(.interrupt_vector)
    __cs3_interrupt_vector = exception_table;
    /* Make sure we pulled in an interrupt vector.  */
    ASSERT (. != exception_table, "No interrupt vector");

    __interrupt_vector_crc = 0 - (__cs3_stack +__cs3_reset + nmi_handler + hard_fault_handler + 3);

    /*PROVIDE(__cs3_reset = __cs3_reset_generic);*/
    *(.cs3.reset)
    _start = DEFINED(__cs3_start_asm) ? __cs3_start_asm : _start;

    *(.text.cs3.init)
    *(.text.lpc.init)
    *(.text.SystemCoreClockUpdate .text.Chip_Clock_* .text.Chip_SYSCTL_*)

    /* CRP section */
    . = 0x2FC;
    KEEP(*(.crp))
    . = ALIGN(0x100);
    ASSERT (. == 0x300, ".crp section can only be maximum 4-byte long");

    *(.text .text.* .gnu.linkonce.t.*)
    *(.plt)
    *(.gnu.warning)
    *(.glue_7t) *(.glue_7) *(.vfp11_veneer)

    *(.ARM.extab* .gnu.linkonce.armextab.*)
    *(.gcc_except_table)
  } >rom =0xFF
  .eh_frame_hdr : ALIGN (4)
  {
    KEEP (*(.eh_frame_hdr))
    *(.eh_frame_entry .eh_frame_entry.*)
  } >rom =0xFF
  .eh_frame : ALIGN (4)
  {
    KEEP (*(.eh_frame)) *(.eh_frame.*)
  } >rom =0xFF
  /* .ARM.exidx is sorted, so has to go in its own output section.  */
  PROVIDE_HIDDEN (__exidx_start = .);
  .ARM.exidx :
  {
    *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  } >rom =0xFF
  PROVIDE_HIDDEN (__exidx_end = .);
  .rodata : ALIGN (4)
  {
    *(.rodata.str*)
    *(.rodata .rodata.* .gnu.linkonce.r.*)

    . = ALIGN(4);
    KEEP(*(.init))

    . = ALIGN(4);
    __preinit_array_start = .;
    KEEP (*(.preinit_array))
    __preinit_array_end = .;

    . = ALIGN(4);
    __init_array_start = .;
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array))
    __init_array_end = .;

    . = ALIGN(4);
    KEEP(*(.fini))

    . = ALIGN(4);
    __fini_array_start = .;
    KEEP (*(.fini_array))
    KEEP (*(SORT(.fini_array.*)))
    __fini_array_end = .;

    . = ALIGN(0x4);
    KEEP (*crtbegin.o(.ctors))
    KEEP (*(EXCLUDE_FILE (*crtend.o) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*crtend.o(.ctors))

    . = ALIGN(0x4);
    KEEP (*crtbegin.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*crtend.o(.dtors))

    . = ALIGN(4);
    __cs3_regions = .;
    LONG (0)
    LONG (__cs3_region_init_ram)
    LONG (__cs3_region_start_ram)
    LONG (__cs3_region_init_size_ram)
    LONG (__cs3_region_zero_size_ram)
    LONG (0)
    __cs3_regions_end = .;
    . = ALIGN (8);
    *(.rom)
    *(.rom.b .bss.rom)
    _etext = .;
  } >rom =0xFF
  /* __cs3_region_end_rom is deprecated */
  __cs3_region_end_rom = __cs3_region_start_rom + LENGTH(rom);
  __cs3_region_size_rom = LENGTH(rom);

  ASSERT (!(__cs3_region_init_ram & 7), "__cs3_region_init_ram not aligned")
  ASSERT (!(__cs3_region_start_ram & 7), "__cs3_region_start_ram not aligned")
  ASSERT (!(__cs3_region_init_size_ram & 7), "__cs3_region_init_size_ram not aligned")
  ASSERT (!(__cs3_region_zero_size_ram & 7), "__cs3_region_zero_size_ram not aligned")

  .data : ALIGN (8)
  {
    __cs3_region_start_ram = .;
    *(.cs3.region-head.ram)
    *(.ramfunc .ramfunc.*);
    KEEP(*(.jcr))
    *(.got.plt) *(.got)
    *(.shdata)
    *(.data .data.* .gnu.linkonce.d.*)
    . = ALIGN (8);
    *(.ram)
    . = ALIGN (8);
    _edata = .;
  } >ram AT>rom
  .bss : ALIGN (8)
  {
    *(.shbss)
    *(.bss .bss.* .gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN (8);
    *(.ram.b .bss.ram)
    . = ALIGN (8);
    _end = .;
    __end = .;
  } >ram AT>rom
  /* __cs3_region_end_ram is deprecated */
  __cs3_region_size_ram = LENGTH(ram); /* - __bitbanding_region_init_size_ram;*/
  __cs3_region_init_ram = LOADADDR (.data);
  __cs3_region_init_size_ram = _edata - ADDR (.data);
  __cs3_region_zero_size_ram = _end - _edata;

  .stab 0 (NOLOAD) : { *(.stab) }
  .stabstr 0 (NOLOAD) : { *(.stabstr) }
  /* DWARF debug sections.
   * Symbols in the DWARF debugging sections are relative to
   * the beginning of the section so we begin them at 0.
   */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* DWARF 2.1 */
  .debug_ranges   0 : { *(.debug_ranges) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }

  .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) }
}
