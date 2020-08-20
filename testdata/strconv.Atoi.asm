TEXT strconv.Atoi(SB) atoi.go
  atoi.go:224		0x46a970		64488b0c25f8ffffff	MOVQ FS:0xfffffff8, CX				
  atoi.go:224		0x46a979		483b6110		CMPQ 0x10(CX), SP				
  atoi.go:224		0x46a97d		0f86ae020000		JBE 0x46ac31					
  atoi.go:224		0x46a983		4883ec40		SUBQ $0x40, SP					
  atoi.go:224		0x46a987		48896c2438		MOVQ BP, 0x38(SP)				
  atoi.go:224		0x46a98c		488d6c2438		LEAQ 0x38(SP), BP				
  atoi.go:229		0x46a991		488b442450		MOVQ 0x50(SP), AX				
  atoi.go:229		0x46a996		4885c0			TESTQ AX, AX					
  atoi.go:229		0x46a999		0f8efe010000		JLE 0x46ab9d					
  atoi.go:229		0x46a99f		4883f813		CMPQ $0x13, AX					
  atoi.go:228		0x46a9a3		0f8df4010000		JGE 0x46ab9d					
  atoi.go:232		0x46a9a9		488b4c2448		MOVQ 0x48(SP), CX				
  atoi.go:232		0x46a9ae		0fb611			MOVZX 0(CX), DX					
  atoi.go:232		0x46a9b1		80fa2d			CMPL $0x2d, DL					
  atoi.go:232		0x46a9b4		0f85cf010000		JNE 0x46ab89					
  atoi.go:233		0x46a9ba		488d58ff		LEAQ -0x1(AX), BX				
  atoi.go:233		0x46a9be		4889de			MOVQ BX, SI					
  atoi.go:233		0x46a9c1		48f7db			NEGQ BX						
  atoi.go:233		0x46a9c4		48c1fb3f		SARQ $0x3f, BX					
  atoi.go:233		0x46a9c8		4883e301		ANDQ $0x1, BX					
  atoi.go:233		0x46a9cc		4801cb			ADDQ CX, BX					
  atoi.go:234		0x46a9cf		4883fe01		CMPQ $0x1, SI					
  atoi.go:234		0x46a9d3		0f8c01010000		JL 0x46aada					
  atoi.go:240		0x46a9d9		31ff			XORL DI, DI					
  atoi.go:240		0x46a9db		4531c0			XORL R8, R8					
  atoi.go:240		0x46a9de		eb0f			JMP 0x46a9ef					
  atoi.go:240		0x46a9e0		48ffc7			INCQ DI						
  atoi.go:245		0x46a9e3		4f8d1480		LEAQ 0(R8)(R8*4), R10				
  atoi.go:245		0x46a9e7		450fb6c9		MOVZX R9, R9					
  atoi.go:245		0x46a9eb		4f8d0451		LEAQ 0(R9)(R10*2), R8				
  atoi.go:240		0x46a9ef		4839f7			CMPQ SI, DI					
  atoi.go:240		0x46a9f2		0f8dbe000000		JGE 0x46aab6					
  atoi.go:240		0x46a9f8		440fb60c3b		MOVZX 0(BX)(DI*1), R9				
  atoi.go:241		0x46a9fd		4183c1d0		ADDL $-0x30, R9					
  atoi.go:242		0x46aa01		4180f909		CMPL $0x9, R9					
  atoi.go:242		0x46aa05		76d9			JBE 0x46a9e0					
  atoi.go:243		0x46aa07		488d05d23e0600		LEAQ 0x63ed2(IP), AX				
  atoi.go:243		0x46aa0e		48890424		MOVQ AX, 0(SP)					
  atoi.go:243		0x46aa12		e8b914faff		CALL runtime.newobject(SB)			
  atoi.go:243		0x46aa17		488b442408		MOVQ 0x8(SP), AX				
  atoi.go:243		0x46aa1c		48c7400804000000	MOVQ $0x4, 0x8(AX)				
  atoi.go:243		0x46aa24		488d0d0a470700		LEAQ 0x7470a(IP), CX				
  atoi.go:243		0x46aa2b		488908			MOVQ CX, 0(AX)					
  atoi.go:243		0x46aa2e		488b4c2450		MOVQ 0x50(SP), CX				
  atoi.go:243		0x46aa33		48894818		MOVQ CX, 0x18(AX)				
  atoi.go:243		0x46aa37		833d7267150000		CMPL $0x0, runtime.writeBarrier(SB)		
  atoi.go:243		0x46aa3e		7560			JNE 0x46aaa0					
  atoi.go:243		0x46aa40		488b4c2448		MOVQ 0x48(SP), CX				
  atoi.go:243		0x46aa45		48894810		MOVQ CX, 0x10(AX)				
  atoi.go:243		0x46aa49		488b0d68cf1200		MOVQ strconv.ErrSyntax+8(SB), CX		
  atoi.go:243		0x46aa50		488b1559cf1200		MOVQ strconv.ErrSyntax(SB), DX			
  atoi.go:243		0x46aa57		48895020		MOVQ DX, 0x20(AX)				
  atoi.go:243		0x46aa5b		833d4e67150000		CMPL $0x0, runtime.writeBarrier(SB)		
  atoi.go:243		0x46aa62		7528			JNE 0x46aa8c					
  atoi.go:243		0x46aa64		48894828		MOVQ CX, 0x28(AX)				
  atoi.go:243		0x46aa68		48c744245800000000	MOVQ $0x0, 0x58(SP)				
  atoi.go:243		0x46aa71		488d0d68340900		LEAQ go.itab.*strconv.NumError,error(SB), CX	
  atoi.go:243		0x46aa78		48894c2460		MOVQ CX, 0x60(SP)				
  atoi.go:243		0x46aa7d		4889442468		MOVQ AX, 0x68(SP)				
  atoi.go:243		0x46aa82		488b6c2438		MOVQ 0x38(SP), BP				
  atoi.go:243		0x46aa87		4883c440		ADDQ $0x40, SP					
  atoi.go:243		0x46aa8b		c3			RET						
  atoi.go:243		0x46aa8c		488d7828		LEAQ 0x28(AX), DI				
  atoi.go:243		0x46aa90		4889c2			MOVQ AX, DX					
  atoi.go:243		0x46aa93		4889c8			MOVQ CX, AX					
  atoi.go:243		0x46aa96		e88518ffff		CALL runtime.gcWriteBarrier(SB)			
  atoi.go:243		0x46aa9b		4889d0			MOVQ DX, AX					
  atoi.go:243		0x46aa9e		ebc8			JMP 0x46aa68					
  atoi.go:243		0x46aaa0		488d7810		LEAQ 0x10(AX), DI				
  atoi.go:243		0x46aaa4		4889c1			MOVQ AX, CX					
  atoi.go:243		0x46aaa7		488b442448		MOVQ 0x48(SP), AX				
  atoi.go:243		0x46aaac		e86f18ffff		CALL runtime.gcWriteBarrier(SB)			
  atoi.go:243		0x46aab1		4889c8			MOVQ CX, AX					
  atoi.go:243		0x46aab4		eb93			JMP 0x46aa49					
  atoi.go:248		0x46aab6		4c89c0			MOVQ R8, AX					
  atoi.go:248		0x46aab9		49f7d8			NEGQ R8						
  atoi.go:232		0x46aabc		80fa2d			CMPL $0x2d, DL					
  atoi.go:250		0x46aabf		490f44c0		CMOVE R8, AX					
  atoi.go:250		0x46aac3		4889442458		MOVQ AX, 0x58(SP)				
  atoi.go:250		0x46aac8		0f57c0			XORPS X0, X0					
  atoi.go:250		0x46aacb		0f11442460		MOVUPS X0, 0x60(SP)				
  atoi.go:247		0x46aad0		488b6c2438		MOVQ 0x38(SP), BP				
  atoi.go:247		0x46aad5		4883c440		ADDQ $0x40, SP					
  atoi.go:247		0x46aad9		c3			RET						
  atoi.go:235		0x46aada		488d05ff3d0600		LEAQ 0x63dff(IP), AX				
  atoi.go:235		0x46aae1		48890424		MOVQ AX, 0(SP)					
  atoi.go:235		0x46aae5		e8e613faff		CALL runtime.newobject(SB)			
  atoi.go:235		0x46aaea		488b442408		MOVQ 0x8(SP), AX				
  atoi.go:235		0x46aaef		48c7400804000000	MOVQ $0x4, 0x8(AX)				
  atoi.go:235		0x46aaf7		488d0d37460700		LEAQ 0x74637(IP), CX				
  atoi.go:235		0x46aafe		488908			MOVQ CX, 0(AX)					
  atoi.go:235		0x46ab01		488b4c2450		MOVQ 0x50(SP), CX				
  atoi.go:235		0x46ab06		48894818		MOVQ CX, 0x18(AX)				
  atoi.go:235		0x46ab0a		833d9f66150000		CMPL $0x0, runtime.writeBarrier(SB)		
  atoi.go:235		0x46ab11		7560			JNE 0x46ab73					
  atoi.go:235		0x46ab13		488b4c2448		MOVQ 0x48(SP), CX				
  atoi.go:235		0x46ab18		48894810		MOVQ CX, 0x10(AX)				
  atoi.go:235		0x46ab1c		488b0d95ce1200		MOVQ strconv.ErrSyntax+8(SB), CX		
  atoi.go:235		0x46ab23		488b1586ce1200		MOVQ strconv.ErrSyntax(SB), DX			
  atoi.go:235		0x46ab2a		48895020		MOVQ DX, 0x20(AX)				
  atoi.go:235		0x46ab2e		833d7b66150000		CMPL $0x0, runtime.writeBarrier(SB)		
  atoi.go:235		0x46ab35		7528			JNE 0x46ab5f					
  atoi.go:235		0x46ab37		48894828		MOVQ CX, 0x28(AX)				
  atoi.go:235		0x46ab3b		48c744245800000000	MOVQ $0x0, 0x58(SP)				
  atoi.go:235		0x46ab44		488d0d95330900		LEAQ go.itab.*strconv.NumError,error(SB), CX	
  atoi.go:235		0x46ab4b		48894c2460		MOVQ CX, 0x60(SP)				
  atoi.go:235		0x46ab50		4889442468		MOVQ AX, 0x68(SP)				
  atoi.go:235		0x46ab55		488b6c2438		MOVQ 0x38(SP), BP				
  atoi.go:235		0x46ab5a		4883c440		ADDQ $0x40, SP					
  atoi.go:235		0x46ab5e		c3			RET						
  atoi.go:235		0x46ab5f		488d7828		LEAQ 0x28(AX), DI				
  atoi.go:235		0x46ab63		4889c2			MOVQ AX, DX					
  atoi.go:235		0x46ab66		4889c8			MOVQ CX, AX					
  atoi.go:235		0x46ab69		e8b217ffff		CALL runtime.gcWriteBarrier(SB)			
  atoi.go:235		0x46ab6e		4889d0			MOVQ DX, AX					
  atoi.go:235		0x46ab71		ebc8			JMP 0x46ab3b					
  atoi.go:235		0x46ab73		488d7810		LEAQ 0x10(AX), DI				
  atoi.go:235		0x46ab77		4889c1			MOVQ AX, CX					
  atoi.go:235		0x46ab7a		488b442448		MOVQ 0x48(SP), AX				
  atoi.go:235		0x46ab7f		e89c17ffff		CALL runtime.gcWriteBarrier(SB)			
  atoi.go:235		0x46ab84		4889c8			MOVQ CX, AX					
  atoi.go:235		0x46ab87		eb93			JMP 0x46ab1c					
  atoi.go:232		0x46ab89		80fa2b			CMPL $0x2b, DL					
  atoi.go:232		0x46ab8c		0f8428feffff		JE 0x46a9ba					
  atoi.go:240		0x46ab92		4889c6			MOVQ AX, SI					
  atoi.go:240		0x46ab95		4889cb			MOVQ CX, BX					
  atoi.go:232		0x46ab98		e93cfeffff		JMP 0x46a9d9					
  atoi.go:254		0x46ab9d		488b4c2448		MOVQ 0x48(SP), CX				
  atoi.go:254		0x46aba2		48890c24		MOVQ CX, 0(SP)					
  atoi.go:254		0x46aba6		4889442408		MOVQ AX, 0x8(SP)				
  atoi.go:254		0x46abab		48c74424100a000000	MOVQ $0xa, 0x10(SP)				
  atoi.go:254		0x46abb4		48c744241800000000	MOVQ $0x0, 0x18(SP)				
  atoi.go:254		0x46abbd		e8bef8ffff		CALL strconv.ParseInt(SB)			
  atoi.go:254		0x46abc2		488b442430		MOVQ 0x30(SP), AX				
  atoi.go:254		0x46abc7		488b4c2428		MOVQ 0x28(SP), CX				
  atoi.go:254		0x46abcc		488b542420		MOVQ 0x20(SP), DX				
  atoi.go:255		0x46abd1		488d1d08330900		LEAQ go.itab.*strconv.NumError,error(SB), BX	
  atoi.go:255		0x46abd8		4839d9			CMPQ BX, CX					
  atoi.go:255		0x46abdb		754a			JNE 0x46ac27					
  atoi.go:254		0x46abdd		4889c3			MOVQ AX, BX					
  atoi.go:255		0x46abe0		751b			JNE 0x46abfd					
  atoi.go:256		0x46abe2		48c7400804000000	MOVQ $0x4, 0x8(AX)				
  atoi.go:256		0x46abea		833dbf65150000		CMPL $0x0, runtime.writeBarrier(SB)		
  atoi.go:256		0x46abf1		7523			JNE 0x46ac16					
  atoi.go:256		0x46abf3		488d353b450700		LEAQ 0x7453b(IP), SI				
  atoi.go:256		0x46abfa		488930			MOVQ SI, 0(AX)					
  atoi.go:258		0x46abfd		4889542458		MOVQ DX, 0x58(SP)				
  atoi.go:258		0x46ac02		48894c2460		MOVQ CX, 0x60(SP)				
  atoi.go:258		0x46ac07		48895c2468		MOVQ BX, 0x68(SP)				
  atoi.go:258		0x46ac0c		488b6c2438		MOVQ 0x38(SP), BP				
  atoi.go:258		0x46ac11		4883c440		ADDQ $0x40, SP					
  atoi.go:258		0x46ac15		c3			RET						
  atoi.go:256		0x46ac16		4889c7			MOVQ AX, DI					
  atoi.go:256		0x46ac19		488d0515450700		LEAQ 0x74515(IP), AX				
  atoi.go:256		0x46ac20		e8fb16ffff		CALL runtime.gcWriteBarrier(SB)			
  atoi.go:256		0x46ac25		ebd6			JMP 0x46abfd					
  atoi.go:258		0x46ac27		4889c3			MOVQ AX, BX					
  atoi.go:258		0x46ac2a		b800000000		MOVL $0x0, AX					
  atoi.go:255		0x46ac2f		ebaf			JMP 0x46abe0					
  atoi.go:224		0x46ac31		e8aaf8feff		CALL runtime.morestack_noctxt(SB)		
  atoi.go:224		0x46ac36		e935fdffff		JMP strconv.Atoi(SB)				
