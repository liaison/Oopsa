GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.4/drivers/gpu/drm/drm_hashtab.o...done.
(gdb) Dump of assembler code for function drm_ht_remove_item:
   0x000000000000011f <+0>:	mov    %rsi,%rdi
   0x0000000000000122 <+3>:	callq  0x0 <hlist_del_init>
   0x0000000000000127 <+8>:	xor    %eax,%eax
   0x0000000000000129 <+10>:	retq   
End of assembler dump.
(gdb) quit
