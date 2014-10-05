GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.2/net/netfilter/nf_conntrack_core.o...done.
(gdb) Dump of assembler code for function destroy_conntrack:
   0x0000000000000c4b <+0>:	push   %rbp
   0x0000000000000c4c <+1>:	push   %rbx
   0x0000000000000c4d <+2>:	mov    %rdi,%rbx
   0x0000000000000c50 <+5>:	push   %rax
   0x0000000000000c51 <+6>:	mov    0xe8(%rdi),%rbp
   0x0000000000000c58 <+13>:	movzbl 0x3e(%rdi),%esi
   0x0000000000000c5c <+17>:	movzwl 0x2a(%rdi),%edi
   0x0000000000000c60 <+21>:	callq  0xc65 <destroy_conntrack+26>
   0x0000000000000c65 <+26>:	test   %rax,%rax
   0x0000000000000c68 <+29>:	je     0xc78 <destroy_conntrack+45>
   0x0000000000000c6a <+31>:	mov    0x28(%rax),%rax
   0x0000000000000c6e <+35>:	test   %rax,%rax
   0x0000000000000c71 <+38>:	je     0xc78 <destroy_conntrack+45>
   0x0000000000000c73 <+40>:	mov    %rbx,%rdi
   0x0000000000000c76 <+43>:	callq  *%rax
   0x0000000000000c78 <+45>:	mov    $0x0,%rdi
   0x0000000000000c7f <+52>:	callq  0xc84 <destroy_conntrack+57>
   0x0000000000000c84 <+57>:	mov    %rbx,%rdi
   0x0000000000000c87 <+60>:	callq  0xc8c <destroy_conntrack+65>
   0x0000000000000c8c <+65>:	mov    0x78(%rbx),%rax
   0x0000000000000c90 <+69>:	test   $0x8,%al
   0x0000000000000c92 <+71>:	jne    0xcb4 <destroy_conntrack+105>
   0x0000000000000c94 <+73>:	cmpq   $0x0,0x10(%rbx)
   0x0000000000000c99 <+78>:	jne    0xc9d <destroy_conntrack+82>
   0x0000000000000c9b <+80>:	ud2    
   0x0000000000000c9d <+82>:	lea    0x8(%rbx),%rdi
   0x0000000000000ca1 <+86>:	callq  0x10 <__hlist_nulls_del>
   0x0000000000000ca6 <+91>:	movabs $0xdead000000200200,%rax
   0x0000000000000cb0 <+101>:	mov    %rax,0x10(%rbx)
   0x0000000000000cb4 <+105>:	mov    $0x0,%rdi
   0x0000000000000cbb <+112>:	mov    0x660(%rbp),%rax
   0x0000000000000cc2 <+119>:	incl   %gs:0x14(%rax)
   0x0000000000000cc6 <+123>:	callq  0xccb <destroy_conntrack+128>
   0x0000000000000ccb <+128>:	mov    0x80(%rbx),%rdi
   0x0000000000000cd2 <+135>:	test   %rdi,%rdi
   0x0000000000000cd5 <+138>:	je     0xcdc <destroy_conntrack+145>
   0x0000000000000cd7 <+140>:	callq  0x109 <nf_ct_put>
   0x0000000000000cdc <+145>:	pop    %rax
   0x0000000000000cdd <+146>:	mov    %rbx,%rdi
   0x0000000000000ce0 <+149>:	pop    %rbx
   0x0000000000000ce1 <+150>:	pop    %rbp
   0x0000000000000ce2 <+151>:	jmpq   0xce7 <death_by_event>
End of assembler dump.
(gdb) quit
