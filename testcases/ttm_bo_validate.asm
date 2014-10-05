GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.6/drivers/gpu/drm/ttm/ttm_bo.o...done.
(gdb) Dump of assembler code for function ttm_bo_validate:
   0x00001ca6 <+0>:	push   %ebp
   0x00001ca7 <+1>:	push   %edi
   0x00001ca8 <+2>:	push   %esi
   0x00001ca9 <+3>:	push   %ebx
   0x00001caa <+4>:	mov    %eax,%ebx
   0x00001cac <+6>:	sub    $0x8,%esp
   0x00001caf <+9>:	mov    0x1c(%esp),%al
   0x00001cb3 <+13>:	mov    %cl,0x5(%esp)
   0x00001cb7 <+17>:	mov    %al,0x6(%esp)
   0x00001cbb <+21>:	mov    0x20(%esp),%al
   0x00001cbf <+25>:	mov    %al,0x7(%esp)
   0x00001cc3 <+29>:	mov    0xa8(%ebx),%eax
   0x00001cc9 <+35>:	test   %eax,%eax
   0x00001ccb <+37>:	jne    0x1ccf <ttm_bo_validate+41>
   0x00001ccd <+39>:	ud2    
   0x00001ccf <+41>:	mov    0x4(%edx),%eax
   0x00001cd2 <+44>:	test   %eax,%eax
   0x00001cd4 <+46>:	jne    0x1cdb <ttm_bo_validate+53>
   0x00001cd6 <+48>:	cmpl   $0x0,(%edx)
   0x00001cd9 <+51>:	je     0x1cf2 <ttm_bo_validate+76>
   0x00001cdb <+53>:	mov    (%edx),%ecx
   0x00001cdd <+55>:	cmp    %eax,%ecx
   0x00001cdf <+57>:	ja     0x1d8c <ttm_bo_validate+230>
   0x00001ce5 <+63>:	mov    %eax,%esi
   0x00001ce7 <+65>:	sub    %ecx,%esi
   0x00001ce9 <+67>:	cmp    0x14(%ebx),%esi
   0x00001cec <+70>:	jb     0x1d8c <ttm_bo_validate+230>
   0x00001cf2 <+76>:	cmpl   $0x0,0x38(%ebx)
   0x00001cf6 <+80>:	lea    0x38(%ebx),%ebp
   0x00001cf9 <+83>:	je     0x1cff <ttm_bo_validate+89>
   0x00001cfb <+85>:	test   %eax,%eax
   0x00001cfd <+87>:	jne    0x1d09 <ttm_bo_validate+99>
   0x00001cff <+89>:	mov    0x8(%edx),%eax
   0x00001d02 <+92>:	mov    %eax,(%esp)
   0x00001d05 <+95>:	xor    %eax,%eax
   0x00001d07 <+97>:	jmp    0x1d34 <ttm_bo_validate+142>
   0x00001d09 <+99>:	mov    0x3c(%ebx),%ecx
   0x00001d0c <+102>:	cmp    (%edx),%ecx
   0x00001d0e <+104>:	jb     0x1d3e <ttm_bo_validate+152>
   0x00001d10 <+106>:	add    0x44(%ebx),%ecx
   0x00001d13 <+109>:	cmp    %eax,%ecx
   0x00001d15 <+111>:	jbe    0x1cff <ttm_bo_validate+89>
   0x00001d17 <+113>:	jmp    0x1d3e <ttm_bo_validate+152>
   0x00001d19 <+115>:	mov    0xc(%edx),%ecx
   0x00001d1c <+118>:	mov    (%ecx,%eax,4),%esi
   0x00001d1f <+121>:	mov    0x18(%ebp),%ecx
   0x00001d22 <+124>:	mov    %esi,%edi
   0x00001d24 <+126>:	and    %ecx,%edi
   0x00001d26 <+128>:	test   $0x70000,%edi
   0x00001d2c <+134>:	je     0x1d33 <ttm_bo_validate+141>
   0x00001d2e <+136>:	test   %di,%di
   0x00001d31 <+139>:	jne    0x1d3b <ttm_bo_validate+149>
   0x00001d33 <+141>:	inc    %eax
   0x00001d34 <+142>:	cmp    (%esp),%eax
   0x00001d37 <+145>:	jne    0x1d19 <ttm_bo_validate+115>
   0x00001d39 <+147>:	jmp    0x1d3e <ttm_bo_validate+152>
   0x00001d3b <+149>:	inc    %eax
   0x00001d3c <+150>:	jne    0x1d5e <ttm_bo_validate+184>
   0x00001d3e <+152>:	movzbl 0x7(%esp),%eax
   0x00001d43 <+157>:	movzbl 0x5(%esp),%ecx
   0x00001d48 <+162>:	push   %eax
   0x00001d49 <+163>:	movzbl 0xa(%esp),%eax
   0x00001d4e <+168>:	push   %eax
   0x00001d4f <+169>:	mov    %ebx,%eax
   0x00001d51 <+171>:	call   0x1d52 <ttm_bo_validate+172>
   0x00001d56 <+176>:	pop    %edi
   0x00001d57 <+177>:	pop    %ebp
   0x00001d58 <+178>:	test   %eax,%eax
   0x00001d5a <+180>:	je     0x1d6b <ttm_bo_validate+197>
   0x00001d5c <+182>:	jmp    0x1d91 <ttm_bo_validate+235>
   0x00001d5e <+184>:	xor    %ecx,%esi
   0x00001d60 <+186>:	and    $0xfff80000,%esi
   0x00001d66 <+192>:	xor    %ecx,%esi
   0x00001d68 <+194>:	mov    %esi,0x50(%ebx)
   0x00001d6b <+197>:	xor    %eax,%eax
   0x00001d6d <+199>:	cmpl   $0x0,0x4c(%ebx)
   0x00001d71 <+203>:	jne    0x1d91 <ttm_bo_validate+235>
   0x00001d73 <+205>:	cmpl   $0x0,0x74(%ebx)
   0x00001d77 <+209>:	jne    0x1d91 <ttm_bo_validate+235>
   0x00001d79 <+211>:	add    $0x8,%esp
   0x00001d7c <+214>:	mov    %ebx,%eax
   0x00001d7e <+216>:	pop    %ebx
   0x00001d7f <+217>:	mov    $0x1,%edx
   0x00001d84 <+222>:	pop    %esi
   0x00001d85 <+223>:	pop    %edi
   0x00001d86 <+224>:	pop    %ebp
   0x00001d87 <+225>:	jmp    0x25f <ttm_bo_add_ttm>
   0x00001d8c <+230>:	mov    $0xffffffea,%eax
   0x00001d91 <+235>:	add    $0x8,%esp
   0x00001d94 <+238>:	pop    %ebx
   0x00001d95 <+239>:	pop    %esi
   0x00001d96 <+240>:	pop    %edi
   0x00001d97 <+241>:	pop    %ebp
   0x00001d98 <+242>:	ret    
End of assembler dump.
(gdb) quit
