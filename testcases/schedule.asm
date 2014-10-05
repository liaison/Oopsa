GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.2/kernel/sched/core.o...done.
(gdb) Dump of assembler code for function schedule:
   0x0000000000008e71 <+0>:	mov    %gs:0x0,%rax
   0x0000000000008e7a <+9>:	mov    (%rax),%rdx
   0x0000000000008e7d <+12>:	test   %rdx,%rdx
   0x0000000000008e80 <+15>:	je     0x8ecc <schedule+91>
   0x0000000000008e82 <+17>:	cmpq   $0x0,0x500(%rax)
   0x0000000000008e8a <+25>:	jne    0x8ecc <schedule+91>
   0x0000000000008e8c <+27>:	mov    0x518(%rax),%rdi
   0x0000000000008e93 <+34>:	test   %rdi,%rdi
   0x0000000000008e96 <+37>:	je     0x8eb3 <schedule+66>
   0x0000000000008e98 <+39>:	lea    0x8(%rdi),%rax
   0x0000000000008e9c <+43>:	cmp    %rax,0x8(%rdi)
   0x0000000000008ea0 <+47>:	je     0x8ea9 <schedule+56>
   0x0000000000008ea2 <+49>:	mov    $0x1,%eax
   0x0000000000008ea7 <+54>:	jmp    0x8eb5 <schedule+68>
   0x0000000000008ea9 <+56>:	lea    0x18(%rdi),%rax
   0x0000000000008ead <+60>:	cmp    %rax,0x18(%rdi)
   0x0000000000008eb1 <+64>:	jne    0x8ea2 <schedule+49>
   0x0000000000008eb3 <+66>:	xor    %eax,%eax
   0x0000000000008eb5 <+68>:	test   %eax,%eax
   0x0000000000008eb7 <+70>:	je     0x8ecc <schedule+91>
   0x0000000000008eb9 <+72>:	test   %rdi,%rdi
   0x0000000000008ebc <+75>:	je     0x8ecc <schedule+91>
   0x0000000000008ebe <+77>:	push   %r8
   0x0000000000008ec0 <+79>:	mov    $0x1,%esi
   0x0000000000008ec5 <+84>:	callq  0x8eca <schedule+89>
   0x0000000000008eca <+89>:	pop    %r9
   0x0000000000008ecc <+91>:	jmpq   0x8796 <__schedule>
End of assembler dump.
(gdb) quit
