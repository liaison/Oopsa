GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.5/fs/udf/super.o...done.
(gdb) Dump of assembler code for function udf_sb_free_partitions:
   0x0000000000000927 <+0>:	push   %r13
   0x0000000000000929 <+2>:	push   %r12
   0x000000000000092b <+4>:	xor    %r12d,%r12d
   0x000000000000092e <+7>:	push   %rbp
   0x000000000000092f <+8>:	push   %rbx
   0x0000000000000930 <+9>:	push   %rax
   0x0000000000000931 <+10>:	mov    0x340(%rdi),%rbp
   0x0000000000000938 <+17>:	jmpq   0x9e1 <udf_sb_free_partitions+186>
   0x000000000000093d <+22>:	movslq %r12d,%rbx
   0x0000000000000940 <+25>:	imul   $0x56,%rbx,%rbx
   0x0000000000000944 <+29>:	add    0x0(%rbp),%rbx
   0x0000000000000948 <+33>:	testb  $0x2,0x54(%rbx)
   0x000000000000094c <+37>:	je     0x956 <udf_sb_free_partitions+47>
   0x000000000000094e <+39>:	mov    (%rbx),%rdi
   0x0000000000000951 <+42>:	callq  0x956 <udf_sb_free_partitions+47>
   0x0000000000000956 <+47>:	testb  $0x8,0x54(%rbx)
   0x000000000000095a <+51>:	je     0x965 <udf_sb_free_partitions+62>
   0x000000000000095c <+53>:	mov    0x8(%rbx),%rdi
   0x0000000000000960 <+57>:	callq  0x965 <udf_sb_free_partitions+62>
   0x0000000000000965 <+62>:	testb  $0x1,0x54(%rbx)
   0x0000000000000969 <+66>:	je     0x973 <udf_sb_free_partitions+76>
   0x000000000000096b <+68>:	mov    (%rbx),%rdi
   0x000000000000096e <+71>:	callq  0x8cc <udf_sb_free_bitmap>
   0x0000000000000973 <+76>:	testb  $0x4,0x54(%rbx)
   0x0000000000000977 <+80>:	je     0x982 <udf_sb_free_partitions+91>
   0x0000000000000979 <+82>:	mov    0x8(%rbx),%rdi
   0x000000000000097d <+86>:	callq  0x8cc <udf_sb_free_bitmap>
   0x0000000000000982 <+91>:	mov    0x18(%rbx),%ax
   0x0000000000000986 <+95>:	cmp    $0x1522,%ax
   0x000000000000098a <+99>:	jne    0x9a5 <udf_sb_free_partitions+126>
   0x000000000000098c <+101>:	xor    %r13d,%r13d
   0x000000000000098f <+104>:	mov    0x1e(%rbx,%r13,1),%rdi
   0x0000000000000994 <+109>:	add    $0x8,%r13
   0x0000000000000998 <+113>:	callq  0x78d <brelse>
   0x000000000000099d <+118>:	cmp    $0x20,%r13
   0x00000000000009a1 <+122>:	jne    0x98f <udf_sb_free_partitions+104>
   0x00000000000009a3 <+124>:	jmp    0x9de <udf_sb_free_partitions+183>
   0x00000000000009a5 <+126>:	cmp    $0x2511,%ax
   0x00000000000009a9 <+130>:	jne    0x9de <udf_sb_free_partitions+183>
   0x00000000000009ab <+132>:	mov    0x32(%rbx),%rdi
   0x00000000000009af <+136>:	callq  0x9b4 <udf_sb_free_partitions+141>
   0x00000000000009b4 <+141>:	mov    0x3a(%rbx),%rdi
   0x00000000000009b8 <+145>:	movq   $0x0,0x32(%rbx)
   0x00000000000009c0 <+153>:	callq  0x9c5 <udf_sb_free_partitions+158>
   0x00000000000009c5 <+158>:	mov    0x42(%rbx),%rdi
   0x00000000000009c9 <+162>:	movq   $0x0,0x3a(%rbx)
   0x00000000000009d1 <+170>:	callq  0x9d6 <udf_sb_free_partitions+175>
   0x00000000000009d6 <+175>:	movq   $0x0,0x42(%rbx)
   0x00000000000009de <+183>:	inc    %r12d
   0x00000000000009e1 <+186>:	movzwl 0x28(%rbp),%eax
   0x00000000000009e5 <+190>:	cmp    %eax,%r12d
   0x00000000000009e8 <+193>:	jl     0x93d <udf_sb_free_partitions+22>
   0x00000000000009ee <+199>:	mov    0x0(%rbp),%rdi
   0x00000000000009f2 <+203>:	callq  0x9f7 <udf_sb_free_partitions+208>
   0x00000000000009f7 <+208>:	movq   $0x0,0x0(%rbp)
   0x00000000000009ff <+216>:	pop    %rax
   0x0000000000000a00 <+217>:	pop    %rbx
   0x0000000000000a01 <+218>:	pop    %rbp
   0x0000000000000a02 <+219>:	pop    %r12
   0x0000000000000a04 <+221>:	pop    %r13
   0x0000000000000a06 <+223>:	retq   
End of assembler dump.
(gdb) quit
