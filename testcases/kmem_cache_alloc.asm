GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.6.11/vmlinux...done.
(gdb) Dump of assembler code for function kmem_cache_alloc:
   0xffffffff810dbbe8 <+0>:	push   %r15
   0xffffffff810dbbea <+2>:	push   %r14
   0xffffffff810dbbec <+4>:	push   %r13
   0xffffffff810dbbee <+6>:	mov    %esi,%r13d
   0xffffffff810dbbf1 <+9>:	push   %r12
   0xffffffff810dbbf3 <+11>:	push   %rbp
   0xffffffff810dbbf4 <+12>:	mov    %rdi,%rbp
   0xffffffff810dbbf7 <+15>:	push   %rbx
   0xffffffff810dbbf8 <+16>:	push   %r8
   0xffffffff810dbbfa <+18>:	mov    0x593e37(%rip),%r12d        # 0xffffffff8166fa38
   0xffffffff810dbc01 <+25>:	and    %esi,%r12d
   0xffffffff810dbc04 <+28>:	mov    %r12d,%edi
   0xffffffff810dbc07 <+31>:	callq  0xffffffff810da4c1 <cache_alloc_debugcheck_before>
   0xffffffff810dbc0c <+36>:	callq  0xffffffff810da1d0 <arch_local_save_flags>
   0xffffffff810dbc11 <+41>:	mov    %rax,%r14
   0xffffffff810dbc14 <+44>:	callq  0xffffffff810da1e0 <arch_local_irq_disable>
   0xffffffff810dbc19 <+49>:	mov    %r12d,%esi
   0xffffffff810dbc1c <+52>:	mov    %rbp,%rdi
   0xffffffff810dbc1f <+55>:	callq  0xffffffff810dafa8 <____cache_alloc>
   0xffffffff810dbc24 <+60>:	mov    %r14,%rdi
   0xffffffff810dbc27 <+63>:	mov    %rax,%rbx
   0xffffffff810dbc2a <+66>:	callq  0xffffffff810da1d8 <arch_local_irq_restore>
   0xffffffff810dbc2f <+71>:	mov    %rbx,%rdi
   0xffffffff810dbc32 <+74>:	callq  0xffffffff810da1f0 <prefetchw>
   0xffffffff810dbc37 <+79>:	and    $0x8000,%r12d
   0xffffffff810dbc3e <+86>:	je     0xffffffff810dbc50 <kmem_cache_alloc+104>
   0xffffffff810dbc40 <+88>:	test   %rbx,%rbx
   0xffffffff810dbc43 <+91>:	je     0xffffffff810dbc50 <kmem_cache_alloc+104>
   0xffffffff810dbc45 <+93>:	movslq 0x6c(%rbp),%rcx
   0xffffffff810dbc49 <+97>:	xor    %eax,%eax
   0xffffffff810dbc4b <+99>:	mov    %rbx,%rdi
   0xffffffff810dbc4e <+102>:	rep stos %al,%es:(%rdi)
   0xffffffff810dbc50 <+104>:	mov    0x590612(%rip),%eax        # 0xffffffff8166c268
   0xffffffff810dbc56 <+110>:	mov    0xc(%rbp),%r14d
   0xffffffff810dbc5a <+114>:	movslq 0x6c(%rbp),%r12
   0xffffffff810dbc5e <+118>:	mov    0x38(%rsp),%r15
   0xffffffff810dbc63 <+123>:	test   %eax,%eax
   0xffffffff810dbc65 <+125>:	je     0xffffffff810dbc96 <kmem_cache_alloc+174>
   0xffffffff810dbc67 <+127>:	jmp    0xffffffff810dbc8a <kmem_cache_alloc+162>
   0xffffffff810dbc69 <+129>:	mov    0x8(%rbp),%rdi
   0xffffffff810dbc6d <+133>:	mov    %r13d,%r9d
   0xffffffff810dbc70 <+136>:	mov    %r14d,%r8d
   0xffffffff810dbc73 <+139>:	mov    %r12,%rcx
   0xffffffff810dbc76 <+142>:	mov    %rbx,%rdx
   0xffffffff810dbc79 <+145>:	mov    %r15,%rsi
   0xffffffff810dbc7c <+148>:	callq  *0x0(%rbp)
   0xffffffff810dbc7f <+151>:	add    $0x10,%rbp
   0xffffffff810dbc83 <+155>:	cmpq   $0x0,0x0(%rbp)
   0xffffffff810dbc88 <+160>:	jmp    0xffffffff810dbc94 <kmem_cache_alloc+172>
   0xffffffff810dbc8a <+162>:	mov    0x5905ef(%rip),%rbp        # 0xffffffff8166c280
   0xffffffff810dbc91 <+169>:	test   %rbp,%rbp
   0xffffffff810dbc94 <+172>:	jne    0xffffffff810dbc69 <kmem_cache_alloc+129>
   0xffffffff810dbc96 <+174>:	pop    %rsi
   0xffffffff810dbc97 <+175>:	mov    %rbx,%rax
   0xffffffff810dbc9a <+178>:	pop    %rbx
   0xffffffff810dbc9b <+179>:	pop    %rbp
   0xffffffff810dbc9c <+180>:	pop    %r12
   0xffffffff810dbc9e <+182>:	pop    %r13
   0xffffffff810dbca0 <+184>:	pop    %r14
   0xffffffff810dbca2 <+186>:	pop    %r15
   0xffffffff810dbca4 <+188>:	retq   
End of assembler dump.
(gdb) quit
