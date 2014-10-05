GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.5/fs/notify/dnotify/dnotify.o...done.
(gdb) Dump of assembler code for function dnotify_flush:
   0x000000000000010c <+0>:	push   %r12
   0x000000000000010e <+2>:	mov    %rsi,%r12
   0x0000000000000111 <+5>:	push   %rbp
   0x0000000000000112 <+6>:	mov    %rdi,%rbp
   0x0000000000000115 <+9>:	push   %rbx
   0x0000000000000116 <+10>:	mov    0x18(%rdi),%rax
   0x000000000000011a <+14>:	mov    0x30(%rax),%rsi
   0x000000000000011e <+18>:	mov    (%rsi),%eax
   0x0000000000000120 <+20>:	and    $0xf000,%ax
   0x0000000000000124 <+24>:	cmp    $0x4000,%ax
   0x0000000000000128 <+28>:	jne    0x1c1 <dnotify_flush+181>
   0x000000000000012e <+34>:	mov    0x0(%rip),%rdi        # 0x135 <dnotify_flush+41>
   0x0000000000000135 <+41>:	callq  0x13a <dnotify_flush+46>
   0x000000000000013a <+46>:	test   %rax,%rax
   0x000000000000013d <+49>:	mov    %rax,%rbx
   0x0000000000000140 <+52>:	je     0x1c1 <dnotify_flush+181>
   0x0000000000000142 <+54>:	mov    $0x0,%rdi
   0x0000000000000149 <+61>:	callq  0x14e <dnotify_flush+66>
   0x000000000000014e <+66>:	lea    0x20(%rbx),%rdi
   0x0000000000000152 <+70>:	callq  0x157 <dnotify_flush+75>
   0x0000000000000157 <+75>:	lea    0x80(%rbx),%rdx
   0x000000000000015e <+82>:	jmp    0x18b <dnotify_flush+127>
   0x0000000000000160 <+84>:	cmp    %r12,0x18(%rsi)
   0x0000000000000164 <+88>:	jne    0x188 <dnotify_flush+124>
   0x0000000000000166 <+90>:	cmp    %rbp,0x10(%rsi)
   0x000000000000016a <+94>:	jne    0x188 <dnotify_flush+124>
   0x000000000000016c <+96>:	mov    (%rsi),%rcx
   0x000000000000016f <+99>:	mov    0x0(%rip),%rdi        # 0x176 <dnotify_flush+106>
   0x0000000000000176 <+106>:	mov    %rcx,(%rdx)
   0x0000000000000179 <+109>:	callq  0x17e <dnotify_flush+114>
   0x000000000000017e <+114>:	mov    %rbx,%rdi
   0x0000000000000181 <+117>:	callq  0x29 <dnotify_recalc_inode_mask>
   0x0000000000000186 <+122>:	jmp    0x193 <dnotify_flush+135>
   0x0000000000000188 <+124>:	mov    %rsi,%rdx
   0x000000000000018b <+127>:	mov    (%rdx),%rsi
   0x000000000000018e <+130>:	test   %rsi,%rsi
   0x0000000000000191 <+133>:	jne    0x160 <dnotify_flush+84>
   0x0000000000000193 <+135>:	addb   $0x1,0x20(%rbx)
   0x0000000000000197 <+139>:	cmpq   $0x0,0x80(%rbx)
   0x000000000000019f <+147>:	jne    0x1a9 <dnotify_flush+157>
   0x00000000000001a1 <+149>:	mov    %rbx,%rdi
   0x00000000000001a4 <+152>:	callq  0x1a9 <dnotify_flush+157>
   0x00000000000001a9 <+157>:	mov    $0x0,%rdi
   0x00000000000001b0 <+164>:	callq  0x1b5 <dnotify_flush+169>
   0x00000000000001b5 <+169>:	mov    %rbx,%rdi
   0x00000000000001b8 <+172>:	pop    %rbx
   0x00000000000001b9 <+173>:	pop    %rbp
   0x00000000000001ba <+174>:	pop    %r12
   0x00000000000001bc <+176>:	jmpq   0x1c1 <dnotify_flush+181>
   0x00000000000001c1 <+181>:	pop    %rbx
   0x00000000000001c2 <+182>:	pop    %rbp
   0x00000000000001c3 <+183>:	pop    %r12
   0x00000000000001c5 <+185>:	retq   
End of assembler dump.
(gdb) quit
