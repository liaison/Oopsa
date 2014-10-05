GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.6/drivers/gpu/drm/udl/udl_connector.o...done.
(gdb) Dump of assembler code for function udl_get_modes:
   0x0000000000000077 <+0>:	push   %r14
   0x0000000000000079 <+2>:	mov    $0x80,%edx
   0x000000000000007e <+7>:	mov    $0xd0,%esi
   0x0000000000000083 <+12>:	push   %r13
   0x0000000000000085 <+14>:	mov    %rdi,%r13
   0x0000000000000088 <+17>:	push   %r12
   0x000000000000008a <+19>:	push   %rbp
   0x000000000000008b <+20>:	push   %rbx
   0x000000000000008c <+21>:	sub    $0x30,%rsp
   0x0000000000000090 <+25>:	mov    (%rdi),%rax
   0x0000000000000093 <+28>:	mov    0x0(%rip),%rdi        # 0x9a <udl_get_modes+35>
   0x000000000000009a <+35>:	mov    0x330(%rax),%r14
   0x00000000000000a1 <+42>:	callq  0xa6 <udl_get_modes+47>
   0x00000000000000a6 <+47>:	mov    %rax,%rbx
   0x00000000000000a9 <+50>:	add    $0x8,%r14
   0x00000000000000ad <+54>:	test   %rax,%rax
   0x00000000000000b0 <+57>:	je     0x175 <udl_get_modes+254>
   0x00000000000000b6 <+63>:	mov    0x0(%rip),%rdi        # 0xbd <udl_get_modes+70>
   0x00000000000000bd <+70>:	mov    $0x2,%edx
   0x00000000000000c2 <+75>:	mov    $0xd0,%esi
   0x00000000000000c7 <+80>:	callq  0xcc <udl_get_modes+85>
   0x00000000000000cc <+85>:	test   %rax,%rax
   0x00000000000000cf <+88>:	mov    %rax,%r12
   0x00000000000000d2 <+91>:	je     0x163 <udl_get_modes+236>
   0x00000000000000d8 <+97>:	xor    %ebp,%ebp
   0x00000000000000da <+99>:	mov    (%r14),%rax
   0x00000000000000dd <+102>:	mov    %ebp,%r8d
   0x00000000000000e0 <+105>:	mov    $0xa1,%r9d
   0x00000000000000e6 <+111>:	shl    $0x8,%r8d
   0x00000000000000ea <+115>:	mov    $0xc0,%ecx
   0x00000000000000ef <+120>:	mov    $0x2,%edx
   0x00000000000000f4 <+125>:	and    $0xff00,%r8d
   0x00000000000000fb <+132>:	mov    0x318(%rax),%rdi
   0x0000000000000102 <+139>:	mov    (%rdi),%esi
   0x0000000000000104 <+141>:	movl   $0xfa,0x10(%rsp)
   0x000000000000010c <+149>:	movl   $0x2,0x8(%rsp)
   0x0000000000000114 <+157>:	mov    %r12,(%rsp)
   0x0000000000000118 <+161>:	shl    $0x8,%esi
   0x000000000000011b <+164>:	or     $0x80000080,%esi
   0x0000000000000121 <+170>:	callq  0x126 <udl_get_modes+175>
   0x0000000000000126 <+175>:	test   %eax,%eax
   0x0000000000000128 <+177>:	jg     0x145 <udl_get_modes+206>
   0x000000000000012a <+179>:	mov    %eax,%ecx
   0x000000000000012c <+181>:	mov    %ebp,%edx
   0x000000000000012e <+183>:	mov    $0x0,%rsi
   0x0000000000000135 <+190>:	mov    $0x0,%rdi
   0x000000000000013c <+197>:	xor    %eax,%eax
   0x000000000000013e <+199>:	callq  0x143 <udl_get_modes+204>
   0x0000000000000143 <+204>:	jmp    0x163 <udl_get_modes+236>
   0x0000000000000145 <+206>:	mov    0x1(%r12),%al
   0x000000000000014a <+211>:	mov    %al,(%rbx,%rbp,1)
   0x000000000000014d <+214>:	inc    %rbp
   0x0000000000000150 <+217>:	cmp    $0x80,%rbp
   0x0000000000000157 <+224>:	jne    0xda <udl_get_modes+99>
   0x0000000000000159 <+226>:	mov    %r12,%rdi
   0x000000000000015c <+229>:	callq  0x161 <udl_get_modes+234>
   0x0000000000000161 <+234>:	jmp    0x175 <udl_get_modes+254>
   0x0000000000000163 <+236>:	mov    %rbx,%rdi
   0x0000000000000166 <+239>:	xor    %ebx,%ebx
   0x0000000000000168 <+241>:	callq  0x16d <udl_get_modes+246>
   0x000000000000016d <+246>:	mov    %r12,%rdi
   0x0000000000000170 <+249>:	callq  0x175 <udl_get_modes+254>
   0x0000000000000175 <+254>:	mov    0x7e(%rbx),%al
   0x0000000000000178 <+257>:	add    %al,0x7f(%rbx)
   0x000000000000017b <+260>:	mov    %rbx,%rsi
   0x000000000000017e <+263>:	mov    %r13,%rdi
   0x0000000000000181 <+266>:	movb   $0x0,0x7e(%rbx)
   0x0000000000000185 <+270>:	callq  0x18a <udl_get_modes+275>
   0x000000000000018a <+275>:	mov    %rbx,%rsi
   0x000000000000018d <+278>:	mov    %r13,%rdi
   0x0000000000000190 <+281>:	callq  0x195 <udl_get_modes+286>
   0x0000000000000195 <+286>:	mov    %rbx,%rdi
   0x0000000000000198 <+289>:	mov    %eax,0x28(%rsp)
   0x000000000000019c <+293>:	callq  0x1a1 <udl_get_modes+298>
   0x00000000000001a1 <+298>:	mov    0x28(%rsp),%eax
   0x00000000000001a5 <+302>:	add    $0x30,%rsp
   0x00000000000001a9 <+306>:	pop    %rbx
   0x00000000000001aa <+307>:	pop    %rbp
   0x00000000000001ab <+308>:	pop    %r12
   0x00000000000001ad <+310>:	pop    %r13
   0x00000000000001af <+312>:	pop    %r14
   0x00000000000001b1 <+314>:	retq   
End of assembler dump.
(gdb) quit
