GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.4/block/partition-generic.o...done.
(gdb) Dump of assembler code for function bdevname:
   0x00000000000005d1 <+0>:	mov    0x80(%rdi),%rax
   0x00000000000005d8 <+7>:	mov    %rsi,%rdx
   0x00000000000005db <+10>:	mov    0x90(%rdi),%rdi
   0x00000000000005e2 <+17>:	mov    0x2b4(%rax),%esi
   0x00000000000005e8 <+23>:	jmpq   0x5ed <__delete_partition>
End of assembler dump.
(gdb) quit
