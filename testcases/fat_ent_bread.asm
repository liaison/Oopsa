GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.2/fs/fat/fatent.o...done.
(gdb) Dump of assembler code for function fat_ent_bread:
   0x000006d3 <+0>:	push   %ebp
   0x000006d4 <+1>:	mov    %ecx,%ebp
   0x000006d6 <+3>:	push   %edi
   0x000006d7 <+4>:	push   %esi
   0x000006d8 <+5>:	mov    %edx,%esi
   0x000006da <+7>:	push   %ebx
   0x000006db <+8>:	mov    %eax,%ebx
   0x000006dd <+10>:	mov    0x1e4(%eax),%eax
   0x000006e3 <+16>:	cmpl   $0x0,0x18(%esp)
   0x000006e8 <+21>:	mov    0x90(%eax),%edi
   0x000006ee <+27>:	movzwl 0xa(%eax),%eax
   0x000006f2 <+31>:	ja     0x709 <fat_ent_bread+54>
   0x000006f4 <+33>:	cmp    %eax,0x14(%esp)
   0x000006f8 <+37>:	jae    0x709 <fat_ent_bread+54>
   0x000006fa <+39>:	mov    $0x6b,%edx
   0x000006ff <+44>:	mov    $0x0,%eax
   0x00000704 <+49>:	call   0x705 <fat_ent_bread+50>
   0x00000709 <+54>:	mov    0x1e4(%ebx),%eax
   0x0000070f <+60>:	mov    0x94(%eax),%eax
   0x00000715 <+66>:	mov    %eax,0x18(%esi)
   0x00000718 <+69>:	mov    0x90(%ebx),%eax
   0x0000071e <+75>:	pushl  0x10(%ebx)
   0x00000721 <+78>:	mov    0x18(%esp),%edx
   0x00000725 <+82>:	mov    0x1c(%esp),%ecx
   0x00000729 <+86>:	call   0x72a <fat_ent_bread+87>
   0x0000072e <+91>:	pop    %edx
   0x0000072f <+92>:	test   %eax,%eax
   0x00000731 <+94>:	mov    %eax,0x10(%esi)
   0x00000734 <+97>:	jne    0x758 <fat_ent_bread+133>
   0x00000736 <+99>:	pushl  0x18(%esp)
   0x0000073a <+103>:	pushl  0x18(%esp)
   0x0000073e <+107>:	push   $0x10
   0x00000743 <+112>:	push   $0x2f
   0x00000748 <+117>:	push   %ebx
   0x00000749 <+118>:	call   0x74a <fat_ent_bread+119>
   0x0000074e <+123>:	mov    $0xfffffffb,%eax
   0x00000753 <+128>:	add    $0x14,%esp
   0x00000756 <+131>:	jmp    0x768 <fat_ent_bread+149>
   0x00000758 <+133>:	mov    %esi,%eax
   0x0000075a <+135>:	mov    %ebp,%edx
   0x0000075c <+137>:	movl   $0x1,0xc(%esi)
   0x00000763 <+144>:	call   *0x4(%edi)
   0x00000766 <+147>:	xor    %eax,%eax
   0x00000768 <+149>:	pop    %ebx
   0x00000769 <+150>:	pop    %esi
   0x0000076a <+151>:	pop    %edi
   0x0000076b <+152>:	pop    %ebp
   0x0000076c <+153>:	ret    
End of assembler dump.
(gdb) quit
