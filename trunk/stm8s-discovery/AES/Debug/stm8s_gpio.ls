   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 113                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 113                     ; 46 {
 115                     	switch	.text
 116  0000               _GPIO_DeInit:
 120                     ; 47     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 122  0000 7f            	clr	(x)
 123                     ; 48     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 125  0001 6f02          	clr	(2,x)
 126                     ; 49     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 128  0003 6f03          	clr	(3,x)
 129                     ; 50     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 131  0005 6f04          	clr	(4,x)
 132                     ; 51 }
 135  0007 81            	ret
 375                     ; 62 void GPIO_Init(GPIO_TypeDef* GPIOx,
 375                     ; 63                GPIO_Pin_TypeDef GPIO_Pin,
 375                     ; 64                GPIO_Mode_TypeDef GPIO_Mode)
 375                     ; 65 {
 376                     	switch	.text
 377  0008               _GPIO_Init:
 379  0008 89            	pushw	x
 380       00000000      OFST:	set	0
 383                     ; 70     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 385                     ; 71     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 387                     ; 77     if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 389  0009 7b08          	ld	a,(OFST+8,sp)
 390  000b a580          	bcp	a,#128
 391  000d 271d          	jreq	L771
 392                     ; 79         if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 394  000f 7b08          	ld	a,(OFST+8,sp)
 395  0011 a510          	bcp	a,#16
 396  0013 2706          	jreq	L102
 397                     ; 81             GPIOx->ODR |= (u8)GPIO_Pin;
 399  0015 f6            	ld	a,(x)
 400  0016 1a06          	or	a,(OFST+6,sp)
 401  0018 f7            	ld	(x),a
 403  0019 2007          	jra	L302
 404  001b               L102:
 405                     ; 84             GPIOx->ODR &= (u8)(~(GPIO_Pin));
 407  001b 1e01          	ldw	x,(OFST+1,sp)
 408  001d 7b06          	ld	a,(OFST+6,sp)
 409  001f 43            	cpl	a
 410  0020 f4            	and	a,(x)
 411  0021 f7            	ld	(x),a
 412  0022               L302:
 413                     ; 87         GPIOx->DDR |= (u8)GPIO_Pin;
 415  0022 1e01          	ldw	x,(OFST+1,sp)
 416  0024 e602          	ld	a,(2,x)
 417  0026 1a06          	or	a,(OFST+6,sp)
 418  0028 e702          	ld	(2,x),a
 420  002a 2009          	jra	L502
 421  002c               L771:
 422                     ; 91         GPIOx->DDR &= (u8)(~(GPIO_Pin));
 424  002c 1e01          	ldw	x,(OFST+1,sp)
 425  002e 7b06          	ld	a,(OFST+6,sp)
 426  0030 43            	cpl	a
 427  0031 e402          	and	a,(2,x)
 428  0033 e702          	ld	(2,x),a
 429  0035               L502:
 430                     ; 98     if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 432  0035 7b08          	ld	a,(OFST+8,sp)
 433  0037 a540          	bcp	a,#64
 434  0039 270a          	jreq	L702
 435                     ; 100         GPIOx->CR1 |= (u8)GPIO_Pin;
 437  003b 1e01          	ldw	x,(OFST+1,sp)
 438  003d e603          	ld	a,(3,x)
 439  003f 1a06          	or	a,(OFST+6,sp)
 440  0041 e703          	ld	(3,x),a
 442  0043 2009          	jra	L112
 443  0045               L702:
 444                     ; 103         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 446  0045 1e01          	ldw	x,(OFST+1,sp)
 447  0047 7b06          	ld	a,(OFST+6,sp)
 448  0049 43            	cpl	a
 449  004a e403          	and	a,(3,x)
 450  004c e703          	ld	(3,x),a
 451  004e               L112:
 452                     ; 110     if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 454  004e 7b08          	ld	a,(OFST+8,sp)
 455  0050 a520          	bcp	a,#32
 456  0052 270a          	jreq	L312
 457                     ; 112         GPIOx->CR2 |= (u8)GPIO_Pin;
 459  0054 1e01          	ldw	x,(OFST+1,sp)
 460  0056 e604          	ld	a,(4,x)
 461  0058 1a06          	or	a,(OFST+6,sp)
 462  005a e704          	ld	(4,x),a
 464  005c 2009          	jra	L512
 465  005e               L312:
 466                     ; 115         GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 468  005e 1e01          	ldw	x,(OFST+1,sp)
 469  0060 7b06          	ld	a,(OFST+6,sp)
 470  0062 43            	cpl	a
 471  0063 e404          	and	a,(4,x)
 472  0065 e704          	ld	(4,x),a
 473  0067               L512:
 474                     ; 118 }
 477  0067 85            	popw	x
 478  0068 81            	ret
 524                     ; 129 void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
 524                     ; 130 {
 525                     	switch	.text
 526  0069               _GPIO_Write:
 528  0069 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 131     GPIOx->ODR = PortVal;
 534  006a 7b05          	ld	a,(OFST+5,sp)
 535  006c 1e01          	ldw	x,(OFST+1,sp)
 536  006e f7            	ld	(x),a
 537                     ; 132 }
 540  006f 85            	popw	x
 541  0070 81            	ret
 588                     ; 143 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 588                     ; 144 {
 589                     	switch	.text
 590  0071               _GPIO_WriteHigh:
 592  0071 89            	pushw	x
 593       00000000      OFST:	set	0
 596                     ; 145     GPIOx->ODR |= (u8)PortPins;
 598  0072 f6            	ld	a,(x)
 599  0073 1a06          	or	a,(OFST+6,sp)
 600  0075 f7            	ld	(x),a
 601                     ; 146 }
 604  0076 85            	popw	x
 605  0077 81            	ret
 652                     ; 157 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 652                     ; 158 {
 653                     	switch	.text
 654  0078               _GPIO_WriteLow:
 656  0078 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 159     GPIOx->ODR &= (u8)(~PortPins);
 662  0079 7b06          	ld	a,(OFST+6,sp)
 663  007b 43            	cpl	a
 664  007c f4            	and	a,(x)
 665  007d f7            	ld	(x),a
 666                     ; 160 }
 669  007e 85            	popw	x
 670  007f 81            	ret
 717                     ; 171 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 717                     ; 172 {
 718                     	switch	.text
 719  0080               _GPIO_WriteReverse:
 721  0080 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 173     GPIOx->ODR ^= (u8)PortPins;
 727  0081 f6            	ld	a,(x)
 728  0082 1806          	xor	a,	(OFST+6,sp)
 729  0084 f7            	ld	(x),a
 730                     ; 174 }
 733  0085 85            	popw	x
 734  0086 81            	ret
 772                     ; 183 u8 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 772                     ; 184 {
 773                     	switch	.text
 774  0087               _GPIO_ReadOutputData:
 778                     ; 185     return ((u8)GPIOx->ODR);
 780  0087 f6            	ld	a,(x)
 783  0088 81            	ret
 820                     ; 195 u8 GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 820                     ; 196 {
 821                     	switch	.text
 822  0089               _GPIO_ReadInputData:
 826                     ; 197     return ((u8)GPIOx->IDR);
 828  0089 e601          	ld	a,(1,x)
 831  008b 81            	ret
 899                     ; 210 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 899                     ; 211 {
 900                     	switch	.text
 901  008c               _GPIO_ReadInputPin:
 903  008c 89            	pushw	x
 904  008d 89            	pushw	x
 905       00000002      OFST:	set	2
 908                     ; 212     return ((BitStatus)(GPIOx->IDR & (vu8)GPIO_Pin));
 910  008e 7b08          	ld	a,(OFST+6,sp)
 911  0090 5f            	clrw	x
 912  0091 97            	ld	xl,a
 913  0092 1f01          	ldw	(OFST-1,sp),x
 914  0094 1e03          	ldw	x,(OFST+1,sp)
 915  0096 e601          	ld	a,(1,x)
 916  0098 5f            	clrw	x
 917  0099 97            	ld	xl,a
 918  009a 01            	rrwa	x,a
 919  009b 1402          	and	a,(OFST+0,sp)
 920  009d 01            	rrwa	x,a
 921  009e 1401          	and	a,(OFST-1,sp)
 922  00a0 01            	rrwa	x,a
 925  00a1 5b04          	addw	sp,#4
 926  00a3 81            	ret
1004                     ; 223 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1004                     ; 224 {
1005                     	switch	.text
1006  00a4               _GPIO_ExternalPullUpConfig:
1008  00a4 89            	pushw	x
1009       00000000      OFST:	set	0
1012                     ; 226     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1014                     ; 227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1016                     ; 229     if (NewState != DISABLE) /* External Pull-Up Set*/
1018  00a5 1e07          	ldw	x,(OFST+7,sp)
1019  00a7 270a          	jreq	L374
1020                     ; 231         GPIOx->CR1 |= (u8)GPIO_Pin;
1022  00a9 1e01          	ldw	x,(OFST+1,sp)
1023  00ab e603          	ld	a,(3,x)
1024  00ad 1a06          	or	a,(OFST+6,sp)
1025  00af e703          	ld	(3,x),a
1027  00b1 2009          	jra	L574
1028  00b3               L374:
1029                     ; 234         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
1031  00b3 1e01          	ldw	x,(OFST+1,sp)
1032  00b5 7b06          	ld	a,(OFST+6,sp)
1033  00b7 43            	cpl	a
1034  00b8 e403          	and	a,(3,x)
1035  00ba e703          	ld	(3,x),a
1036  00bc               L574:
1037                     ; 236 }
1040  00bc 85            	popw	x
1041  00bd 81            	ret
1054                     	xdef	_GPIO_ExternalPullUpConfig
1055                     	xdef	_GPIO_ReadInputPin
1056                     	xdef	_GPIO_ReadOutputData
1057                     	xdef	_GPIO_ReadInputData
1058                     	xdef	_GPIO_WriteReverse
1059                     	xdef	_GPIO_WriteLow
1060                     	xdef	_GPIO_WriteHigh
1061                     	xdef	_GPIO_Write
1062                     	xdef	_GPIO_Init
1063                     	xdef	_GPIO_DeInit
1082                     	end
