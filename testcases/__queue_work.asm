GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.6.10/kernel/workqueue.o...done.
(gdb) Dump of assembler code for function __queue_work:
   0x00000000000029ce <+0>:	push   %r15
   0x00000000000029d0 <+2>:	mov    %edi,%r15d
   0x00000000000029d3 <+5>:	push   %r14
   0x00000000000029d5 <+7>:	mov    %rsi,%r14
   0x00000000000029d8 <+10>:	push   %r13
   0x00000000000029da <+12>:	push   %r12
   0x00000000000029dc <+14>:	mov    %rdx,%r12
   0x00000000000029df <+17>:	push   %rbp
   0x00000000000029e0 <+18>:	push   %rbx
   0x00000000000029e1 <+19>:	sub    $0x18,%rsp
   0x00000000000029e5 <+23>:	testb  $0x40,(%rsi)
   0x00000000000029e8 <+26>:	je     0x2ab6 <__queue_work+232>
   0x00000000000029ee <+32>:	mov    0x0(%rip),%rsi        # 0x29f5 <__queue_work+39>
   0x00000000000029f5 <+39>:	mov    $0x3,%edx
   0x00000000000029fa <+44>:	or     $0xffffffff,%edi
   0x00000000000029fd <+47>:	mov    %gs:0x0,%r13
   0x0000000000002a06 <+56>:	callq  0x829 <__next_gcwq_cpu>
   0x0000000000002a0b <+61>:	mov    %eax,%ebx
   0x0000000000002a0d <+63>:	jmp    0x2a87 <__queue_work+185>
   0x0000000000002a0f <+65>:	mov    %ebx,%edi
   0x0000000000002a11 <+67>:	callq  0x2d <get_gcwq>
   0x0000000000002a16 <+72>:	mov    %rax,%rdi
   0x0000000000002a19 <+75>:	mov    %rax,%rbp
   0x0000000000002a1c <+78>:	callq  0x2a21 <__queue_work+83>
   0x0000000000002a21 <+83>:	xor    %edi,%edi
   0x0000000000002a23 <+85>:	mov    %rax,%rsi
   0x0000000000002a26 <+88>:	mov    0x10(%rbp,%rdi,1),%rdx
   0x0000000000002a2b <+93>:	jmp    0x2a50 <__queue_work+130>
   0x0000000000002a2d <+95>:	mov    (%rdx),%rdx
   0x0000000000002a30 <+98>:	jmp    0x2a50 <__queue_work+130>
   0x0000000000002a32 <+100>:	mov    %rbp,%rdi
   0x0000000000002a35 <+103>:	mov    %rdx,0x8(%rsp)
   0x0000000000002a3a <+108>:	callq  0x2a3f <__queue_work+113>
   0x0000000000002a3f <+113>:	mov    0x8(%rsp),%rdx
   0x0000000000002a44 <+118>:	mov    0x18(%rdx),%rax
   0x0000000000002a48 <+122>:	cmp    %r14,0x8(%rax)
   0x0000000000002a4c <+126>:	je     0x2ab6 <__queue_work+232>
   0x0000000000002a4e <+128>:	jmp    0x2a8c <__queue_work+190>
   0x0000000000002a50 <+130>:	test   %rdx,%rdx
   0x0000000000002a53 <+133>:	je     0x2a5d <__queue_work+143>
   0x0000000000002a55 <+135>:	cmp    %r13,0x30(%rdx)
   0x0000000000002a59 <+139>:	jne    0x2a2d <__queue_work+95>
   0x0000000000002a5b <+141>:	jmp    0x2a32 <__queue_work+100>
   0x0000000000002a5d <+143>:	add    $0x8,%rdi
   0x0000000000002a61 <+147>:	cmp    $0x200,%rdi
   0x0000000000002a68 <+154>:	jne    0x2a26 <__queue_work+88>
   0x0000000000002a6a <+156>:	mov    %rbp,%rdi
   0x0000000000002a6d <+159>:	callq  0x2a72 <__queue_work+164>
   0x0000000000002a72 <+164>:	mov    0x0(%rip),%rsi        # 0x2a79 <__queue_work+171>
   0x0000000000002a79 <+171>:	mov    %ebx,%edi
   0x0000000000002a7b <+173>:	mov    $0x3,%edx
   0x0000000000002a80 <+178>:	callq  0x829 <__next_gcwq_cpu>
   0x0000000000002a85 <+183>:	mov    %eax,%ebx
   0x0000000000002a87 <+185>:	cmp    $0x8,%ebx
   0x0000000000002a8a <+188>:	jbe    0x2a0f <__queue_work+65>
   0x0000000000002a8c <+190>:	cmpb   $0x0,0x0(%rip)        # 0x2a93 <__queue_work+197>
   0x0000000000002a93 <+197>:	jne    0x2c12 <__queue_work+580>
   0x0000000000002a99 <+203>:	mov    $0x3df,%esi
   0x0000000000002a9e <+208>:	mov    $0x0,%rdi
   0x0000000000002aa5 <+215>:	callq  0x2aaa <__queue_work+220>
   0x0000000000002aaa <+220>:	movb   $0x1,0x0(%rip)        # 0x2ab1 <__queue_work+227>
   0x0000000000002ab1 <+227>:	jmpq   0x2c12 <__queue_work+580>
   0x0000000000002ab6 <+232>:	mov    (%r14),%ebx
   0x0000000000002ab9 <+235>:	test   $0x2,%bl
   0x0000000000002abc <+238>:	jne    0x2b2f <__queue_work+353>
   0x0000000000002abe <+240>:	cmp    $0x8,%r15d
   0x0000000000002ac2 <+244>:	jne    0x2acd <__queue_work+255>
   0x0000000000002ac4 <+246>:	mov    %gs:0x0,%r15d
   0x0000000000002acd <+255>:	mov    %r15d,%edi
   0x0000000000002ad0 <+258>:	callq  0x2d <get_gcwq>
   0x0000000000002ad5 <+263>:	and    $0x1,%bl
   0x0000000000002ad8 <+266>:	mov    %rax,%rbp
   0x0000000000002adb <+269>:	je     0x2b22 <__queue_work+340>
   0x0000000000002add <+271>:	mov    %r12,%rdi
   0x0000000000002ae0 <+274>:	callq  0x7e1 <get_work_gcwq>
   0x0000000000002ae5 <+279>:	test   %rax,%rax
   0x0000000000002ae8 <+282>:	mov    %rax,%rbx
   0x0000000000002aeb <+285>:	je     0x2b22 <__queue_work+340>
   0x0000000000002aed <+287>:	cmp    %rbp,%rax
   0x0000000000002af0 <+290>:	je     0x2b22 <__queue_work+340>
   0x0000000000002af2 <+292>:	mov    %rax,%rdi
   0x0000000000002af5 <+295>:	callq  0x2afa <__queue_work+300>
   0x0000000000002afa <+300>:	mov    %r12,%rsi
   0x0000000000002afd <+303>:	mov    %rbx,%rdi
   0x0000000000002b00 <+306>:	mov    %rax,%r13
   0x0000000000002b03 <+309>:	callq  0x2683 <find_worker_executing_work>
   0x0000000000002b08 <+314>:	test   %rax,%rax
   0x0000000000002b0b <+317>:	je     0x2b17 <__queue_work+329>
   0x0000000000002b0d <+319>:	mov    0x18(%rax),%rax
   0x0000000000002b11 <+323>:	cmp    %r14,0x8(%rax)
   0x0000000000002b15 <+327>:	je     0x2b47 <__queue_work+377>
   0x0000000000002b17 <+329>:	mov    %r13,%rsi
   0x0000000000002b1a <+332>:	mov    %rbx,%rdi
   0x0000000000002b1d <+335>:	callq  0x2b22 <__queue_work+340>
   0x0000000000002b22 <+340>:	mov    %rbp,%rdi
   0x0000000000002b25 <+343>:	callq  0x2b2a <__queue_work+348>
   0x0000000000002b2a <+348>:	mov    %rax,%r13
   0x0000000000002b2d <+351>:	jmp    0x2b4a <__queue_work+380>
   0x0000000000002b2f <+353>:	mov    $0x0,%rdi
   0x0000000000002b36 <+360>:	mov    $0x0,%rbp
   0x0000000000002b3d <+367>:	callq  0x2b42 <__queue_work+372>
   0x0000000000002b42 <+372>:	mov    %rax,%r13
   0x0000000000002b45 <+375>:	jmp    0x2b4a <__queue_work+380>
   0x0000000000002b47 <+377>:	mov    %rbx,%rbp
   0x0000000000002b4a <+380>:	mov    0x4(%rbp),%edi
   0x0000000000002b4d <+383>:	mov    %r14,%rsi
   0x0000000000002b50 <+386>:	callq  0x797 <get_cwq>
   0x0000000000002b55 <+391>:	mov    %rax,%rbx
   0x0000000000002b58 <+394>:	mov    0x0(%rip),%eax        # 0x2b5e <__queue_work+400>
   0x0000000000002b5e <+400>:	test   %eax,%eax
   0x0000000000002b60 <+402>:	jne    0x2be8 <__queue_work+538>
   0x0000000000002b66 <+408>:	lea    0x8(%r12),%rax
   0x0000000000002b6b <+413>:	cmp    %rax,0x8(%r12)
   0x0000000000002b70 <+418>:	je     0x2bf9 <__queue_work+555>
   0x0000000000002b76 <+424>:	jmp    0x2b92 <__queue_work+452>
   0x0000000000002b78 <+426>:	mov    0x8(%r14),%rdi
   0x0000000000002b7c <+430>:	mov    %r12,%rcx
   0x0000000000002b7f <+433>:	mov    %rbx,%rdx
   0x0000000000002b82 <+436>:	mov    %r15d,%esi
   0x0000000000002b85 <+439>:	callq  *(%r14)
   0x0000000000002b88 <+442>:	add    $0x10,%r14
   0x0000000000002b8c <+446>:	cmpq   $0x0,(%r14)
   0x0000000000002b90 <+450>:	jmp    0x2bf2 <__queue_work+548>
   0x0000000000002b92 <+452>:	mov    $0x40a,%esi
   0x0000000000002b97 <+457>:	mov    $0x0,%rdi
   0x0000000000002b9e <+464>:	callq  0x2ba3 <__queue_work+469>
   0x0000000000002ba3 <+469>:	jmp    0x2bcf <__queue_work+513>
   0x0000000000002ba5 <+471>:	mov    %r12,%rdi
   0x0000000000002ba8 <+474>:	callq  0x762 <trace_workqueue_activate_work>
   0x0000000000002bad <+479>:	mov    (%rbx),%rdx
   0x0000000000002bb0 <+482>:	incl   0x54(%rbx)
   0x0000000000002bb3 <+485>:	add    $0x10,%rdx
   0x0000000000002bb7 <+489>:	jmp    0x2bc1 <__queue_work+499>
   0x0000000000002bb9 <+491>:	lea    0x60(%rbx),%rdx
   0x0000000000002bbd <+495>:	or     $0x2,%r14d
   0x0000000000002bc1 <+499>:	mov    %r14d,%ecx
   0x0000000000002bc4 <+502>:	mov    %r12,%rsi
   0x0000000000002bc7 <+505>:	mov    %rbx,%rdi
   0x0000000000002bca <+508>:	callq  0x2139 <insert_work>
   0x0000000000002bcf <+513>:	add    $0x18,%rsp
   0x0000000000002bd3 <+517>:	mov    %rbp,%rdi
   0x0000000000002bd6 <+520>:	mov    %r13,%rsi
   0x0000000000002bd9 <+523>:	pop    %rbx
   0x0000000000002bda <+524>:	pop    %rbp
   0x0000000000002bdb <+525>:	pop    %r12
   0x0000000000002bdd <+527>:	pop    %r13
   0x0000000000002bdf <+529>:	pop    %r14
   0x0000000000002be1 <+531>:	pop    %r15
   0x0000000000002be3 <+533>:	jmpq   0x2be8 <__queue_work+538>
   0x0000000000002be8 <+538>:	mov    0x0(%rip),%r14        # 0x2bef <__queue_work+545>
   0x0000000000002bef <+545>:	test   %r14,%r14
   0x0000000000002bf2 <+548>:	jne    0x2b78 <__queue_work+426>
   0x0000000000002bf4 <+550>:	jmpq   0x2b66 <__queue_work+408>
   0x0000000000002bf9 <+555>:	mov    0x10(%rbx),%r14d
   0x0000000000002bfd <+559>:	movslq %r14d,%rax
   0x0000000000002c00 <+562>:	shl    $0x4,%r14d
   0x0000000000002c04 <+566>:	incl   0x18(%rbx,%rax,4)
   0x0000000000002c08 <+570>:	mov    0x58(%rbx),%eax
   0x0000000000002c0b <+573>:	cmp    %eax,0x54(%rbx)
   0x0000000000002c0e <+576>:	jl     0x2ba5 <__queue_work+471>
   0x0000000000002c10 <+578>:	jmp    0x2bb9 <__queue_work+491>
   0x0000000000002c12 <+580>:	add    $0x18,%rsp
   0x0000000000002c16 <+584>:	pop    %rbx
   0x0000000000002c17 <+585>:	pop    %rbp
   0x0000000000002c18 <+586>:	pop    %r12
   0x0000000000002c1a <+588>:	pop    %r13
   0x0000000000002c1c <+590>:	pop    %r14
   0x0000000000002c1e <+592>:	pop    %r15
   0x0000000000002c20 <+594>:	retq   
End of assembler dump.
(gdb) quit
