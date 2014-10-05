GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.4/fs/dcache.o...done.
(gdb) Dump of assembler code for function d_path:
   0x0000000000000e5c <+0>:	push   %r12
   0x0000000000000e5e <+2>:	movslq %edx,%rax
   0x0000000000000e61 <+5>:	add    %rsi,%rax
   0x0000000000000e64 <+8>:	push   %rbp
   0x0000000000000e65 <+9>:	mov    %rdi,%rbp
   0x0000000000000e68 <+12>:	push   %rbx
   0x0000000000000e69 <+13>:	sub    $0x30,%rsp
   0x0000000000000e6d <+17>:	mov    0x8(%rdi),%rdi
   0x0000000000000e71 <+21>:	mov    %rax,0x18(%rsp)
   0x0000000000000e76 <+26>:	mov    %edx,0xc(%rsp)
   0x0000000000000e7a <+30>:	mov    0x60(%rdi),%rax
   0x0000000000000e7e <+34>:	test   %rax,%rax
   0x0000000000000e81 <+37>:	je     0xe90 <d_path+52>
   0x0000000000000e83 <+39>:	mov    0x38(%rax),%rax
   0x0000000000000e87 <+43>:	test   %rax,%rax
   0x0000000000000e8a <+46>:	je     0xe90 <d_path+52>
   0x0000000000000e8c <+48>:	callq  *%rax
   0x0000000000000e8e <+50>:	jmp    0xf0b <d_path+175>
   0x0000000000000e90 <+52>:	mov    %gs:0x0,%rax
   0x0000000000000e99 <+61>:	mov    0x438(%rax),%rbx
   0x0000000000000ea0 <+68>:	lea    0x4(%rbx),%r12
   0x0000000000000ea4 <+72>:	mov    %r12,%rdi
   0x0000000000000ea7 <+75>:	callq  0x7f <spin_lock>
   0x0000000000000eac <+80>:	mov    0x18(%rbx),%rax
   0x0000000000000eb0 <+84>:	lea    0x20(%rsp),%rdi
   0x0000000000000eb5 <+89>:	mov    %rax,0x20(%rsp)
   0x0000000000000eba <+94>:	mov    0x20(%rbx),%rax
   0x0000000000000ebe <+98>:	mov    %rax,0x28(%rsp)
   0x0000000000000ec3 <+103>:	callq  0xec8 <d_path+108>
   0x0000000000000ec8 <+108>:	mov    %r12,%rdi
   0x0000000000000ecb <+111>:	callq  0x59 <spin_unlock>
   0x0000000000000ed0 <+116>:	callq  0x7d6 <write_seqlock>
   0x0000000000000ed5 <+121>:	lea    0xc(%rsp),%rcx
   0x0000000000000eda <+126>:	lea    0x18(%rsp),%rdx
   0x0000000000000edf <+131>:	lea    0x20(%rsp),%rsi
   0x0000000000000ee4 <+136>:	mov    %rbp,%rdi
   0x0000000000000ee7 <+139>:	callq  0xde3 <path_with_deleted>
   0x0000000000000eec <+144>:	test   %eax,%eax
   0x0000000000000eee <+146>:	jns    0xef7 <d_path+155>
   0x0000000000000ef0 <+148>:	cltq   
   0x0000000000000ef2 <+150>:	mov    %rax,0x18(%rsp)
   0x0000000000000ef7 <+155>:	callq  0x7a5 <write_sequnlock>
   0x0000000000000efc <+160>:	lea    0x20(%rsp),%rdi
   0x0000000000000f01 <+165>:	callq  0xf06 <d_path+170>
   0x0000000000000f06 <+170>:	mov    0x18(%rsp),%rax
   0x0000000000000f0b <+175>:	add    $0x30,%rsp
   0x0000000000000f0f <+179>:	pop    %rbx
   0x0000000000000f10 <+180>:	pop    %rbp
   0x0000000000000f11 <+181>:	pop    %r12
   0x0000000000000f13 <+183>:	retq   
End of assembler dump.
(gdb) quit
