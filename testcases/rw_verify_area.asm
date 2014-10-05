GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.7/fs/read_write.o...done.
(gdb) Dump of assembler code for function rw_verify_area:
   0x00000000000005a6 <+0>:	push   %r12
   0x00000000000005a8 <+2>:	test   %rcx,%rcx
   0x00000000000005ab <+5>:	push   %rbp
   0x00000000000005ac <+6>:	mov    %rsi,%rbp
   0x00000000000005af <+9>:	push   %rbx
   0x00000000000005b0 <+10>:	mov    0x18(%rsi),%rax
   0x00000000000005b4 <+14>:	mov    %rcx,%rbx
   0x00000000000005b7 <+17>:	mov    0x30(%rax),%rsi
   0x00000000000005bb <+21>:	js     0x643 <rw_verify_area+157>
   0x00000000000005c1 <+27>:	mov    (%rdx),%rcx
   0x00000000000005c4 <+30>:	mov    %edi,%r12d
   0x00000000000005c7 <+33>:	test   %rcx,%rcx
   0x00000000000005ca <+36>:	jns    0x5df <rw_verify_area+57>
   0x00000000000005cc <+38>:	testb  $0x20,0x3d(%rbp)
   0x00000000000005d0 <+42>:	je     0x643 <rw_verify_area+157>
   0x00000000000005d2 <+44>:	mov    %rcx,%rax
   0x00000000000005d5 <+47>:	neg    %rax
   0x00000000000005d8 <+50>:	cmp    %rax,%rbx
   0x00000000000005db <+53>:	jb     0x5ed <rw_verify_area+71>
   0x00000000000005dd <+55>:	jmp    0x63c <rw_verify_area+150>
   0x00000000000005df <+57>:	mov    %rcx,%rax
   0x00000000000005e2 <+60>:	add    %rbx,%rax
   0x00000000000005e5 <+63>:	jns    0x5ed <rw_verify_area+71>
   0x00000000000005e7 <+65>:	testb  $0x20,0x3d(%rbp)
   0x00000000000005eb <+69>:	je     0x643 <rw_verify_area+157>
   0x00000000000005ed <+71>:	cmpq   $0x0,0x138(%rsi)
   0x00000000000005f5 <+79>:	jne    0x611 <rw_verify_area+107>
   0x00000000000005f7 <+81>:	cmp    $0x1,%r12d
   0x00000000000005fb <+85>:	mov    %rbp,%rdi
   0x00000000000005fe <+88>:	sbb    %esi,%esi
   0x0000000000000600 <+90>:	and    $0x2,%esi
   0x0000000000000603 <+93>:	add    $0x2,%esi
   0x0000000000000606 <+96>:	callq  0x60b <rw_verify_area+101>
   0x000000000000060b <+101>:	test   %eax,%eax
   0x000000000000060d <+103>:	je     0x62a <rw_verify_area+132>
   0x000000000000060f <+105>:	jmp    0x662 <rw_verify_area+188>
   0x0000000000000611 <+107>:	mov    0x28(%rsi),%rax
   0x0000000000000615 <+111>:	testb  $0x40,0x50(%rax)
   0x0000000000000619 <+115>:	je     0x5f7 <rw_verify_area+81>
   0x000000000000061b <+117>:	mov    (%rsi),%ax
   0x000000000000061e <+120>:	and    $0x408,%ax
   0x0000000000000622 <+124>:	cmp    $0x400,%ax
   0x0000000000000626 <+128>:	jne    0x5f7 <rw_verify_area+81>
   0x0000000000000628 <+130>:	jmp    0x64a <rw_verify_area+164>
   0x000000000000062a <+132>:	cmp    $0x7ffff000,%rbx
   0x0000000000000631 <+139>:	mov    $0x7ffff000,%eax
   0x0000000000000636 <+144>:	cmovbe %rbx,%rax
   0x000000000000063a <+148>:	jmp    0x662 <rw_verify_area+188>
   0x000000000000063c <+150>:	mov    $0xffffffb5,%eax
   0x0000000000000641 <+155>:	jmp    0x662 <rw_verify_area+188>
   0x0000000000000643 <+157>:	mov    $0xffffffea,%eax
   0x0000000000000648 <+162>:	jmp    0x662 <rw_verify_area+188>
   0x000000000000064a <+164>:	cmp    $0x1,%r12d
   0x000000000000064e <+168>:	mov    %rbx,%r8
   0x0000000000000651 <+171>:	mov    %rbp,%rdx
   0x0000000000000654 <+174>:	sbb    %edi,%edi
   0x0000000000000656 <+176>:	add    $0x2,%edi
   0x0000000000000659 <+179>:	callq  0x65e <rw_verify_area+184>
   0x000000000000065e <+184>:	test   %eax,%eax
   0x0000000000000660 <+186>:	jns    0x5f7 <rw_verify_area+81>
   0x0000000000000662 <+188>:	pop    %rbx
   0x0000000000000663 <+189>:	pop    %rbp
   0x0000000000000664 <+190>:	pop    %r12
   0x0000000000000666 <+192>:	retq   
End of assembler dump.
(gdb) quit
