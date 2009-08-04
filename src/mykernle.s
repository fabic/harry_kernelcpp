
mykernel.ko:     file format elf32-i386


Disassembly of section .note.gnu.build-id:

00000000 <.note.gnu.build-id>:
   0:	04 00                	add    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	14 00                	adc    $0x0,%al
   6:	00 00                	add    %al,(%eax)
   8:	03 00                	add    (%eax),%eax
   a:	00 00                	add    %al,(%eax)
   c:	47                   	inc    %edi
   d:	4e                   	dec    %esi
   e:	55                   	push   %ebp
   f:	00 be b8 76 c6 da    	add    %bh,-0x25398948(%esi)
  15:	3e 84 3b             	test   %bh,%ds:(%ebx)
  18:	60                   	pusha  
  19:	dc 7a 50             	fdivrl 0x50(%edx)
  1c:	f1                   	icebp  
  1d:	51                   	push   %ecx
  1e:	0c 8b                	or     $0x8b,%al
  20:	66 68 11 c4          	pushw  $0xc411

Disassembly of section .text:

00000000 <loader>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	5d                   	pop    %ebp
   4:	c3                   	ret    
   5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
   9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000010 <call_constructor>:
  10:	a1 04 00 00 00       	mov    0x4,%eax
  15:	55                   	push   %ebp
  16:	89 e5                	mov    %esp,%ebp
  18:	53                   	push   %ebx
  19:	85 c0                	test   %eax,%eax
  1b:	74 1b                	je     38 <call_constructor+0x28>
  1d:	bb 01 00 00 00       	mov    $0x1,%ebx
  22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  28:	83 c3 01             	add    $0x1,%ebx
  2b:	ff d0                	call   *%eax
  2d:	8b 04 9d 00 00 00 00 	mov    0x0(,%ebx,4),%eax
  34:	85 c0                	test   %eax,%eax
  36:	75 f0                	jne    28 <call_constructor+0x18>
  38:	5b                   	pop    %ebx
  39:	5d                   	pop    %ebp
  3a:	c3                   	ret    
  3b:	90                   	nop    
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <call_destructor>:
  40:	8b 15 04 00 00 00    	mov    0x4,%edx
  46:	b8 01 00 00 00       	mov    $0x1,%eax
  4b:	55                   	push   %ebp
  4c:	89 e5                	mov    %esp,%ebp
  4e:	56                   	push   %esi
  4f:	85 d2                	test   %edx,%edx
  51:	53                   	push   %ebx
  52:	74 18                	je     6c <call_destructor+0x2c>
  54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  58:	83 c0 01             	add    $0x1,%eax
  5b:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
  62:	85 d2                	test   %edx,%edx
  64:	75 f2                	jne    58 <call_destructor+0x18>
  66:	31 d2                	xor    %edx,%edx
  68:	85 c0                	test   %eax,%eax
  6a:	7e 1a                	jle    86 <call_destructor+0x46>
  6c:	8d 70 01             	lea    0x1(%eax),%esi
  6f:	8d 1c b5 00 00 00 00 	lea    0x0(,%esi,4),%ebx
  76:	eb 08                	jmp    80 <call_destructor+0x40>
  78:	8b 13                	mov    (%ebx),%edx
  7a:	83 c6 01             	add    $0x1,%esi
  7d:	83 c3 04             	add    $0x4,%ebx
  80:	ff d2                	call   *%edx
  82:	85 f6                	test   %esi,%esi
  84:	7f f2                	jg     78 <call_destructor+0x38>
  86:	5b                   	pop    %ebx
  87:	5e                   	pop    %esi
  88:	5d                   	pop    %ebp
  89:	c3                   	ret    
  8a:	90                   	nop    
  8b:	90                   	nop    

Disassembly of section .exit.text:

00000000 <cleanup_module>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 04             	sub    $0x4,%esp
   6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   d:	e8 fc ff ff ff       	call   e <cleanup_module+0xe>
  12:	e8 fc ff ff ff       	call   13 <cleanup_module+0x13>
  17:	c9                   	leave  
  18:	c3                   	ret    

Disassembly of section .init.text:

00000000 <init_module>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 04             	sub    $0x4,%esp
   6:	e8 fc ff ff ff       	call   7 <init_module+0x7>
   b:	c7 04 24 15 00 00 00 	movl   $0x15,(%esp)
  12:	e8 fc ff ff ff       	call   13 <init_module+0x13>
  17:	c9                   	leave  
  18:	c3                   	ret    

Disassembly of section .rodata.str1.1:

