GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.5/security/selinux/hooks.o...done.
(gdb) Dump of assembler code for function selinux_socket_recvmsg:
   0x0000000000000317 <+0>:	mov    0x20(%rdi),%rsi
   0x000000000000031b <+4>:	mov    $0x2,%edx
   0x0000000000000320 <+9>:	mov    %gs:0x0,%rax
   0x0000000000000329 <+18>:	mov    %rax,%rdi
   0x000000000000032c <+21>:	jmpq   0x212 <sock_has_perm>
End of assembler dump.
(gdb) quit
