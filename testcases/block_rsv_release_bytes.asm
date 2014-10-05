GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.5/fs/btrfs/extent-tree.o...done.
(gdb) Dump of assembler code for function block_rsv_release_bytes:
   0x0000000000000830 <+0>:	push   %r15
   0x0000000000000832 <+2>:	lea    0x18(%rsi),%r15
   0x0000000000000836 <+6>:	push   %r14
   0x0000000000000838 <+8>:	mov    %rdi,%r14
   0x000000000000083b <+11>:	mov    %r15,%rdi
   0x000000000000083e <+14>:	push   %r13
   0x0000000000000840 <+16>:	push   %r12
   0x0000000000000842 <+18>:	mov    %rdx,%r12
   0x0000000000000845 <+21>:	push   %rbp
   0x0000000000000846 <+22>:	mov    %rsi,%rbp
   0x0000000000000849 <+25>:	push   %rbx
   0x000000000000084a <+26>:	mov    %rcx,%rbx
   0x000000000000084d <+29>:	push   %r13
   0x000000000000084f <+31>:	mov    0x10(%rsi),%r13
   0x0000000000000853 <+35>:	callq  0x161 <spin_lock>
   0x0000000000000858 <+40>:	mov    0x0(%rbp),%rax
   0x000000000000085c <+44>:	cmp    $0xffffffffffffffff,%rbx
   0x0000000000000860 <+48>:	mov    0x8(%rbp),%rdx
   0x0000000000000864 <+52>:	cmove  %rax,%rbx
   0x0000000000000868 <+56>:	sub    %rbx,%rax
   0x000000000000086b <+59>:	xor    %ebx,%ebx
   0x000000000000086d <+61>:	cmp    %rax,%rdx
   0x0000000000000870 <+64>:	mov    %rax,0x0(%rbp)
   0x0000000000000874 <+68>:	jb     0x886 <block_rsv_release_bytes+86>
   0x0000000000000876 <+70>:	mov    %rdx,%rbx
   0x0000000000000879 <+73>:	mov    %rax,0x8(%rbp)
   0x000000000000087d <+77>:	movw   $0x1,0x1a(%rbp)
   0x0000000000000883 <+83>:	sub    %rax,%rbx
   0x0000000000000886 <+86>:	mov    %r15,%rdi
   0x0000000000000889 <+89>:	callq  0x13 <spin_unlock>
   0x000000000000088e <+94>:	test   %rbx,%rbx
   0x0000000000000891 <+97>:	je     0x931 <block_rsv_release_bytes+257>
   0x0000000000000897 <+103>:	test   %r12,%r12
   0x000000000000089a <+106>:	je     0x8ed <block_rsv_release_bytes+189>
   0x000000000000089c <+108>:	lea    0x18(%r12),%rbp
   0x00000000000008a1 <+113>:	mov    %rbp,%rdi
   0x00000000000008a4 <+116>:	callq  0x161 <spin_lock>
   0x00000000000008a9 <+121>:	cmpw   $0x0,0x1a(%r12)
   0x00000000000008b0 <+128>:	jne    0x8e0 <block_rsv_release_bytes+176>
   0x00000000000008b2 <+130>:	mov    (%r12),%rdx
   0x00000000000008b6 <+134>:	mov    0x8(%r12),%rcx
   0x00000000000008bb <+139>:	mov    %rdx,%rax
   0x00000000000008be <+142>:	sub    %rcx,%rax
   0x00000000000008c1 <+145>:	cmp    %rax,%rbx
   0x00000000000008c4 <+148>:	cmovbe %rbx,%rax
   0x00000000000008c8 <+152>:	add    %rax,%rcx
   0x00000000000008cb <+155>:	cmp    %rdx,%rcx
   0x00000000000008ce <+158>:	mov    %rcx,0x8(%r12)
   0x00000000000008d3 <+163>:	jb     0x8dd <block_rsv_release_bytes+173>
   0x00000000000008d5 <+165>:	movw   $0x1,0x1a(%r12)
   0x00000000000008dd <+173>:	sub    %rax,%rbx
   0x00000000000008e0 <+176>:	mov    %rbp,%rdi
   0x00000000000008e3 <+179>:	callq  0x13 <spin_unlock>
   0x00000000000008e8 <+184>:	test   %rbx,%rbx
   0x00000000000008eb <+187>:	je     0x931 <block_rsv_release_bytes+257>
   0x00000000000008ed <+189>:	lea    0xb8(%r13),%rbp
   0x00000000000008f4 <+196>:	mov    %rbp,%rdi
   0x00000000000008f7 <+199>:	callq  0x161 <spin_lock>
   0x00000000000008fc <+204>:	sub    %rbx,0x30(%r13)
   0x0000000000000900 <+208>:	mov    0x0(%r13),%rdx
   0x0000000000000904 <+212>:	mov    %r14,%rdi
   0x0000000000000907 <+215>:	mov    %rbx,%rcx
   0x000000000000090a <+218>:	xor    %r8d,%r8d
   0x000000000000090d <+221>:	mov    $0x0,%rsi
   0x0000000000000914 <+228>:	callq  0x7d2 <trace_btrfs_space_reservation>
   0x0000000000000919 <+233>:	incq   0x48(%r13)
   0x000000000000091d <+237>:	mov    %rbp,%rdi
   0x0000000000000920 <+240>:	pop    %r12
   0x0000000000000922 <+242>:	pop    %rbx
   0x0000000000000923 <+243>:	pop    %rbp
   0x0000000000000924 <+244>:	pop    %r12
   0x0000000000000926 <+246>:	pop    %r13
   0x0000000000000928 <+248>:	pop    %r14
   0x000000000000092a <+250>:	pop    %r15
   0x000000000000092c <+252>:	jmpq   0x13 <spin_unlock>
   0x0000000000000931 <+257>:	pop    %rbp
   0x0000000000000932 <+258>:	pop    %rbx
   0x0000000000000933 <+259>:	pop    %rbp
   0x0000000000000934 <+260>:	pop    %r12
   0x0000000000000936 <+262>:	pop    %r13
   0x0000000000000938 <+264>:	pop    %r14
   0x000000000000093a <+266>:	pop    %r15
   0x000000000000093c <+268>:	retq   
End of assembler dump.
(gdb) quit
