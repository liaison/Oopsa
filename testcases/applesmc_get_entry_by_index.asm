GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.2/drivers/hwmon/applesmc.o...done.
(gdb) Dump of assembler code for function applesmc_get_entry_by_index:
   0x00000000000002d7 <+0>:	push   %rbp
   0x00000000000002d8 <+1>:	mov    %edi,%ebp
   0x00000000000002da <+3>:	push   %rbx
   0x00000000000002db <+4>:	movslq %edi,%rbx
   0x00000000000002de <+7>:	imul   $0xd,%rbx,%rbx
   0x00000000000002e2 <+11>:	sub    $0x28,%rsp
   0x00000000000002e6 <+15>:	add    0x0(%rip),%rbx        # 0x2ed <applesmc_get_entry_by_index+22>
   0x00000000000002ed <+22>:	cmpb   $0x0,0x5(%rbx)
   0x00000000000002f1 <+26>:	jne    0x389 <applesmc_get_entry_by_index+178>
   0x00000000000002f7 <+32>:	mov    $0x0,%rdi
   0x00000000000002fe <+39>:	callq  0x303 <applesmc_get_entry_by_index+44>
   0x0000000000000303 <+44>:	xor    %eax,%eax
   0x0000000000000305 <+46>:	cmpb   $0x0,0x5(%rbx)
   0x0000000000000309 <+50>:	jne    0x36c <applesmc_get_entry_by_index+149>
   0x000000000000030b <+52>:	lea    0x16(%rsp),%rdx
   0x0000000000000310 <+57>:	lea    0x10(%rsp),%rsi
   0x0000000000000315 <+62>:	mov    %ebp,%edi
   0x0000000000000317 <+64>:	mov    $0x4,%ecx
   0x000000000000031c <+69>:	bswap  %edi
   0x000000000000031e <+71>:	mov    %edi,0x10(%rsp)
   0x0000000000000322 <+75>:	mov    $0x12,%edi
   0x0000000000000327 <+80>:	callq  0x1ed <read_smc>
   0x000000000000032c <+85>:	test   %eax,%eax
   0x000000000000032e <+87>:	jne    0x36c <applesmc_get_entry_by_index+149>
   0x0000000000000330 <+89>:	lea    0x1a(%rsp),%rdx
   0x0000000000000335 <+94>:	lea    0x16(%rsp),%rsi
   0x000000000000033a <+99>:	mov    $0x6,%ecx
   0x000000000000033f <+104>:	mov    $0x13,%edi
   0x0000000000000344 <+109>:	callq  0x1ed <read_smc>
   0x0000000000000349 <+114>:	test   %eax,%eax
   0x000000000000034b <+116>:	jne    0x36c <applesmc_get_entry_by_index+149>
   0x000000000000034d <+118>:	mov    0x16(%rsp),%edx
   0x0000000000000351 <+122>:	mov    %edx,(%rbx)
   0x0000000000000353 <+124>:	mov    0x1a(%rsp),%dl
   0x0000000000000357 <+128>:	mov    %dl,0x6(%rbx)
   0x000000000000035a <+131>:	mov    0x1b(%rsp),%edx
   0x000000000000035e <+135>:	mov    %edx,0x7(%rbx)
   0x0000000000000361 <+138>:	mov    0x1f(%rsp),%dl
   0x0000000000000365 <+142>:	movb   $0x1,0x5(%rbx)
   0x0000000000000369 <+146>:	mov    %dl,0xc(%rbx)
   0x000000000000036c <+149>:	mov    $0x0,%rdi
   0x0000000000000373 <+156>:	mov    %eax,0x8(%rsp)
   0x0000000000000377 <+160>:	callq  0x37c <applesmc_get_entry_by_index+165>
   0x000000000000037c <+165>:	mov    0x8(%rsp),%eax
   0x0000000000000380 <+169>:	movslq %eax,%rdx
   0x0000000000000383 <+172>:	test   %eax,%eax
   0x0000000000000385 <+174>:	cmovne %rdx,%rbx
   0x0000000000000389 <+178>:	add    $0x28,%rsp
   0x000000000000038d <+182>:	mov    %rbx,%rax
   0x0000000000000390 <+185>:	pop    %rbx
   0x0000000000000391 <+186>:	pop    %rbp
   0x0000000000000392 <+187>:	retq   
End of assembler dump.
(gdb) quit
