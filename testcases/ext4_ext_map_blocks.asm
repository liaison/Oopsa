GNU gdb (GDB) 7.4.1-debian
Copyright (C) 2012 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/guo/miparcours/pipeline/linux-3.7.2/fs/ext4/extents.o...done.
(gdb) Dump of assembler code for function ext4_ext_map_blocks:
   0x0000000000003a17 <+0>:	push   %r15
   0x0000000000003a19 <+2>:	push   %r14
   0x0000000000003a1b <+4>:	push   %r13
   0x0000000000003a1d <+6>:	push   %r12
   0x0000000000003a1f <+8>:	push   %rbp
   0x0000000000003a20 <+9>:	mov    %rsi,%rbp
   0x0000000000003a23 <+12>:	push   %rbx
   0x0000000000003a24 <+13>:	mov    %rdx,%rbx
   0x0000000000003a27 <+16>:	sub    $0xb8,%rsp
   0x0000000000003a2e <+23>:	mov    0x28(%rsi),%rax
   0x0000000000003a32 <+27>:	mov    0xc(%rdx),%r12d
   0x0000000000003a36 <+31>:	mov    %rdi,0x38(%rsp)
   0x0000000000003a3b <+36>:	mov    %ecx,0x40(%rsp)
   0x0000000000003a3f <+40>:	movl   $0x0,0x68(%rsp)
   0x0000000000003a47 <+48>:	mov    0x8(%rdx),%r13d
   0x0000000000003a4b <+52>:	mov    0x340(%rax),%r14
   0x0000000000003a52 <+59>:	mov    0x218(%rsi),%rax
   0x0000000000003a59 <+66>:	mov    %rax,0x48(%rsp)
   0x0000000000003a5e <+71>:	mov    0x0(%rip),%eax        # 0x3a64 <ext4_ext_map_blocks+77>
   0x0000000000003a64 <+77>:	test   %eax,%eax
   0x0000000000003a66 <+79>:	jne    0x49d9 <ext4_ext_map_blocks+4034>
   0x0000000000003a6c <+85>:	lea    0x29c(%rbp),%rdx
   0x0000000000003a73 <+92>:	mov    0x8(%rbx),%r12d
   0x0000000000003a77 <+96>:	xor    %r15d,%r15d
   0x0000000000003a7a <+99>:	mov    %rdx,%rdi
   0x0000000000003a7d <+102>:	mov    %rdx,0x50(%rsp)
   0x0000000000003a82 <+107>:	callq  0x3a87 <ext4_ext_map_blocks+112>
   0x0000000000003a87 <+112>:	mov    0x234(%rbp),%eax
   0x0000000000003a8d <+118>:	test   %eax,%eax
   0x0000000000003a8f <+120>:	jne    0x3ab5 <ext4_ext_map_blocks+158>
   0x0000000000003a91 <+122>:	jmp    0x3aec <ext4_ext_map_blocks+213>
   0x0000000000003a93 <+124>:	mov    0x8(%r15),%rdi
   0x0000000000003a97 <+128>:	mov    0x40(%rsp),%r8d
   0x0000000000003a9c <+133>:	mov    %r12d,%ecx
   0x0000000000003a9f <+136>:	mov    %r13d,%edx
   0x0000000000003aa2 <+139>:	mov    %rbp,%rsi
   0x0000000000003aa5 <+142>:	callq  *(%r15)
   0x0000000000003aa8 <+145>:	add    $0x10,%r15
   0x0000000000003aac <+149>:	cmpq   $0x0,(%r15)
   0x0000000000003ab0 <+153>:	jmpq   0x49e3 <ext4_ext_map_blocks+4044>
   0x0000000000003ab5 <+158>:	mov    0x230(%rbp),%edx
   0x0000000000003abb <+164>:	cmp    %edx,%r12d
   0x0000000000003abe <+167>:	jb     0x3aec <ext4_ext_map_blocks+213>
   0x0000000000003ac0 <+169>:	lea    -0x1(%rax,%rdx,1),%ecx
   0x0000000000003ac4 <+173>:	cmp    %ecx,%r12d
   0x0000000000003ac7 <+176>:	ja     0x3aec <ext4_ext_map_blocks+213>
   0x0000000000003ac9 <+178>:	mov    %edx,0x6c(%rsp)
   0x0000000000003acd <+182>:	mov    0x228(%rbp),%rdx
   0x0000000000003ad4 <+189>:	mov    $0x1,%r15d
   0x0000000000003ada <+195>:	mov    %ax,0x70(%rsp)
   0x0000000000003adf <+200>:	mov    %edx,0x74(%rsp)
   0x0000000000003ae3 <+204>:	shr    $0x20,%rdx
   0x0000000000003ae7 <+208>:	mov    %dx,0x72(%rsp)
   0x0000000000003aec <+213>:	mov    0x0(%rip),%eax        # 0x3af2 <ext4_ext_map_blocks+219>
   0x0000000000003af2 <+219>:	test   %eax,%eax
   0x0000000000003af4 <+221>:	jne    0x49ee <ext4_ext_map_blocks+4055>
   0x0000000000003afa <+227>:	addb   $0x1,0x29c(%rbp)
   0x0000000000003b01 <+234>:	test   %r15d,%r15d
   0x0000000000003b04 <+237>:	jne    0x3b2a <ext4_ext_map_blocks+275>
   0x0000000000003b06 <+239>:	jmpq   0x3bb0 <ext4_ext_map_blocks+409>
   0x0000000000003b0b <+244>:	mov    0x8(%r13),%rdi
   0x0000000000003b0f <+248>:	mov    %r15d,%ecx
   0x0000000000003b12 <+251>:	mov    %r12d,%edx
   0x0000000000003b15 <+254>:	mov    %rbp,%rsi
   0x0000000000003b18 <+257>:	callq  *0x0(%r13)
   0x0000000000003b1c <+261>:	add    $0x10,%r13
   0x0000000000003b20 <+265>:	cmpq   $0x0,0x0(%r13)
   0x0000000000003b25 <+270>:	jmpq   0x49f8 <ext4_ext_map_blocks+4065>
   0x0000000000003b2a <+275>:	mov    0x74(%rsp),%eax
   0x0000000000003b2e <+279>:	mov    0x8(%rbx),%esi
   0x0000000000003b31 <+282>:	test   %eax,%eax
   0x0000000000003b33 <+284>:	jne    0x3b66 <ext4_ext_map_blocks+335>
   0x0000000000003b35 <+286>:	cmpw   $0x0,0x72(%rsp)
   0x0000000000003b3b <+292>:	jne    0x3b66 <ext4_ext_map_blocks+335>
   0x0000000000003b3d <+294>:	cmpl   $0x1,0x50(%r14)
   0x0000000000003b42 <+299>:	jbe    0x3b59 <ext4_ext_map_blocks+322>
   0x0000000000003b44 <+301>:	xor    %edx,%edx
   0x0000000000003b46 <+303>:	mov    %rbp,%rdi
   0x0000000000003b49 <+306>:	callq  0x3b4e <ext4_ext_map_blocks+311>
   0x0000000000003b4e <+311>:	test   %eax,%eax
   0x0000000000003b50 <+313>:	je     0x3b59 <ext4_ext_map_blocks+322>
   0x0000000000003b52 <+315>:	orl    $0x2000000,0x10(%rbx)
   0x0000000000003b59 <+322>:	testb  $0x1,0x40(%rsp)
   0x0000000000003b5e <+327>:	je     0x4a2d <ext4_ext_map_blocks+4118>
   0x0000000000003b64 <+333>:	jmp    0x3bb0 <ext4_ext_map_blocks+409>
   0x0000000000003b66 <+335>:	cmpl   $0x1,0x50(%r14)
   0x0000000000003b6b <+340>:	jbe    0x3b74 <ext4_ext_map_blocks+349>
   0x0000000000003b6d <+342>:	orl    $0x2000000,0x10(%rbx)
   0x0000000000003b74 <+349>:	mov    %eax,%ecx
   0x0000000000003b76 <+351>:	movzwl 0x72(%rsp),%eax
   0x0000000000003b7b <+356>:	mov    0x6c(%rsp),%edx
   0x0000000000003b7f <+360>:	shl    $0x20,%rax
   0x0000000000003b83 <+364>:	or     %rcx,%rax
   0x0000000000003b86 <+367>:	mov    %esi,%ecx
   0x0000000000003b88 <+369>:	sub    %edx,%ecx
   0x0000000000003b8a <+371>:	add    %rax,%rcx
   0x0000000000003b8d <+374>:	movzwl 0x70(%rsp),%eax
   0x0000000000003b92 <+379>:	mov    %rcx,0x30(%rsp)
   0x0000000000003b97 <+384>:	cmp    $0x8000,%ax
   0x0000000000003b9b <+388>:	jbe    0x3ba2 <ext4_ext_map_blocks+395>
   0x0000000000003b9d <+390>:	sub    $0x8000,%eax
   0x0000000000003ba2 <+395>:	sub    %esi,%edx
   0x0000000000003ba4 <+397>:	xor    %r12d,%r12d
   0x0000000000003ba7 <+400>:	lea    (%rdx,%rax,1),%r13d
   0x0000000000003bab <+404>:	jmpq   0x4948 <ext4_ext_map_blocks+3889>
   0x0000000000003bb0 <+409>:	mov    0x8(%rbx),%esi
   0x0000000000003bb3 <+412>:	xor    %edx,%edx
   0x0000000000003bb5 <+414>:	mov    %rbp,%rdi
   0x0000000000003bb8 <+417>:	callq  0x3bbd <ext4_ext_map_blocks+422>
   0x0000000000003bbd <+422>:	cmp    $0xfffffffffffff000,%rax
   0x0000000000003bc3 <+428>:	mov    %rax,%r12
   0x0000000000003bc6 <+431>:	jbe    0x3bd1 <ext4_ext_map_blocks+442>
   0x0000000000003bc8 <+433>:	mov    %eax,0x68(%rsp)
   0x0000000000003bcc <+437>:	jmpq   0x4a2d <ext4_ext_map_blocks+4118>
   0x0000000000003bd1 <+442>:	movzwl -0xaa(%rbp),%eax
   0x0000000000003bd8 <+449>:	movzwl %ax,%edx
   0x0000000000003bdb <+452>:	imul   $0x30,%rdx,%rdx
   0x0000000000003bdf <+456>:	add    %r12,%rdx
   0x0000000000003be2 <+459>:	mov    0x10(%rdx),%r15
   0x0000000000003be6 <+463>:	test   %r15,%r15
   0x0000000000003be9 <+466>:	jne    0x3c2e <ext4_ext_map_blocks+535>
   0x0000000000003beb <+468>:	test   %eax,%eax
   0x0000000000003bed <+470>:	je     0x400b <ext4_ext_map_blocks+1524>
   0x0000000000003bf3 <+476>:	mov    (%rdx),%rdx
   0x0000000000003bf6 <+479>:	mov    0x8(%rbx),%r9d
   0x0000000000003bfa <+483>:	mov    $0x0,%r8
   0x0000000000003c01 <+490>:	mov    %eax,(%rsp)
   0x0000000000003c04 <+493>:	xor    %ecx,%ecx
   0x0000000000003c06 <+495>:	mov    $0x0,%rsi
   0x0000000000003c0d <+502>:	mov    %rbp,%rdi
   0x0000000000003c10 <+505>:	xor    %eax,%eax
   0x0000000000003c12 <+507>:	mov    %rdx,0x8(%rsp)
   0x0000000000003c17 <+512>:	mov    $0xf86,%edx
   0x0000000000003c1c <+517>:	callq  0x3c21 <ext4_ext_map_blocks+522>
   0x0000000000003c21 <+522>:	movl   $0xfffffffb,0x68(%rsp)
   0x0000000000003c29 <+530>:	jmpq   0x4964 <ext4_ext_map_blocks+3917>
   0x0000000000003c2e <+535>:	movzwl 0x6(%r15),%eax
   0x0000000000003c33 <+540>:	mov    0x8(%r15),%edx
   0x0000000000003c37 <+544>:	movzwl 0x4(%r15),%r10d
   0x0000000000003c3c <+549>:	mov    (%r15),%r9d
   0x0000000000003c3f <+552>:	shl    $0x20,%rax
   0x0000000000003c43 <+556>:	or     %rdx,%rax
   0x0000000000003c46 <+559>:	cmp    $0x8000,%r10w
   0x0000000000003c4c <+565>:	jbe    0x3c55 <ext4_ext_map_blocks+574>
   0x0000000000003c4e <+567>:	sub    $0x8000,%r10d
   0x0000000000003c55 <+574>:	mov    0x0(%rip),%edx        # 0x3c5b <ext4_ext_map_blocks+580>
   0x0000000000003c5b <+580>:	test   %edx,%edx
   0x0000000000003c5d <+582>:	jne    0x4a03 <ext4_ext_map_blocks+4076>
   0x0000000000003c63 <+588>:	mov    0x8(%rbx),%edx
   0x0000000000003c66 <+591>:	cmp    %r9d,%edx
   0x0000000000003c69 <+594>:	jae    0x3cb0 <ext4_ext_map_blocks+665>
   0x0000000000003c6b <+596>:	jmpq   0x400b <ext4_ext_map_blocks+1524>
   0x0000000000003c70 <+601>:	mov    0x8(%r13),%rdi
   0x0000000000003c74 <+605>:	mov    %r10d,%r8d
   0x0000000000003c77 <+608>:	mov    %rax,%rcx
   0x0000000000003c7a <+611>:	mov    %r9d,%edx
   0x0000000000003c7d <+614>:	mov    %rax,0x18(%rsp)
   0x0000000000003c82 <+619>:	mov    %r9d,0x20(%rsp)
   0x0000000000003c87 <+624>:	mov    %r10d,0x28(%rsp)
   0x0000000000003c8c <+629>:	mov    %rbp,%rsi
   0x0000000000003c8f <+632>:	callq  *0x0(%r13)
   0x0000000000003c93 <+636>:	add    $0x10,%r13
   0x0000000000003c97 <+640>:	mov    0x18(%rsp),%rax
   0x0000000000003c9c <+645>:	mov    0x20(%rsp),%r9d
   0x0000000000003ca1 <+650>:	cmpq   $0x0,0x0(%r13)
   0x0000000000003ca6 <+655>:	mov    0x28(%rsp),%r10d
   0x0000000000003cab <+660>:	jmpq   0x4a0d <ext4_ext_map_blocks+4086>
   0x0000000000003cb0 <+665>:	lea    -0x1(%r9,%r10,1),%ecx
   0x0000000000003cb5 <+670>:	cmp    %ecx,%edx
   0x0000000000003cb7 <+672>:	ja     0x400b <ext4_ext_map_blocks+1524>
   0x0000000000003cbd <+678>:	mov    %edx,%ecx
   0x0000000000003cbf <+680>:	mov    %r9d,%r13d
   0x0000000000003cc2 <+683>:	sub    %r9d,%ecx
   0x0000000000003cc5 <+686>:	sub    %edx,%r13d
   0x0000000000003cc8 <+689>:	add    %rax,%rcx
   0x0000000000003ccb <+692>:	add    %r10d,%r13d
   0x0000000000003cce <+695>:	cmpw   $0x8000,0x4(%r15)
   0x0000000000003cd5 <+702>:	mov    %rcx,0x30(%rsp)
   0x0000000000003cda <+707>:	ja     0x3cf2 <ext4_ext_map_blocks+731>
   0x0000000000003cdc <+709>:	mov    %rax,%rcx
   0x0000000000003cdf <+712>:	mov    %r10d,%edx
   0x0000000000003ce2 <+715>:	mov    %r9d,%esi
   0x0000000000003ce5 <+718>:	mov    %rbp,%rdi
   0x0000000000003ce8 <+721>:	callq  0x5f1 <ext4_ext_put_in_cache>
   0x0000000000003ced <+726>:	jmpq   0x4948 <ext4_ext_map_blocks+3889>
   0x0000000000003cf2 <+731>:	mov    0x0(%rip),%eax        # 0x3cf8 <ext4_ext_map_blocks+737>
   0x0000000000003cf8 <+737>:	mov    0x218(%rbp),%r15
   0x0000000000003cff <+744>:	test   %eax,%eax
   0x0000000000003d01 <+746>:	jne    0x4a18 <ext4_ext_map_blocks+4097>
   0x0000000000003d07 <+752>:	testb  $0x8,0x40(%rsp)
   0x0000000000003d0c <+757>:	je     0x3d95 <ext4_ext_map_blocks+894>
   0x0000000000003d12 <+763>:	jmp    0x3d36 <ext4_ext_map_blocks+799>
   0x0000000000003d14 <+765>:	mov    0x8(%r14),%rdi
   0x0000000000003d18 <+769>:	mov    0x30(%rsp),%r8
   0x0000000000003d1d <+774>:	mov    %r13d,%ecx
   0x0000000000003d20 <+777>:	mov    %rbx,%rdx
   0x0000000000003d23 <+780>:	mov    %rbp,%rsi
   0x0000000000003d26 <+783>:	callq  *(%r14)
   0x0000000000003d29 <+786>:	add    $0x10,%r14
   0x0000000000003d2d <+790>:	cmpq   $0x0,(%r14)
   0x0000000000003d31 <+794>:	jmpq   0x4a22 <ext4_ext_map_blocks+4107>
   0x0000000000003d36 <+799>:	mov    0x40(%rsp),%r8d
   0x0000000000003d3b <+804>:	mov    0x38(%rsp),%rdi
   0x0000000000003d40 <+809>:	mov    %r12,%rcx
   0x0000000000003d43 <+812>:	mov    %rbx,%rdx
   0x0000000000003d46 <+815>:	mov    %rbp,%rsi
   0x0000000000003d49 <+818>:	callq  0x3493 <ext4_split_unwritten_extents>
   0x0000000000003d4e <+823>:	test   %eax,%eax
   0x0000000000003d50 <+825>:	mov    %eax,%r14d
   0x0000000000003d53 <+828>:	jle    0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003d59 <+834>:	test   %r15,%r15
   0x0000000000003d5c <+837>:	je     0x3d6c <ext4_ext_map_blocks+853>
   0x0000000000003d5e <+839>:	lea    0x18(%r15),%rsi
   0x0000000000003d62 <+843>:	mov    %rbp,%rdi
   0x0000000000003d65 <+846>:	callq  0x77 <ext4_set_io_unwritten_flag>
   0x0000000000003d6a <+851>:	jmp    0x3d79 <ext4_ext_map_blocks+866>
   0x0000000000003d6c <+853>:	mov    $0x6,%esi
   0x0000000000003d71 <+858>:	mov    %rbp,%rdi
   0x0000000000003d74 <+861>:	callq  0x17 <ext4_set_inode_state>
   0x0000000000003d79 <+866>:	mov    %rbp,%rdi
   0x0000000000003d7c <+869>:	callq  0x10a1 <ext4_should_dioread_nolock>
   0x0000000000003d81 <+874>:	test   %eax,%eax
   0x0000000000003d83 <+876>:	je     0x3f39 <ext4_ext_map_blocks+1314>
   0x0000000000003d89 <+882>:	orl    $0x1000000,0x10(%rbx)
   0x0000000000003d90 <+889>:	jmpq   0x3f39 <ext4_ext_map_blocks+1314>
   0x0000000000003d95 <+894>:	testb  $0x10,0x40(%rsp)
   0x0000000000003d9a <+899>:	je     0x3edf <ext4_ext_map_blocks+1224>
   0x0000000000003da0 <+905>:	movzwl -0xaa(%rbp),%eax
   0x0000000000003da7 <+912>:	movzwl %ax,%edx
   0x0000000000003daa <+915>:	imul   $0x30,%rdx,%rdx
   0x0000000000003dae <+919>:	mov    0x10(%r12,%rdx,1),%rcx
   0x0000000000003db3 <+924>:	movzwl 0x4(%rcx),%edx
   0x0000000000003db7 <+928>:	mov    (%rcx),%esi
   0x0000000000003db9 <+930>:	cmp    $0x8000,%dx
   0x0000000000003dbe <+935>:	jbe    0x3dc6 <ext4_ext_map_blocks+943>
   0x0000000000003dc0 <+937>:	sub    $0x8000,%edx
   0x0000000000003dc6 <+943>:	cmp    0x8(%rbx),%esi
   0x0000000000003dc9 <+946>:	jne    0x3dd3 <ext4_ext_map_blocks+956>
   0x0000000000003dcb <+948>:	cmp    0xc(%rbx),%edx
   0x0000000000003dce <+951>:	mov    %r12,%r15
   0x0000000000003dd1 <+954>:	jbe    0x3e32 <ext4_ext_map_blocks+1051>
   0x0000000000003dd3 <+956>:	mov    0x38(%rsp),%rdi
   0x0000000000003dd8 <+961>:	mov    $0x10,%r8d
   0x0000000000003dde <+967>:	mov    %r12,%rcx
   0x0000000000003de1 <+970>:	mov    %rbx,%rdx
   0x0000000000003de4 <+973>:	mov    %rbp,%rsi
   0x0000000000003de7 <+976>:	callq  0x3493 <ext4_split_unwritten_extents>
   0x0000000000003dec <+981>:	test   %eax,%eax
   0x0000000000003dee <+983>:	mov    %eax,%r14d
   0x0000000000003df1 <+986>:	js     0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003df7 <+992>:	mov    %r12,%rdi
   0x0000000000003dfa <+995>:	callq  0x3dff <ext4_ext_map_blocks+1000>
   0x0000000000003dff <+1000>:	mov    0x8(%rbx),%esi
   0x0000000000003e02 <+1003>:	mov    %r12,%rdx
   0x0000000000003e05 <+1006>:	mov    %rbp,%rdi
   0x0000000000003e08 <+1009>:	callq  0x3e0d <ext4_ext_map_blocks+1014>
   0x0000000000003e0d <+1014>:	cmp    $0xfffffffffffff000,%rax
   0x0000000000003e13 <+1020>:	mov    %rax,%r15
   0x0000000000003e16 <+1023>:	mov    %eax,%r14d
   0x0000000000003e19 <+1026>:	ja     0x3ea5 <ext4_ext_map_blocks+1166>
   0x0000000000003e1f <+1032>:	movzwl -0xaa(%rbp),%edx
   0x0000000000003e26 <+1039>:	movzwl %dx,%eax
   0x0000000000003e29 <+1042>:	imul   $0x30,%rdx,%rdx
   0x0000000000003e2d <+1046>:	mov    0x10(%r15,%rdx,1),%rcx
   0x0000000000003e32 <+1051>:	cltq   
   0x0000000000003e34 <+1053>:	mov    0x38(%rsp),%rdi
   0x0000000000003e39 <+1058>:	imul   $0x30,%rax,%rax
   0x0000000000003e3d <+1062>:	mov    0x28(%r15,%rax,1),%rsi
   0x0000000000003e42 <+1067>:	mov    %rcx,0x28(%rsp)
   0x0000000000003e47 <+1072>:	callq  0x4c3 <ext4_ext_get_access>
   0x0000000000003e4c <+1077>:	test   %eax,%eax
   0x0000000000003e4e <+1079>:	mov    %eax,%r14d
   0x0000000000003e51 <+1082>:	mov    0x28(%rsp),%rcx
   0x0000000000003e56 <+1087>:	jne    0x3ea5 <ext4_ext_map_blocks+1166>
   0x0000000000003e58 <+1089>:	movzwl 0x4(%rcx),%eax
   0x0000000000003e5c <+1093>:	cmp    $0x8000,%ax
   0x0000000000003e60 <+1097>:	jbe    0x3e67 <ext4_ext_map_blocks+1104>
   0x0000000000003e62 <+1099>:	sub    $0x8000,%eax
   0x0000000000003e67 <+1104>:	mov    0x38(%rsp),%rdi
   0x0000000000003e6c <+1109>:	mov    %ax,0x4(%rcx)
   0x0000000000003e70 <+1113>:	mov    %r15,%rdx
   0x0000000000003e73 <+1116>:	mov    %rbp,%rsi
   0x0000000000003e76 <+1119>:	callq  0x16b1 <ext4_ext_try_to_merge>
   0x0000000000003e7b <+1124>:	movzwl 0x8(%r15),%eax
   0x0000000000003e80 <+1129>:	mov    0x38(%rsp),%rdx
   0x0000000000003e85 <+1134>:	mov    %rbp,%rcx
   0x0000000000003e88 <+1137>:	mov    $0xd42,%esi
   0x0000000000003e8d <+1142>:	mov    $0x0,%rdi
   0x0000000000003e94 <+1149>:	imul   $0x30,%rax,%rax
   0x0000000000003e98 <+1153>:	lea    0x28(%r15,%rax,1),%r8
   0x0000000000003e9d <+1158>:	callq  0xaef <__ext4_ext_dirty>
   0x0000000000003ea2 <+1163>:	mov    %eax,%r14d
   0x0000000000003ea5 <+1166>:	test   %r14d,%r14d
   0x0000000000003ea8 <+1169>:	js     0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003eae <+1175>:	mov    0x38(%rsp),%rdi
   0x0000000000003eb3 <+1180>:	mov    $0x1,%edx
   0x0000000000003eb8 <+1185>:	mov    %rbp,%rsi
   0x0000000000003ebb <+1188>:	callq  0x8a <ext4_update_inode_fsync_trans>
   0x0000000000003ec0 <+1193>:	mov    0x8(%rbx),%edx
   0x0000000000003ec3 <+1196>:	mov    0xc(%rbx),%r8d
   0x0000000000003ec7 <+1200>:	mov    %r12,%rcx
   0x0000000000003eca <+1203>:	mov    0x38(%rsp),%rdi
   0x0000000000003ecf <+1208>:	mov    %rbp,%rsi
   0x0000000000003ed2 <+1211>:	callq  0x568 <check_eofblocks_fl>
   0x0000000000003ed7 <+1216>:	mov    %eax,%r14d
   0x0000000000003eda <+1219>:	jmpq   0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003edf <+1224>:	testb  $0x2,0x40(%rsp)
   0x0000000000003ee4 <+1229>:	jne    0x3fab <ext4_ext_map_blocks+1428>
   0x0000000000003eea <+1235>:	testb  $0x1,0x40(%rsp)
   0x0000000000003eef <+1240>:	jne    0x3f00 <ext4_ext_map_blocks+1257>
   0x0000000000003ef1 <+1242>:	orl    $0x1000,0x10(%rbx)
   0x0000000000003ef8 <+1249>:	xor    %r14d,%r14d
   0x0000000000003efb <+1252>:	jmpq   0x3fd7 <ext4_ext_map_blocks+1472>
   0x0000000000003f00 <+1257>:	mov    0x38(%rsp),%rdi
   0x0000000000003f05 <+1262>:	mov    %r12,%rcx
   0x0000000000003f08 <+1265>:	mov    %rbx,%rdx
   0x0000000000003f0b <+1268>:	mov    %rbp,%rsi
   0x0000000000003f0e <+1271>:	callq  0x3513 <ext4_ext_convert_to_initialized>
   0x0000000000003f13 <+1276>:	test   %eax,%eax
   0x0000000000003f15 <+1278>:	mov    %eax,%r14d
   0x0000000000003f18 <+1281>:	js     0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003f1e <+1287>:	mov    0x38(%rsp),%rdi
   0x0000000000003f23 <+1292>:	mov    $0x1,%edx
   0x0000000000003f28 <+1297>:	mov    %rbp,%rsi
   0x0000000000003f2b <+1300>:	callq  0x8a <ext4_update_inode_fsync_trans>
   0x0000000000003f30 <+1305>:	test   %r14d,%r14d
   0x0000000000003f33 <+1308>:	je     0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003f39 <+1314>:	mov    0xc(%rbx),%eax
   0x0000000000003f3c <+1317>:	orl    $0x40,0x10(%rbx)
   0x0000000000003f40 <+1321>:	mov    %r14d,%r13d
   0x0000000000003f43 <+1324>:	cmp    %eax,%r14d
   0x0000000000003f46 <+1327>:	jbe    0x3f86 <ext4_ext_map_blocks+1391>
   0x0000000000003f48 <+1329>:	mov    %eax,%r13d
   0x0000000000003f4b <+1332>:	add    0x30(%rsp),%r13
   0x0000000000003f50 <+1337>:	sub    %eax,%r14d
   0x0000000000003f53 <+1340>:	mov    0x28(%rbp),%rax
   0x0000000000003f57 <+1344>:	mov    %r14d,0x44(%rsp)
   0x0000000000003f5c <+1349>:	mov    0x120(%rax),%r15
   0x0000000000003f63 <+1356>:	mov    %r13,%r14
   0x0000000000003f66 <+1359>:	jmp    0x3f76 <ext4_ext_map_blocks+1375>
   0x0000000000003f68 <+1361>:	mov    %r14,%rsi
   0x0000000000003f6b <+1364>:	mov    %r15,%rdi
   0x0000000000003f6e <+1367>:	inc    %r14
   0x0000000000003f71 <+1370>:	callq  0x3f76 <ext4_ext_map_blocks+1375>
   0x0000000000003f76 <+1375>:	mov    %r14d,%edx
   0x0000000000003f79 <+1378>:	sub    %r13d,%edx
   0x0000000000003f7c <+1381>:	cmp    0x44(%rsp),%edx
   0x0000000000003f80 <+1385>:	jl     0x3f68 <ext4_ext_map_blocks+1361>
   0x0000000000003f82 <+1387>:	mov    0xc(%rbx),%r13d
   0x0000000000003f86 <+1391>:	testb  $0x4,0x40(%rsp)
   0x0000000000003f8b <+1396>:	je     0x3fab <ext4_ext_map_blocks+1428>
   0x0000000000003f8d <+1398>:	mov    0xc(%rbx),%edx
   0x0000000000003f90 <+1401>:	mov    0x8(%rbx),%esi
   0x0000000000003f93 <+1404>:	mov    %rbp,%rdi
   0x0000000000003f96 <+1407>:	callq  0xf51 <get_reserved_cluster_alloc>
   0x0000000000003f9b <+1412>:	test   %eax,%eax
   0x0000000000003f9d <+1414>:	je     0x3fab <ext4_ext_map_blocks+1428>
   0x0000000000003f9f <+1416>:	xor    %edx,%edx
   0x0000000000003fa1 <+1418>:	mov    %eax,%esi
   0x0000000000003fa3 <+1420>:	mov    %rbp,%rdi
   0x0000000000003fa6 <+1423>:	callq  0x3fab <ext4_ext_map_blocks+1428>
   0x0000000000003fab <+1428>:	orl    $0x20,0x10(%rbx)
   0x0000000000003faf <+1432>:	xor    %r14d,%r14d
   0x0000000000003fb2 <+1435>:	testb  $0x80,0x40(%rsp)
   0x0000000000003fb7 <+1440>:	jne    0x3fd7 <ext4_ext_map_blocks+1472>
   0x0000000000003fb9 <+1442>:	mov    0x8(%rbx),%edx
   0x0000000000003fbc <+1445>:	mov    0xc(%rbx),%r8d
   0x0000000000003fc0 <+1449>:	mov    %r12,%rcx
   0x0000000000003fc3 <+1452>:	mov    0x38(%rsp),%rdi
   0x0000000000003fc8 <+1457>:	mov    %rbp,%rsi
   0x0000000000003fcb <+1460>:	callq  0x568 <check_eofblocks_fl>
   0x0000000000003fd0 <+1465>:	test   %eax,%eax
   0x0000000000003fd2 <+1467>:	mov    %eax,%r14d
   0x0000000000003fd5 <+1470>:	js     0x3fed <ext4_ext_map_blocks+1494>
   0x0000000000003fd7 <+1472>:	mov    0xc(%rbx),%eax
   0x0000000000003fda <+1475>:	cmp    %eax,%r13d
   0x0000000000003fdd <+1478>:	cmova  %eax,%r13d
   0x0000000000003fe1 <+1482>:	mov    0x30(%rsp),%rax
   0x0000000000003fe6 <+1487>:	mov    %r13d,0xc(%rbx)
   0x0000000000003fea <+1491>:	mov    %rax,(%rbx)
   0x0000000000003fed <+1494>:	test   %r12,%r12
   0x0000000000003ff0 <+1497>:	je     0x49ac <ext4_ext_map_blocks+3989>
   0x0000000000003ff6 <+1503>:	mov    %r12,%rdi
   0x0000000000003ff9 <+1506>:	callq  0x3ffe <ext4_ext_map_blocks+1511>
   0x0000000000003ffe <+1511>:	mov    %r12,%rdi
   0x0000000000004001 <+1514>:	callq  0x4006 <ext4_ext_map_blocks+1519>
   0x0000000000004006 <+1519>:	jmpq   0x49ac <ext4_ext_map_blocks+3989>
   0x000000000000400b <+1524>:	cmpl   $0x1,0x50(%r14)
   0x0000000000004010 <+1529>:	jbe    0x402a <ext4_ext_map_blocks+1555>
   0x0000000000004012 <+1531>:	mov    0x8(%rbx),%esi
   0x0000000000004015 <+1534>:	xor    %edx,%edx
   0x0000000000004017 <+1536>:	mov    %rbp,%rdi
   0x000000000000401a <+1539>:	callq  0x401f <ext4_ext_map_blocks+1544>
   0x000000000000401f <+1544>:	test   %eax,%eax
   0x0000000000004021 <+1546>:	je     0x402a <ext4_ext_map_blocks+1555>
   0x0000000000004023 <+1548>:	orl    $0x2000000,0x10(%rbx)
   0x000000000000402a <+1555>:	testb  $0x1,0x40(%rsp)
   0x000000000000402f <+1560>:	mov    0x8(%rbx),%eax
   0x0000000000004032 <+1563>:	jne    0x40b9 <ext4_ext_map_blocks+1698>
   0x0000000000004038 <+1569>:	movzwl -0xaa(%rbp),%edx
   0x000000000000403f <+1576>:	mov    %eax,%r13d
   0x0000000000004042 <+1579>:	imul   $0x30,%rdx,%rdx
   0x0000000000004046 <+1583>:	mov    0x10(%r12,%rdx,1),%rcx
   0x000000000000404b <+1588>:	test   %rcx,%rcx
   0x000000000000404e <+1591>:	je     0x409f <ext4_ext_map_blocks+1672>
   0x0000000000004050 <+1593>:	mov    (%rcx),%edx
   0x0000000000004052 <+1595>:	cmp    %edx,%eax
   0x0000000000004054 <+1597>:	jae    0x405a <ext4_ext_map_blocks+1603>
   0x0000000000004056 <+1599>:	sub    %eax,%edx
   0x0000000000004058 <+1601>:	jmp    0x40a7 <ext4_ext_map_blocks+1680>
   0x000000000000405a <+1603>:	movzwl 0x4(%rcx),%r13d
   0x000000000000405f <+1608>:	cmp    $0x8000,%r13w
   0x0000000000004065 <+1614>:	movzwl %r13w,%ecx
   0x0000000000004069 <+1618>:	jbe    0x4071 <ext4_ext_map_blocks+1626>
   0x000000000000406b <+1620>:	sub    $0x8000,%ecx
   0x0000000000004071 <+1626>:	add    %edx,%ecx
   0x0000000000004073 <+1628>:	cmp    %ecx,%eax
   0x0000000000004075 <+1630>:	jb     0x409d <ext4_ext_map_blocks+1670>
   0x0000000000004077 <+1632>:	cmp    $0x8000,%r13w
   0x000000000000407d <+1638>:	jbe    0x4086 <ext4_ext_map_blocks+1647>
   0x000000000000407f <+1640>:	sub    $0x8000,%r13d
   0x0000000000004086 <+1647>:	mov    %r12,%rdi
   0x0000000000004089 <+1650>:	add    %edx,%r13d
   0x000000000000408c <+1653>:	callq  0x195 <ext4_ext_next_allocated_block>
   0x0000000000004091 <+1658>:	mov    %eax,%edx
   0x0000000000004093 <+1660>:	sub    %r13d,%edx
   0x0000000000004096 <+1663>:	cmp    %r13d,%eax
   0x0000000000004099 <+1666>:	jne    0x40a7 <ext4_ext_map_blocks+1680>
   0x000000000000409b <+1668>:	ud2    
   0x000000000000409d <+1670>:	ud2    
   0x000000000000409f <+1672>:	xor    %r13d,%r13d
   0x00000000000040a2 <+1675>:	mov    $0xffffffff,%edx
   0x00000000000040a7 <+1680>:	xor    %ecx,%ecx
   0x00000000000040a9 <+1682>:	mov    %r13d,%esi
   0x00000000000040ac <+1685>:	mov    %rbp,%rdi
   0x00000000000040af <+1688>:	callq  0x5f1 <ext4_ext_put_in_cache>
   0x00000000000040b4 <+1693>:	jmpq   0x4964 <ext4_ext_map_blocks+3917>
   0x00000000000040b9 <+1698>:	andl   $0xfdffffff,0x10(%rbx)
   0x00000000000040c0 <+1705>:	mov    %eax,0x6c(%rsp)
   0x00000000000040c4 <+1709>:	mov    0x50(%r14),%edx
   0x00000000000040c8 <+1713>:	dec    %edx
   0x00000000000040ca <+1715>:	test   %eax,%edx
   0x00000000000040cc <+1717>:	je     0x40ee <ext4_ext_map_blocks+1751>
   0x00000000000040ce <+1719>:	test   %r15,%r15
   0x00000000000040d1 <+1722>:	je     0x40ee <ext4_ext_map_blocks+1751>
   0x00000000000040d3 <+1724>:	mov    0x28(%rbp),%rdi
   0x00000000000040d7 <+1728>:	mov    %r12,%rcx
   0x00000000000040da <+1731>:	mov    %r15,%rdx
   0x00000000000040dd <+1734>:	mov    %rbx,%rsi
   0x00000000000040e0 <+1737>:	callq  0x99b <get_implied_cluster_alloc>
   0x00000000000040e5 <+1742>:	test   %eax,%eax
   0x00000000000040e7 <+1744>:	je     0x40ee <ext4_ext_map_blocks+1751>
   0x00000000000040e9 <+1746>:	jmpq   0x4508 <ext4_ext_map_blocks+2801>
   0x00000000000040ee <+1751>:	mov    0x8(%rbx),%r9d
   0x00000000000040f2 <+1755>:	test   %r12,%r12
   0x00000000000040f5 <+1758>:	mov    %r9d,0x88(%rsp)
   0x00000000000040fd <+1766>:	jne    0x4123 <ext4_ext_map_blocks+1804>
   0x00000000000040ff <+1768>:	mov    $0x0,%r8
   0x0000000000004106 <+1775>:	xor    %ecx,%ecx
   0x0000000000004108 <+1777>:	mov    $0x4fd,%edx
   0x000000000000410d <+1782>:	mov    $0x0,%rsi
   0x0000000000004114 <+1789>:	mov    %rbp,%rdi
   0x0000000000004117 <+1792>:	xor    %eax,%eax
   0x0000000000004119 <+1794>:	callq  0x411e <ext4_ext_map_blocks+1799>
   0x000000000000411e <+1799>:	jmpq   0x4225 <ext4_ext_map_blocks+2062>
   0x0000000000004123 <+1804>:	movzwl 0x8(%r12),%edi
   0x0000000000004129 <+1810>:	movq   $0x0,0x98(%rsp)
   0x0000000000004135 <+1822>:	movzwl %di,%eax
   0x0000000000004138 <+1825>:	test   %eax,%eax
   0x000000000000413a <+1827>:	jne    0x4148 <ext4_ext_map_blocks+1841>
   0x000000000000413c <+1829>:	cmpq   $0x0,0x10(%r12)
   0x0000000000004142 <+1835>:	je     0x4253 <ext4_ext_map_blocks+2108>
   0x0000000000004148 <+1841>:	imul   $0x30,%rdi,%rdi
   0x000000000000414c <+1845>:	add    %r12,%rdi
   0x000000000000414f <+1848>:	mov    0x10(%rdi),%rdx
   0x0000000000004153 <+1852>:	movzwl 0x4(%rdx),%ecx
   0x0000000000004157 <+1856>:	cmp    $0x8000,%cx
   0x000000000000415c <+1861>:	jbe    0x4164 <ext4_ext_map_blocks+1869>
   0x000000000000415e <+1863>:	sub    $0x8000,%ecx
   0x0000000000004164 <+1869>:	mov    (%rdx),%esi
   0x0000000000004166 <+1871>:	cmp    %esi,%r9d
   0x0000000000004169 <+1874>:	jae    0x41f7 <ext4_ext_map_blocks+2016>
   0x000000000000416f <+1880>:	mov    0x20(%rdi),%rcx
   0x0000000000004173 <+1884>:	add    $0xc,%rcx
   0x0000000000004177 <+1888>:	cmp    %rcx,%rdx
   0x000000000000417a <+1891>:	je     0x41ee <ext4_ext_map_blocks+2007>
   0x000000000000417c <+1893>:	mov    %esi,(%rsp)
   0x000000000000417f <+1896>:	mov    $0x0,%r8
   0x0000000000004186 <+1903>:	xor    %ecx,%ecx
   0x0000000000004188 <+1905>:	mov    $0x510,%edx
   0x000000000000418d <+1910>:	mov    $0x0,%rsi
   0x0000000000004194 <+1917>:	mov    %rbp,%rdi
   0x0000000000004197 <+1920>:	xor    %eax,%eax
   0x0000000000004199 <+1922>:	callq  0x419e <ext4_ext_map_blocks+1927>
   0x000000000000419e <+1927>:	jmpq   0x4225 <ext4_ext_map_blocks+2062>
   0x00000000000041a3 <+1932>:	movslq %eax,%rcx
   0x00000000000041a6 <+1935>:	imul   $0x30,%rcx,%rcx
   0x00000000000041aa <+1939>:	add    %r12,%rcx
   0x00000000000041ad <+1942>:	mov    0x18(%rcx),%rdx
   0x00000000000041b1 <+1946>:	mov    0x20(%rcx),%rcx
   0x00000000000041b5 <+1950>:	lea    0xc(%rcx),%rsi
   0x00000000000041b9 <+1954>:	cmp    %rsi,%rdx
   0x00000000000041bc <+1957>:	je     0x41ee <ext4_ext_map_blocks+2007>
   0x00000000000041be <+1959>:	test   %rsi,%rsi
   0x00000000000041c1 <+1962>:	je     0x41c8 <ext4_ext_map_blocks+1969>
   0x00000000000041c3 <+1964>:	mov    0xc(%rcx),%ecx
   0x00000000000041c6 <+1967>:	jmp    0x41ca <ext4_ext_map_blocks+1971>
   0x00000000000041c8 <+1969>:	xor    %ecx,%ecx
   0x00000000000041ca <+1971>:	test   %rdx,%rdx
   0x00000000000041cd <+1974>:	je     0x41d4 <ext4_ext_map_blocks+1981>
   0x00000000000041cf <+1976>:	mov    (%rdx),%r9d
   0x00000000000041d2 <+1979>:	jmp    0x41d7 <ext4_ext_map_blocks+1984>
   0x00000000000041d4 <+1981>:	xor    %r9d,%r9d
   0x00000000000041d7 <+1984>:	mov    %ecx,(%rsp)
   0x00000000000041da <+1987>:	mov    %eax,0x8(%rsp)
   0x00000000000041de <+1991>:	mov    $0x0,%r8
   0x00000000000041e5 <+1998>:	xor    %ecx,%ecx
   0x00000000000041e7 <+2000>:	mov    $0x51b,%edx
   0x00000000000041ec <+2005>:	jmp    0x4214 <ext4_ext_map_blocks+2045>
   0x00000000000041ee <+2007>:	dec    %eax
   0x00000000000041f0 <+2009>:	cmp    $0xffffffff,%eax
   0x00000000000041f3 <+2012>:	jne    0x41a3 <ext4_ext_map_blocks+1932>
   0x00000000000041f5 <+2014>:	jmp    0x4253 <ext4_ext_map_blocks+2108>
   0x00000000000041f7 <+2016>:	lea    (%rcx,%rsi,1),%eax
   0x00000000000041fa <+2019>:	cmp    %eax,%r9d
   0x00000000000041fd <+2022>:	jae    0x422c <ext4_ext_map_blocks+2069>
   0x00000000000041ff <+2024>:	mov    %ecx,0x8(%rsp)
   0x0000000000004203 <+2028>:	mov    %esi,(%rsp)
   0x0000000000004206 <+2031>:	mov    $0x0,%r8
   0x000000000000420d <+2038>:	xor    %ecx,%ecx
   0x000000000000420f <+2040>:	mov    $0x525,%edx
   0x0000000000004214 <+2045>:	mov    $0x0,%rsi
   0x000000000000421b <+2052>:	mov    %rbp,%rdi
   0x000000000000421e <+2055>:	xor    %eax,%eax
   0x0000000000004220 <+2057>:	callq  0x4225 <ext4_ext_map_blocks+2062>
   0x0000000000004225 <+2062>:	mov    $0xfffffffb,%eax
   0x000000000000422a <+2067>:	jmp    0x4255 <ext4_ext_map_blocks+2110>
   0x000000000000422c <+2069>:	dec    %eax
   0x000000000000422e <+2071>:	movslq %ecx,%rcx
   0x0000000000004231 <+2074>:	mov    %eax,0x88(%rsp)
   0x0000000000004238 <+2081>:	movzwl 0x6(%rdx),%eax
   0x000000000000423c <+2085>:	mov    0x8(%rdx),%esi
   0x000000000000423f <+2088>:	shl    $0x20,%rax
   0x0000000000004243 <+2092>:	or     %rsi,%rax
   0x0000000000004246 <+2095>:	lea    -0x1(%rax,%rcx,1),%rax
   0x000000000000424b <+2100>:	mov    %rax,0x98(%rsp)
   0x0000000000004253 <+2108>:	xor    %eax,%eax
   0x0000000000004255 <+2110>:	test   %eax,%eax
   0x0000000000004257 <+2112>:	mov    %eax,0x68(%rsp)
   0x000000000000425b <+2116>:	jne    0x4964 <ext4_ext_map_blocks+3917>
   0x0000000000004261 <+2122>:	mov    0x8(%rbx),%r9d
   0x0000000000004265 <+2126>:	test   %r12,%r12
   0x0000000000004268 <+2129>:	mov    %r9d,0x8c(%rsp)
   0x0000000000004270 <+2137>:	jne    0x428f <ext4_ext_map_blocks+2168>
   0x0000000000004272 <+2139>:	mov    $0x0,%r8
   0x0000000000004279 <+2146>:	xor    %ecx,%ecx
   0x000000000000427b <+2148>:	mov    $0x543,%edx
   0x0000000000004280 <+2153>:	mov    $0x0,%rsi
   0x0000000000004287 <+2160>:	mov    %rbp,%rdi
   0x000000000000428a <+2163>:	jmpq   0x432b <ext4_ext_map_blocks+2324>
   0x000000000000428f <+2168>:	movzwl 0x8(%r12),%edx
   0x0000000000004295 <+2174>:	movq   $0x0,0xa0(%rsp)
   0x00000000000042a1 <+2186>:	movzwl %dx,%r15d
   0x00000000000042a5 <+2190>:	test   %r15d,%r15d
   0x00000000000042a8 <+2193>:	jne    0x42b6 <ext4_ext_map_blocks+2207>
   0x00000000000042aa <+2195>:	cmpq   $0x0,0x10(%r12)
   0x00000000000042b0 <+2201>:	je     0x44d5 <ext4_ext_map_blocks+2750>
   0x00000000000042b6 <+2207>:	imul   $0x30,%rdx,%rdx
   0x00000000000042ba <+2211>:	add    %r12,%rdx
   0x00000000000042bd <+2214>:	mov    0x10(%rdx),%rax
   0x00000000000042c1 <+2218>:	movzwl 0x4(%rax),%esi
   0x00000000000042c5 <+2222>:	cmp    $0x8000,%si
   0x00000000000042ca <+2227>:	jbe    0x42d2 <ext4_ext_map_blocks+2235>
   0x00000000000042cc <+2229>:	sub    $0x8000,%esi
   0x00000000000042d2 <+2235>:	mov    (%rax),%ecx
   0x00000000000042d4 <+2237>:	cmp    %ecx,%r9d
   0x00000000000042d7 <+2240>:	jae    0x4340 <ext4_ext_map_blocks+2345>
   0x00000000000042d9 <+2242>:	mov    0x20(%rdx),%r13
   0x00000000000042dd <+2246>:	add    $0xc,%r13
   0x00000000000042e1 <+2250>:	cmp    %rax,%r13
   0x00000000000042e4 <+2253>:	je     0x4335 <ext4_ext_map_blocks+2334>
   0x00000000000042e6 <+2255>:	mov    %r15d,%r9d
   0x00000000000042e9 <+2258>:	mov    $0x0,%r8
   0x00000000000042f0 <+2265>:	xor    %ecx,%ecx
   0x00000000000042f2 <+2267>:	mov    $0x556,%edx
   0x00000000000042f7 <+2272>:	jmp    0x431f <ext4_ext_map_blocks+2312>
   0x00000000000042f9 <+2274>:	movslq %r15d,%rax
   0x00000000000042fc <+2277>:	imul   $0x30,%rax,%rax
   0x0000000000004300 <+2281>:	add    %r12,%rax
   0x0000000000004303 <+2284>:	mov    0x20(%rax),%rdx
   0x0000000000004307 <+2288>:	add    $0xc,%rdx
   0x000000000000430b <+2292>:	cmp    %rdx,0x18(%rax)
   0x000000000000430f <+2296>:	je     0x4335 <ext4_ext_map_blocks+2334>
   0x0000000000004311 <+2298>:	mov    $0x0,%r8
   0x0000000000004318 <+2305>:	xor    %ecx,%ecx
   0x000000000000431a <+2307>:	mov    $0x55e,%edx
   0x000000000000431f <+2312>:	mov    $0x0,%rsi
   0x0000000000004326 <+2319>:	mov    %rbp,%rdi
   0x0000000000004329 <+2322>:	xor    %eax,%eax
   0x000000000000432b <+2324>:	callq  0x4330 <ext4_ext_map_blocks+2329>
   0x0000000000004330 <+2329>:	jmpq   0x4498 <ext4_ext_map_blocks+2689>
   0x0000000000004335 <+2334>:	dec    %r15d
   0x0000000000004338 <+2337>:	cmp    $0xffffffff,%r15d
   0x000000000000433c <+2341>:	jne    0x42f9 <ext4_ext_map_blocks+2274>
   0x000000000000433e <+2343>:	jmp    0x438b <ext4_ext_map_blocks+2420>
   0x0000000000004340 <+2345>:	lea    (%rsi,%rcx,1),%edi
   0x0000000000004343 <+2348>:	cmp    %edi,%r9d
   0x0000000000004346 <+2351>:	jae    0x4373 <ext4_ext_map_blocks+2396>
   0x0000000000004348 <+2353>:	mov    %esi,0x8(%rsp)
   0x000000000000434c <+2357>:	mov    %ecx,(%rsp)
   0x000000000000434f <+2360>:	mov    $0x0,%r8
   0x0000000000004356 <+2367>:	xor    %ecx,%ecx
   0x0000000000004358 <+2369>:	mov    $0x568,%edx
   0x000000000000435d <+2374>:	mov    $0x0,%rsi
   0x0000000000004364 <+2381>:	mov    %rbp,%rdi
   0x0000000000004367 <+2384>:	xor    %eax,%eax
   0x0000000000004369 <+2386>:	callq  0x436e <ext4_ext_map_blocks+2391>
   0x000000000000436e <+2391>:	jmpq   0x4498 <ext4_ext_map_blocks+2689>
   0x0000000000004373 <+2396>:	mov    0x20(%rdx),%rdx
   0x0000000000004377 <+2400>:	movzwl 0x2(%rdx),%ecx
   0x000000000000437b <+2404>:	imul   $0xc,%rcx,%rcx
   0x000000000000437f <+2408>:	add    %rcx,%rdx
   0x0000000000004382 <+2411>:	cmp    %rdx,%rax
   0x0000000000004385 <+2414>:	je     0x43b5 <ext4_ext_map_blocks+2462>
   0x0000000000004387 <+2416>:	lea    0xc(%rax),%r13
   0x000000000000438b <+2420>:	xor    %r8d,%r8d
   0x000000000000438e <+2423>:	jmpq   0x44a2 <ext4_ext_map_blocks+2699>
   0x0000000000004393 <+2428>:	movslq %r15d,%rdx
   0x0000000000004396 <+2431>:	imul   $0x30,%rdx,%rdx
   0x000000000000439a <+2435>:	add    %r12,%rdx
   0x000000000000439d <+2438>:	mov    0x18(%rdx),%rax
   0x00000000000043a1 <+2442>:	mov    0x20(%rdx),%rdx
   0x00000000000043a5 <+2446>:	movzwl 0x2(%rdx),%ecx
   0x00000000000043a9 <+2450>:	imul   $0xc,%rcx,%rcx
   0x00000000000043ad <+2454>:	add    %rcx,%rdx
   0x00000000000043b0 <+2457>:	cmp    %rdx,%rax
   0x00000000000043b3 <+2460>:	jne    0x43c3 <ext4_ext_map_blocks+2476>
   0x00000000000043b5 <+2462>:	dec    %r15d
   0x00000000000043b8 <+2465>:	cmp    $0xffffffff,%r15d
   0x00000000000043bc <+2469>:	jne    0x4393 <ext4_ext_map_blocks+2428>
   0x00000000000043be <+2471>:	jmpq   0x44d5 <ext4_ext_map_blocks+2750>
   0x00000000000043c3 <+2476>:	movzwl 0x14(%rax),%esi
   0x00000000000043c7 <+2480>:	mov    0x10(%rax),%eax
   0x00000000000043ca <+2483>:	shl    $0x20,%rsi
   0x00000000000043ce <+2487>:	or     %rax,%rsi
   0x00000000000043d1 <+2490>:	jmp    0x4437 <ext4_ext_map_blocks+2592>
   0x00000000000043d3 <+2492>:	callq  0x43d8 <ext4_ext_map_blocks+2497>
   0x00000000000043d8 <+2497>:	test   %rax,%rax
   0x00000000000043db <+2500>:	mov    %rax,%r13
   0x00000000000043de <+2503>:	jne    0x43e5 <ext4_ext_map_blocks+2510>
   0x00000000000043e0 <+2505>:	jmpq   0x4498 <ext4_ext_map_blocks+2689>
   0x00000000000043e5 <+2510>:	movzwl 0x8(%r12),%edx
   0x00000000000043eb <+2516>:	mov    0x28(%rax),%r8
   0x00000000000043ef <+2520>:	mov    %rax,%rcx
   0x00000000000043f2 <+2523>:	mov    %rbp,%rdi
   0x00000000000043f5 <+2526>:	mov    %r8,%rsi
   0x00000000000043f8 <+2529>:	mov    %r8,0x18(%rsp)
   0x00000000000043fd <+2534>:	sub    %r15d,%edx
   0x0000000000004400 <+2537>:	callq  0x48d <__ext4_ext_check_block>
   0x0000000000004405 <+2542>:	test   %eax,%eax
   0x0000000000004407 <+2544>:	mov    0x18(%rsp),%r8
   0x000000000000440c <+2549>:	je     0x4414 <ext4_ext_map_blocks+2557>
   0x000000000000440e <+2551>:	lea    0x60(%r13),%rdi
   0x0000000000004412 <+2555>:	jmp    0x4493 <ext4_ext_map_blocks+2684>
   0x0000000000004414 <+2557>:	movzwl 0x14(%r8),%esi
   0x0000000000004419 <+2562>:	mov    0x10(%r8),%eax
   0x000000000000441d <+2566>:	shl    $0x20,%rsi
   0x0000000000004421 <+2570>:	or     %rax,%rsi
   0x0000000000004424 <+2573>:	lea    0x60(%r13),%rdi
   0x0000000000004428 <+2577>:	mov    %rsi,0x20(%rsp)
   0x000000000000442d <+2582>:	callq  0x0 <atomic_dec>
   0x0000000000004432 <+2587>:	mov    0x20(%rsp),%rsi
   0x0000000000004437 <+2592>:	movzwl 0x8(%r12),%eax
   0x000000000000443d <+2598>:	inc    %r15d
   0x0000000000004440 <+2601>:	cmp    %eax,%r15d
   0x0000000000004443 <+2604>:	mov    0x28(%rbp),%rax
   0x0000000000004447 <+2608>:	mov    0x18(%rax),%rdx
   0x000000000000444b <+2612>:	mov    0x120(%rax),%rdi
   0x0000000000004452 <+2619>:	jl     0x43d3 <ext4_ext_map_blocks+2492>
   0x0000000000004458 <+2625>:	callq  0x445d <ext4_ext_map_blocks+2630>
   0x000000000000445d <+2630>:	test   %rax,%rax
   0x0000000000004460 <+2633>:	je     0x4498 <ext4_ext_map_blocks+2689>
   0x0000000000004462 <+2635>:	movzwl 0x8(%r12),%edx
   0x0000000000004468 <+2641>:	mov    0x28(%rax),%r13
   0x000000000000446c <+2645>:	mov    %rax,%rcx
   0x000000000000446f <+2648>:	mov    %rbp,%rdi
   0x0000000000004472 <+2651>:	mov    %rax,0x18(%rsp)
   0x0000000000004477 <+2656>:	mov    %r13,%rsi
   0x000000000000447a <+2659>:	add    $0xc,%r13
   0x000000000000447e <+2663>:	sub    %r15d,%edx
   0x0000000000004481 <+2666>:	callq  0x48d <__ext4_ext_check_block>
   0x0000000000004486 <+2671>:	test   %eax,%eax
   0x0000000000004488 <+2673>:	mov    0x18(%rsp),%r8
   0x000000000000448d <+2678>:	je     0x44a2 <ext4_ext_map_blocks+2699>
   0x000000000000448f <+2680>:	lea    0x60(%r8),%rdi
   0x0000000000004493 <+2684>:	callq  0x0 <atomic_dec>
   0x0000000000004498 <+2689>:	xor    %r13d,%r13d
   0x000000000000449b <+2692>:	mov    $0xfffffffb,%eax
   0x00000000000044a0 <+2697>:	jmp    0x44da <ext4_ext_map_blocks+2755>
   0x00000000000044a2 <+2699>:	mov    0x0(%r13),%eax
   0x00000000000044a6 <+2703>:	mov    %eax,0x8c(%rsp)
   0x00000000000044ad <+2710>:	movzwl 0x6(%r13),%eax
   0x00000000000044b2 <+2715>:	mov    0x8(%r13),%edx
   0x00000000000044b6 <+2719>:	shl    $0x20,%rax
   0x00000000000044ba <+2723>:	or     %rdx,%rax
   0x00000000000044bd <+2726>:	test   %r8,%r8
   0x00000000000044c0 <+2729>:	mov    %rax,0xa0(%rsp)
   0x00000000000044c8 <+2737>:	je     0x44d8 <ext4_ext_map_blocks+2753>
   0x00000000000044ca <+2739>:	lea    0x60(%r8),%rdi
   0x00000000000044ce <+2743>:	callq  0x0 <atomic_dec>
   0x00000000000044d3 <+2748>:	jmp    0x44d8 <ext4_ext_map_blocks+2753>
   0x00000000000044d5 <+2750>:	xor    %r13d,%r13d
   0x00000000000044d8 <+2753>:	xor    %eax,%eax
   0x00000000000044da <+2755>:	test   %eax,%eax
   0x00000000000044dc <+2757>:	mov    %eax,0x68(%rsp)
   0x00000000000044e0 <+2761>:	jne    0x4964 <ext4_ext_map_blocks+3917>
   0x00000000000044e6 <+2767>:	cmpl   $0x1,0x50(%r14)
   0x00000000000044eb <+2772>:	jbe    0x4536 <ext4_ext_map_blocks+2847>
   0x00000000000044ed <+2774>:	test   %r13,%r13
   0x00000000000044f0 <+2777>:	je     0x4536 <ext4_ext_map_blocks+2847>
   0x00000000000044f2 <+2779>:	mov    0x28(%rbp),%rdi
   0x00000000000044f6 <+2783>:	mov    %r12,%rcx
   0x00000000000044f9 <+2786>:	mov    %r13,%rdx
   0x00000000000044fc <+2789>:	mov    %rbx,%rsi
   0x00000000000044ff <+2792>:	callq  0x99b <get_implied_cluster_alloc>
   0x0000000000004504 <+2797>:	test   %eax,%eax
   0x0000000000004506 <+2799>:	je     0x4536 <ext4_ext_map_blocks+2847>
   0x0000000000004508 <+2801>:	mov    0xc(%rbx),%r13d
   0x000000000000450c <+2805>:	mov    (%rbx),%rax
   0x000000000000450f <+2808>:	xor    %r15d,%r15d
   0x0000000000004512 <+2811>:	orl    $0x2000000,0x10(%rbx)
   0x0000000000004519 <+2818>:	xor    %r8d,%r8d
   0x000000000000451c <+2821>:	movl   $0x0,0x44(%rsp)
   0x0000000000004524 <+2829>:	mov    %r13d,0x80(%rsp)
   0x000000000000452c <+2837>:	mov    %rax,0x30(%rsp)
   0x0000000000004531 <+2842>:	jmpq   0x46fb <ext4_ext_map_blocks+3300>
   0x0000000000004536 <+2847>:	cmpl   $0x8000,0xc(%rbx)
   0x000000000000453d <+2854>:	jbe    0x454f <ext4_ext_map_blocks+2872>
   0x000000000000453f <+2856>:	testb  $0x2,0x40(%rsp)
   0x0000000000004544 <+2861>:	jne    0x4551 <ext4_ext_map_blocks+2874>
   0x0000000000004546 <+2863>:	movl   $0x8000,0xc(%rbx)
   0x000000000000454d <+2870>:	jmp    0x455f <ext4_ext_map_blocks+2888>
   0x000000000000454f <+2872>:	jne    0x455f <ext4_ext_map_blocks+2888>
   0x0000000000004551 <+2874>:	testb  $0x2,0x40(%rsp)
   0x0000000000004556 <+2879>:	je     0x455f <ext4_ext_map_blocks+2888>
   0x0000000000004558 <+2881>:	movl   $0x7fff,0xc(%rbx)
   0x000000000000455f <+2888>:	mov    0xc(%rbx),%r13d
   0x0000000000004563 <+2892>:	mov    0x6c(%rsp),%r15d
   0x0000000000004568 <+2897>:	movzwl %r13w,%ecx
   0x000000000000456c <+2901>:	cmp    $0x8000,%r13w
   0x0000000000004572 <+2907>:	mov    %r13w,0x70(%rsp)
   0x0000000000004578 <+2913>:	ja     0x457c <ext4_ext_map_blocks+2917>
   0x000000000000457a <+2915>:	jmp    0x4582 <ext4_ext_map_blocks+2923>
   0x000000000000457c <+2917>:	sub    $0x8000,%ecx
   0x0000000000004582 <+2923>:	movzwl -0xaa(%rbp),%eax
   0x0000000000004589 <+2930>:	mov    %ecx,%r8d
   0x000000000000458c <+2933>:	imul   $0x30,%rax,%rax
   0x0000000000004590 <+2937>:	mov    0x10(%r12,%rax,1),%rax
   0x0000000000004595 <+2942>:	test   %rax,%rax
   0x0000000000004598 <+2945>:	je     0x45ff <ext4_ext_map_blocks+3048>
   0x000000000000459a <+2947>:	mov    0x50(%r14),%esi
   0x000000000000459e <+2951>:	mov    (%rax),%edx
   0x00000000000045a0 <+2953>:	neg    %esi
   0x00000000000045a2 <+2955>:	and    %esi,%edx
   0x00000000000045a4 <+2957>:	cmp    %r15d,%edx
   0x00000000000045a7 <+2960>:	jae    0x45d3 <ext4_ext_map_blocks+3004>
   0x00000000000045a9 <+2962>:	mov    %r12,%rdi
   0x00000000000045ac <+2965>:	mov    %ecx,0x28(%rsp)
   0x00000000000045b0 <+2969>:	mov    %esi,0x20(%rsp)
   0x00000000000045b4 <+2973>:	mov    %ecx,0x18(%rsp)
   0x00000000000045b8 <+2977>:	callq  0x195 <ext4_ext_next_allocated_block>
   0x00000000000045bd <+2982>:	cmp    $0xffffffff,%eax
   0x00000000000045c0 <+2985>:	mov    0x28(%rsp),%ecx
   0x00000000000045c4 <+2989>:	mov    0x20(%rsp),%esi
   0x00000000000045c8 <+2993>:	mov    0x18(%rsp),%r8d
   0x00000000000045cd <+2998>:	je     0x45ff <ext4_ext_map_blocks+3048>
   0x00000000000045cf <+3000>:	mov    %esi,%edx
   0x00000000000045d1 <+3002>:	and    %eax,%edx
   0x00000000000045d3 <+3004>:	xor    %eax,%eax
   0x00000000000045d5 <+3006>:	add    %r15d,%ecx
   0x00000000000045d8 <+3009>:	jae    0x45e8 <ext4_ext_map_blocks+3025>
   0x00000000000045da <+3011>:	mov    %r15d,%r8d
   0x00000000000045dd <+3014>:	mov    $0x1,%al
   0x00000000000045df <+3016>:	not    %r8d
   0x00000000000045e2 <+3019>:	mov    %r8w,0x70(%rsp)
   0x00000000000045e8 <+3025>:	add    %r15d,%r8d
   0x00000000000045eb <+3028>:	cmp    %edx,%r8d
   0x00000000000045ee <+3031>:	jbe    0x4601 <ext4_ext_map_blocks+3050>
   0x00000000000045f0 <+3033>:	sub    %r15d,%edx
   0x00000000000045f3 <+3036>:	mov    $0x1,%eax
   0x00000000000045f8 <+3041>:	mov    %dx,0x70(%rsp)
   0x00000000000045fd <+3046>:	jmp    0x4601 <ext4_ext_map_blocks+3050>
   0x00000000000045ff <+3048>:	xor    %eax,%eax
   0x0000000000004601 <+3050>:	test   %eax,%eax
   0x0000000000004603 <+3052>:	mov    %eax,0x68(%rsp)
   0x0000000000004607 <+3056>:	je     0x461e <ext4_ext_map_blocks+3079>
   0x0000000000004609 <+3058>:	movzwl 0x70(%rsp),%r13d
   0x000000000000460f <+3064>:	cmp    $0x8000,%r13w
   0x0000000000004615 <+3070>:	jbe    0x461e <ext4_ext_map_blocks+3079>
   0x0000000000004617 <+3072>:	sub    $0x8000,%r13d
   0x000000000000461e <+3079>:	mov    0x8(%rbx),%edx
   0x0000000000004621 <+3082>:	mov    %r12,%rsi
   0x0000000000004624 <+3085>:	mov    %rbp,%rdi
   0x0000000000004627 <+3088>:	mov    %rbp,0x78(%rsp)
   0x000000000000462c <+3093>:	callq  0x2b <ext4_ext_find_goal>
   0x0000000000004631 <+3098>:	mov    0x50(%r14),%edx
   0x0000000000004635 <+3102>:	mov    0x8(%rbx),%esi
   0x0000000000004638 <+3105>:	mov    0x54(%r14),%ecx
   0x000000000000463c <+3109>:	dec    %edx
   0x000000000000463e <+3111>:	mov    %edx,%r8d
   0x0000000000004641 <+3114>:	and    %esi,%r8d
   0x0000000000004644 <+3117>:	add    %r8d,%edx
   0x0000000000004647 <+3120>:	sub    %r8d,%esi
   0x000000000000464a <+3123>:	add    %r13d,%edx
   0x000000000000464d <+3126>:	mov    %esi,0x84(%rsp)
   0x0000000000004654 <+3133>:	shr    %cl,%edx
   0x0000000000004656 <+3135>:	mov    %edx,0x80(%rsp)
   0x000000000000465d <+3142>:	mov    %r8d,%edx
   0x0000000000004660 <+3145>:	sub    %rdx,%rax
   0x0000000000004663 <+3148>:	mov    0x0(%rbp),%edx
   0x0000000000004666 <+3151>:	mov    %rax,0x90(%rsp)
   0x000000000000466e <+3159>:	mov    $0x20,%eax
   0x0000000000004673 <+3164>:	and    $0xf000,%dx
   0x0000000000004678 <+3169>:	cmp    $0x8000,%dx
   0x000000000000467d <+3174>:	mov    $0x0,%edx
   0x0000000000004682 <+3179>:	cmovne %edx,%eax
   0x0000000000004685 <+3182>:	testb  $0x40,0x40(%rsp)
   0x000000000000468a <+3187>:	mov    %eax,0xa8(%rsp)
   0x0000000000004691 <+3194>:	je     0x469b <ext4_ext_map_blocks+3204>
   0x0000000000004693 <+3196>:	orl    $0x40,0xa8(%rsp)
   0x000000000000469b <+3204>:	mov    0x38(%rsp),%rdi
   0x00000000000046a0 <+3209>:	lea    0x68(%rsp),%rdx
   0x00000000000046a5 <+3214>:	lea    0x78(%rsp),%rsi
   0x00000000000046aa <+3219>:	mov    %r8d,0x18(%rsp)
   0x00000000000046af <+3224>:	callq  0x46b4 <ext4_ext_map_blocks+3229>
   0x00000000000046b4 <+3229>:	test   %rax,%rax
   0x00000000000046b7 <+3232>:	mov    %rax,0x30(%rsp)
   0x00000000000046bc <+3237>:	mov    0x18(%rsp),%r8d
   0x00000000000046c1 <+3242>:	je     0x4970 <ext4_ext_map_blocks+3929>
   0x00000000000046c7 <+3248>:	mov    0x80(%rsp),%r15d
   0x00000000000046cf <+3256>:	mov    0x54(%r14),%ecx
   0x00000000000046d3 <+3260>:	mov    %r15d,%edx
   0x00000000000046d6 <+3263>:	shl    %cl,%edx
   0x00000000000046d8 <+3265>:	mov    %edx,%ecx
   0x00000000000046da <+3267>:	sub    %r8d,%ecx
   0x00000000000046dd <+3270>:	cmp    %r13d,%ecx
   0x00000000000046e0 <+3273>:	ja     0x46eb <ext4_ext_map_blocks+3284>
   0x00000000000046e2 <+3275>:	mov    %ecx,0x80(%rsp)
   0x00000000000046e9 <+3282>:	jmp    0x46f3 <ext4_ext_map_blocks+3292>
   0x00000000000046eb <+3284>:	mov    %r13d,0x80(%rsp)
   0x00000000000046f3 <+3292>:	movl   $0x1,0x44(%rsp)
   0x00000000000046fb <+3300>:	mov    0x80(%rsp),%eax
   0x0000000000004702 <+3307>:	add    0x30(%rsp),%r8
   0x0000000000004707 <+3312>:	movl   $0x0,0x58(%rsp)
   0x000000000000470f <+3320>:	mov    %ax,0x70(%rsp)
   0x0000000000004714 <+3325>:	mov    0x40(%rsp),%eax
   0x0000000000004718 <+3329>:	mov    %r8d,0x74(%rsp)
   0x000000000000471d <+3334>:	shr    $0x20,%r8
   0x0000000000004721 <+3338>:	mov    %r8w,0x72(%rsp)
   0x0000000000004727 <+3344>:	and    $0x2,%eax
   0x000000000000472a <+3347>:	mov    %eax,0x5c(%rsp)
   0x000000000000472e <+3351>:	je     0x475b <ext4_ext_map_blocks+3396>
   0x0000000000004730 <+3353>:	lea    0x70(%rsp),%rdi
   0x0000000000004735 <+3358>:	callq  0x202 <ext4_ext_mark_uninitialized>
   0x000000000000473a <+3363>:	mov    0x40(%rsp),%edx
   0x000000000000473e <+3367>:	mov    %rbp,%rdi
   0x0000000000004741 <+3370>:	shr    $0x3,%edx
   0x0000000000004744 <+3373>:	and    $0x1,%edx
   0x0000000000004747 <+3376>:	mov    %edx,0x58(%rsp)
   0x000000000000474b <+3380>:	callq  0x10a1 <ext4_should_dioread_nolock>
   0x0000000000004750 <+3385>:	test   %eax,%eax
   0x0000000000004752 <+3387>:	je     0x475b <ext4_ext_map_blocks+3396>
   0x0000000000004754 <+3389>:	orl    $0x1000000,0x10(%rbx)
   0x000000000000475b <+3396>:	testb  $0x80,0x40(%rsp)
   0x0000000000004760 <+3401>:	movl   $0x0,0x68(%rsp)
   0x0000000000004768 <+3409>:	jne    0x4789 <ext4_ext_map_blocks+3442>
   0x000000000000476a <+3411>:	mov    0x8(%rbx),%edx
   0x000000000000476d <+3414>:	mov    0x80(%rsp),%r8d
   0x0000000000004775 <+3422>:	mov    %r12,%rcx
   0x0000000000004778 <+3425>:	mov    0x38(%rsp),%rdi
   0x000000000000477d <+3430>:	mov    %rbp,%rsi
   0x0000000000004780 <+3433>:	callq  0x568 <check_eofblocks_fl>
   0x0000000000004785 <+3438>:	mov    %eax,0x68(%rsp)
   0x0000000000004789 <+3442>:	cmpl   $0x0,0x68(%rsp)
   0x000000000000478e <+3447>:	jne    0x47ae <ext4_ext_map_blocks+3479>
   0x0000000000004790 <+3449>:	mov    0x40(%rsp),%r8d
   0x0000000000004795 <+3454>:	mov    0x38(%rsp),%rdi
   0x000000000000479a <+3459>:	lea    0x6c(%rsp),%rcx
   0x000000000000479f <+3464>:	mov    %r12,%rdx
   0x00000000000047a2 <+3467>:	mov    %rbp,%rsi
   0x00000000000047a5 <+3470>:	callq  0x47aa <ext4_ext_map_blocks+3475>
   0x00000000000047aa <+3475>:	mov    %eax,0x68(%rsp)
   0x00000000000047ae <+3479>:	cmpl   $0x0,0x68(%rsp)
   0x00000000000047b3 <+3484>:	jne    0x47e4 <ext4_ext_map_blocks+3533>
   0x00000000000047b5 <+3486>:	cmpl   $0x0,0x58(%rsp)
   0x00000000000047ba <+3491>:	je     0x47e4 <ext4_ext_map_blocks+3533>
   0x00000000000047bc <+3493>:	cmpq   $0x0,0x48(%rsp)
   0x00000000000047c2 <+3499>:	je     0x47d7 <ext4_ext_map_blocks+3520>
   0x00000000000047c4 <+3501>:	mov    0x48(%rsp),%rsi
   0x00000000000047c9 <+3506>:	mov    %rbp,%rdi
   0x00000000000047cc <+3509>:	add    $0x18,%rsi
   0x00000000000047d0 <+3513>:	callq  0x77 <ext4_set_io_unwritten_flag>
   0x00000000000047d5 <+3518>:	jmp    0x47e4 <ext4_ext_map_blocks+3533>
   0x00000000000047d7 <+3520>:	mov    $0x6,%esi
   0x00000000000047dc <+3525>:	mov    %rbp,%rdi
   0x00000000000047df <+3528>:	callq  0x17 <ext4_set_inode_state>
   0x00000000000047e4 <+3533>:	cmpl   $0x0,0x68(%rsp)
   0x00000000000047e9 <+3538>:	je     0x484c <ext4_ext_map_blocks+3637>
   0x00000000000047eb <+3540>:	cmpl   $0x0,0x44(%rsp)
   0x00000000000047f0 <+3545>:	je     0x484c <ext4_ext_map_blocks+3637>
   0x00000000000047f2 <+3547>:	mov    0x40(%rsp),%r9d
   0x00000000000047f7 <+3552>:	mov    %rbp,%rdi
   0x00000000000047fa <+3555>:	add    %r9d,%r9d
   0x00000000000047fd <+3558>:	and    $0x8,%r9d
   0x0000000000004801 <+3562>:	mov    %r9d,0x20(%rsp)
   0x0000000000004806 <+3567>:	callq  0x480b <ext4_ext_map_blocks+3572>
   0x000000000000480b <+3572>:	movzwl 0x70(%rsp),%r8d
   0x0000000000004811 <+3578>:	mov    0x20(%rsp),%r9d
   0x0000000000004816 <+3583>:	cmp    $0x8000,%r8w
   0x000000000000481c <+3589>:	jbe    0x4825 <ext4_ext_map_blocks+3598>
   0x000000000000481e <+3591>:	sub    $0x8000,%r8d
   0x0000000000004825 <+3598>:	movzwl 0x72(%rsp),%ecx
   0x000000000000482a <+3603>:	mov    0x74(%rsp),%eax
   0x000000000000482e <+3607>:	movslq %r8d,%r8
   0x0000000000004831 <+3610>:	mov    0x38(%rsp),%rdi
   0x0000000000004836 <+3615>:	xor    %edx,%edx
   0x0000000000004838 <+3617>:	mov    %rbp,%rsi
   0x000000000000483b <+3620>:	shl    $0x20,%rcx
   0x000000000000483f <+3624>:	or     %rax,%rcx
   0x0000000000004842 <+3627>:	callq  0x4847 <ext4_ext_map_blocks+3632>
   0x0000000000004847 <+3632>:	jmpq   0x4970 <ext4_ext_map_blocks+3929>
   0x000000000000484c <+3637>:	movzwl 0x72(%rsp),%eax
   0x0000000000004851 <+3642>:	movzwl 0x70(%rsp),%r13d
   0x0000000000004857 <+3648>:	shl    $0x20,%rax
   0x000000000000485b <+3652>:	mov    %rax,0x30(%rsp)
   0x0000000000004860 <+3657>:	mov    0x74(%rsp),%eax
   0x0000000000004864 <+3661>:	or     %rax,0x30(%rsp)
   0x0000000000004869 <+3666>:	cmp    $0x8000,%r13w
   0x000000000000486f <+3672>:	jbe    0x4878 <ext4_ext_map_blocks+3681>
   0x0000000000004871 <+3674>:	sub    $0x8000,%r13d
   0x0000000000004878 <+3681>:	mov    0xc(%rbx),%eax
   0x000000000000487b <+3684>:	cmp    %eax,%r13d
   0x000000000000487e <+3687>:	cmova  %eax,%r13d
   0x0000000000004882 <+3691>:	orl    $0x40,0x10(%rbx)
   0x0000000000004886 <+3695>:	testb  $0x4,0x40(%rsp)
   0x000000000000488b <+3700>:	je     0x4918 <ext4_ext_map_blocks+3841>
   0x0000000000004891 <+3706>:	mov    0x8(%rbx),%esi
   0x0000000000004894 <+3709>:	mov    %r13d,%edx
   0x0000000000004897 <+3712>:	mov    %rbp,%rdi
   0x000000000000489a <+3715>:	callq  0xf51 <get_reserved_cluster_alloc>
   0x000000000000489f <+3720>:	testb  $0x2,0x13(%rbx)
   0x00000000000048a3 <+3724>:	je     0x48b7 <ext4_ext_map_blocks+3744>
   0x00000000000048a5 <+3726>:	test   %eax,%eax
   0x00000000000048a7 <+3728>:	je     0x4918 <ext4_ext_map_blocks+3841>
   0x00000000000048a9 <+3730>:	xor    %edx,%edx
   0x00000000000048ab <+3732>:	mov    %eax,%esi
   0x00000000000048ad <+3734>:	mov    %rbp,%rdi
   0x00000000000048b0 <+3737>:	callq  0x48b5 <ext4_ext_map_blocks+3742>
   0x00000000000048b5 <+3742>:	jmp    0x4918 <ext4_ext_map_blocks+3841>
   0x00000000000048b7 <+3744>:	cmp    %eax,%r15d
   0x00000000000048ba <+3747>:	jae    0x48be <ext4_ext_map_blocks+3751>
   0x00000000000048bc <+3749>:	ud2    
   0x00000000000048be <+3751>:	mov    $0x1,%edx
   0x00000000000048c3 <+3756>:	mov    %r15d,%esi
   0x00000000000048c6 <+3759>:	mov    %rbp,%rdi
   0x00000000000048c9 <+3762>:	mov    %eax,0x18(%rsp)
   0x00000000000048cd <+3766>:	callq  0x48d2 <ext4_ext_map_blocks+3771>
   0x00000000000048d2 <+3771>:	mov    0x18(%rsp),%eax
   0x00000000000048d6 <+3775>:	cmp    %r15d,%eax
   0x00000000000048d9 <+3778>:	jae    0x4918 <ext4_ext_map_blocks+3841>
   0x00000000000048db <+3780>:	mov    0x54(%r14),%ecx
   0x00000000000048df <+3784>:	sub    %eax,%r15d
   0x00000000000048e2 <+3787>:	mov    $0x3,%edx
   0x00000000000048e7 <+3792>:	mov    %r15d,%esi
   0x00000000000048ea <+3795>:	mov    %rbp,%rdi
   0x00000000000048ed <+3798>:	shl    %cl,%esi
   0x00000000000048ef <+3800>:	mov    0x8c(%rbp),%ecx
   0x00000000000048f5 <+3806>:	movslq %esi,%rsi
   0x00000000000048f8 <+3809>:	shl    %cl,%rsi
   0x00000000000048fb <+3812>:	callq  0x4900 <ext4_ext_map_blocks+3817>
   0x0000000000004900 <+3817>:	mov    0x50(%rsp),%rdi
   0x0000000000004905 <+3822>:	callq  0x490a <ext4_ext_map_blocks+3827>
   0x000000000000490a <+3827>:	add    %r15d,0x260(%rbp)
   0x0000000000004911 <+3834>:	addb   $0x1,0x29c(%rbp)
   0x0000000000004918 <+3841>:	xor    %edx,%edx
   0x000000000000491a <+3843>:	cmpl   $0x0,0x5c(%rsp)
   0x000000000000491f <+3848>:	jne    0x493b <ext4_ext_map_blocks+3876>
   0x0000000000004921 <+3850>:	mov    0x8(%rbx),%esi
   0x0000000000004924 <+3853>:	mov    0x30(%rsp),%rcx
   0x0000000000004929 <+3858>:	mov    %r13d,%edx
   0x000000000000492c <+3861>:	mov    %rbp,%rdi
   0x000000000000492f <+3864>:	callq  0x5f1 <ext4_ext_put_in_cache>
   0x0000000000004934 <+3869>:	mov    $0x1,%edx
   0x0000000000004939 <+3874>:	jmp    0x493b <ext4_ext_map_blocks+3876>
   0x000000000000493b <+3876>:	mov    0x38(%rsp),%rdi
   0x0000000000004940 <+3881>:	mov    %rbp,%rsi
   0x0000000000004943 <+3884>:	callq  0x8a <ext4_update_inode_fsync_trans>
   0x0000000000004948 <+3889>:	mov    0xc(%rbx),%eax
   0x000000000000494b <+3892>:	cmp    %eax,%r13d
   0x000000000000494e <+3895>:	cmova  %eax,%r13d
   0x0000000000004952 <+3899>:	mov    0x30(%rsp),%rax
   0x0000000000004957 <+3904>:	orl    $0x20,0x10(%rbx)
   0x000000000000495b <+3908>:	mov    %r13d,0xc(%rbx)
   0x000000000000495f <+3912>:	mov    %rax,(%rbx)
   0x0000000000004962 <+3915>:	jmp    0x4970 <ext4_ext_map_blocks+3929>
   0x0000000000004964 <+3917>:	xor    %r13d,%r13d
   0x0000000000004967 <+3920>:	movq   $0x0,0x30(%rsp)
   0x0000000000004970 <+3929>:	test   %r12,%r12
   0x0000000000004973 <+3932>:	je     0x4985 <ext4_ext_map_blocks+3950>
   0x0000000000004975 <+3934>:	mov    %r12,%rdi
   0x0000000000004978 <+3937>:	callq  0x497d <ext4_ext_map_blocks+3942>
   0x000000000000497d <+3942>:	mov    %r12,%rdi
   0x0000000000004980 <+3945>:	callq  0x4985 <ext4_ext_map_blocks+3950>
   0x0000000000004985 <+3950>:	mov    0x68(%rsp),%r15d
   0x000000000000498a <+3955>:	mov    0x0(%rip),%eax        # 0x4990 <ext4_ext_map_blocks+3961>
   0x0000000000004990 <+3961>:	mov    0xc(%rbx),%r12d
   0x0000000000004994 <+3965>:	mov    0x8(%rbx),%r14d
   0x0000000000004998 <+3969>:	test   %r15d,%r15d
   0x000000000000499b <+3972>:	cmove  %r13d,%r15d
   0x000000000000499f <+3976>:	test   %eax,%eax
   0x00000000000049a1 <+3978>:	jne    0x4a3e <ext4_ext_map_blocks+4135>
   0x00000000000049a7 <+3984>:	mov    0x68(%rsp),%r14d
   0x00000000000049ac <+3989>:	test   %r14d,%r14d
   0x00000000000049af <+3992>:	cmove  %r13d,%r14d
   0x00000000000049b3 <+3996>:	jmpq   0x4a53 <ext4_ext_map_blocks+4156>
   0x00000000000049b8 <+4001>:	mov    0x8(%rbx),%rdi
   0x00000000000049bc <+4005>:	mov    %r15d,%r9d
   0x00000000000049bf <+4008>:	mov    %r12d,%r8d
   0x00000000000049c2 <+4011>:	mov    0x30(%rsp),%rcx
   0x00000000000049c7 <+4016>:	mov    %r14d,%edx
   0x00000000000049ca <+4019>:	mov    %rbp,%rsi
   0x00000000000049cd <+4022>:	callq  *(%rbx)
   0x00000000000049cf <+4024>:	add    $0x10,%rbx
   0x00000000000049d3 <+4028>:	cmpq   $0x0,(%rbx)
   0x00000000000049d7 <+4032>:	jmp    0x4a48 <ext4_ext_map_blocks+4145>
   0x00000000000049d9 <+4034>:	mov    0x0(%rip),%r15        # 0x49e0 <ext4_ext_map_blocks+4041>
   0x00000000000049e0 <+4041>:	test   %r15,%r15
   0x00000000000049e3 <+4044>:	jne    0x3a93 <ext4_ext_map_blocks+124>
   0x00000000000049e9 <+4050>:	jmpq   0x3a6c <ext4_ext_map_blocks+85>
   0x00000000000049ee <+4055>:	mov    0x0(%rip),%r13        # 0x49f5 <ext4_ext_map_blocks+4062>
   0x00000000000049f5 <+4062>:	test   %r13,%r13
   0x00000000000049f8 <+4065>:	jne    0x3b0b <ext4_ext_map_blocks+244>
   0x00000000000049fe <+4071>:	jmpq   0x3afa <ext4_ext_map_blocks+227>
   0x0000000000004a03 <+4076>:	mov    0x0(%rip),%r13        # 0x4a0a <ext4_ext_map_blocks+4083>
   0x0000000000004a0a <+4083>:	test   %r13,%r13
   0x0000000000004a0d <+4086>:	jne    0x3c70 <ext4_ext_map_blocks+601>
   0x0000000000004a13 <+4092>:	jmpq   0x3c63 <ext4_ext_map_blocks+588>
   0x0000000000004a18 <+4097>:	mov    0x0(%rip),%r14        # 0x4a1f <ext4_ext_map_blocks+4104>
   0x0000000000004a1f <+4104>:	test   %r14,%r14
   0x0000000000004a22 <+4107>:	jne    0x3d14 <ext4_ext_map_blocks+765>
   0x0000000000004a28 <+4113>:	jmpq   0x3d07 <ext4_ext_map_blocks+752>
   0x0000000000004a2d <+4118>:	xor    %r13d,%r13d
   0x0000000000004a30 <+4121>:	movq   $0x0,0x30(%rsp)
   0x0000000000004a39 <+4130>:	jmpq   0x4985 <ext4_ext_map_blocks+3950>
   0x0000000000004a3e <+4135>:	mov    0x0(%rip),%rbx        # 0x4a45 <ext4_ext_map_blocks+4142>
   0x0000000000004a45 <+4142>:	test   %rbx,%rbx
   0x0000000000004a48 <+4145>:	jne    0x49b8 <ext4_ext_map_blocks+4001>
   0x0000000000004a4e <+4151>:	jmpq   0x49a7 <ext4_ext_map_blocks+3984>
   0x0000000000004a53 <+4156>:	add    $0xb8,%rsp
   0x0000000000004a5a <+4163>:	mov    %r14d,%eax
   0x0000000000004a5d <+4166>:	pop    %rbx
   0x0000000000004a5e <+4167>:	pop    %rbp
   0x0000000000004a5f <+4168>:	pop    %r12
   0x0000000000004a61 <+4170>:	pop    %r13
   0x0000000000004a63 <+4172>:	pop    %r14
   0x0000000000004a65 <+4174>:	pop    %r15
   0x0000000000004a67 <+4176>:	retq   
End of assembler dump.
(gdb) quit