00000000 <.rodata.str1.1>:
   0:	63 61 6c             	arpl   %sp,0x6c(%ecx)
   3:	6c                   	insb   (%dx),%es:(%edi)
   4:	20 64 69 73          	and    %ah,0x73(%ecx,%ebp,2)
   8:	74 72                	je     7c <call_destructor+0x3c>
   a:	75 63                	jne    6f <call_destructor+0x2f>
   c:	74 6f                	je     7d <call_destructor+0x3d>
   e:	72 20                	jb     30 <__module_depends+0xd>
  10:	2e 2e 2e 0a 00       	or     %cs:(%eax),%al
  15:	6e                   	outsb  %ds:(%esi),(%dx)
  16:	6f                   	outsl  %ds:(%esi),(%dx)
  17:	77 20                	ja     39 <__module_depends+0x16>
  19:	69 20 61 6d 20 77    	imul   $0x77206d61,(%eax),%esp
  1f:	6f                   	outsl  %ds:(%esi),(%dx)
  20:	72 6b                	jb     8d <call_destructor+0x4d>
  22:	69 6e 67 20 2e 2e 2e 	imul   $0x2e2e2e20,0x67(%esi),%ebp
  29:	0a 00                	or     (%eax),%al

Disassembly of section .modinfo:

00000000 <__mod_srcversion30>:
   0:	73 72                	jae    74 <__mod_vermagic5+0x34>
   2:	63 76 65             	arpl   %si,0x65(%esi)
   5:	72 73                	jb     7a <__mod_vermagic5+0x3a>
   7:	69 6f 6e 3d 43 38 41 	imul   $0x4138433d,0x6e(%edi),%ebp
   e:	38 31                	cmp    %dh,(%ecx)
  10:	35 39 35 31 44       	xor    $0x44313539,%eax
  15:	44                   	inc    %esp
  16:	34 42                	xor    $0x42,%al
  18:	42                   	inc    %edx
  19:	36                   	ss
  1a:	35 46 45 41 45       	xor    $0x45414546,%eax
  1f:	39 31                	cmp    %esi,(%ecx)
  21:	31 00                	xor    %eax,(%eax)

00000023 <__module_depends>:
  23:	64                   	fs
  24:	65                   	gs
  25:	70 65                	jo     8c <__mod_vermagic5+0x4c>
  27:	6e                   	outsb  %ds:(%esi),(%dx)
  28:	64                   	fs
  29:	73 3d                	jae    68 <__mod_vermagic5+0x28>
	...

00000040 <__mod_vermagic5>:
  40:	76 65                	jbe    a7 <__mod_vermagic5+0x67>
  42:	72 6d                	jb     b1 <__mod_vermagic5+0x71>
  44:	61                   	popa   
  45:	67 69 63 3d 32 2e 36 	addr16 imul $0x2e362e32,0x3d(%bp,%di),%esp
  4c:	2e 
  4d:	32 38                	xor    (%eax),%bh
  4f:	2d 31 34 2d 67       	sub    $0x672d3431,%eax
  54:	65 6e                	outsb  %gs:(%esi),(%dx)
  56:	65                   	gs
  57:	72 69                	jb     c2 <__mod_vermagic5+0x82>
  59:	63 20                	arpl   %sp,(%eax)
  5b:	53                   	push   %ebx
  5c:	4d                   	dec    %ebp
  5d:	50                   	push   %eax
  5e:	20 6d 6f             	and    %ch,0x6f(%ebp)
  61:	64                   	fs
  62:	5f                   	pop    %edi
  63:	75 6e                	jne    d3 <__mod_vermagic5+0x93>
  65:	6c                   	insb   (%dx),%es:(%edi)
  66:	6f                   	outsl  %ds:(%esi),(%dx)
  67:	61                   	popa   
  68:	64 20 6d 6f          	and    %ch,%fs:0x6f(%ebp)
  6c:	64                   	fs
  6d:	76 65                	jbe    d4 <__mod_vermagic5+0x94>
  6f:	72 73                	jb     e4 <__mod_vermagic5+0xa4>
  71:	69 6f 6e 73 20 35 38 	imul   $0x38352073,0x6e(%edi),%ebp
  78:	36 20 00             	and    %al,%ss:(%eax)

Disassembly of section __versions:

00000000 <____versions>:
   0:	79 44                	jns    46 <____versions+0x46>
   2:	06                   	push   %es
   3:	73 73                	jae    78 <____versions+0x78>
   5:	74 72                	je     79 <____versions+0x79>
   7:	75 63                	jne    6c <____versions+0x6c>
   9:	74 5f                	je     6a <____versions+0x6a>
   b:	6d                   	insl   (%dx),%es:(%edi)
   c:	6f                   	outsl  %ds:(%esi),(%dx)
   d:	64                   	fs
   e:	75 6c                	jne    7c <____versions+0x7c>
  10:	65 00 00             	add    %al,%gs:(%eax)
	...
  3f:	00 d5                	add    %dl,%ch
  41:	97                   	xchg   %eax,%edi
  42:	23 b7 70 72 69 6e    	and    0x6e697270(%edi),%esi
  48:	74 6b                	je     b5 <call_destructor+0x75>
	...

Disassembly of section .ctors:

00000000 <start_ctors>:
   0:	ff                   	(bad)  
   1:	ff                   	(bad)  
   2:	ff                   	(bad)  
   3:	ff 00                	incl   (%eax)

00000004 <end_ctors>:
   4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dtors:

00000000 <start_dtors>:
   0:	ff                   	(bad)  
   1:	ff                   	(bad)  
   2:	ff                   	(bad)  
   3:	ff 00                	incl   (%eax)

00000004 <end_dtors>:
   4:	00 00                	add    %al,(%eax)
	...

Disassembly of section .gnu.linkonce.this_module:

00000000 <__this_module>:
	...
       c:	6d                   	insl   (%dx),%es:(%edi)
       d:	79 6b                	jns    7a <__this_module+0x7a>
       f:	65                   	gs
      10:	72 6e                	jb     80 <__this_module+0x80>
      12:	65                   	gs
      13:	6c                   	insb   (%dx),%es:(%edi)
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	00 47 43             	add    %al,0x43(%edi)
   3:	43                   	inc    %ebx
   4:	3a 20                	cmp    (%eax),%ah
   6:	28 55 62             	sub    %dl,0x62(%ebp)
   9:	75 6e                	jne    79 <.comment+0x79>
   b:	74 75                	je     82 <.comment+0x82>
   d:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  10:	33 2e                	xor    (%esi),%ebp
  12:	33 2d 35 75 62 75    	xor    0x75627535,%ebp
  18:	6e                   	outsb  %ds:(%esi),(%dx)
  19:	74 75                	je     90 <call_destructor+0x50>
  1b:	34 29                	xor    $0x29,%al
  1d:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  20:	33 2e                	xor    (%esi),%ebp
  22:	33 00                	xor    (%eax),%eax
  24:	00 47 43             	add    %al,0x43(%edi)
  27:	43                   	inc    %ebx
  28:	3a 20                	cmp    (%eax),%ah
  2a:	28 55 62             	sub    %dl,0x62(%ebp)
  2d:	75 6e                	jne    9d <call_destructor+0x5d>
  2f:	74 75                	je     a6 <call_destructor+0x66>
  31:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  34:	33 2e                	xor    (%esi),%ebp
  36:	33 2d 35 75 62 75    	xor    0x75627535,%ebp
  3c:	6e                   	outsb  %ds:(%esi),(%dx)
  3d:	74 75                	je     b4 <call_destructor+0x74>
  3f:	34 29                	xor    $0x29,%al
  41:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  44:	33 2e                	xor    (%esi),%ebp
  46:	33 00                	xor    (%eax),%eax
  48:	00 47 43             	add    %al,0x43(%edi)
  4b:	43                   	inc    %ebx
  4c:	3a 20                	cmp    (%eax),%ah
  4e:	28 55 62             	sub    %dl,0x62(%ebp)
  51:	75 6e                	jne    c1 <call_destructor+0x81>
  53:	74 75                	je     ca <call_destructor+0x8a>
  55:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  58:	33 2e                	xor    (%esi),%ebp
  5a:	33 2d 35 75 62 75    	xor    0x75627535,%ebp
  60:	6e                   	outsb  %ds:(%esi),(%dx)
  61:	74 75                	je     d8 <call_destructor+0x98>
  63:	34 29                	xor    $0x29,%al
  65:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  68:	33 2e                	xor    (%esi),%ebp
  6a:	33 00                	xor    (%eax),%eax
  6c:	00 47 43             	add    %al,0x43(%edi)
  6f:	43                   	inc    %ebx
  70:	3a 20                	cmp    (%eax),%ah
  72:	28 55 62             	sub    %dl,0x62(%ebp)
  75:	75 6e                	jne    e5 <call_destructor+0xa5>
  77:	74 75                	je     ee <call_destructor+0xae>
  79:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  7c:	33 2e                	xor    (%esi),%ebp
  7e:	33 2d 35 75 62 75    	xor    0x75627535,%ebp
  84:	6e                   	outsb  %ds:(%esi),(%dx)
  85:	74 75                	je     fc <call_destructor+0xbc>
  87:	34 29                	xor    $0x29,%al
  89:	20 34 2e             	and    %dh,(%esi,%ebp,1)
  8c:	33 2e                	xor    (%esi),%ebp
  8e:	33 00                	xor    (%eax),%eax
