   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  47                     ; 43 void TIM3_DeInit(void)
  47                     ; 44 {
  49                     	switch	.text
  50  0000               _TIM3_DeInit:
  54                     ; 46     TIM3->CR1 = (u8)TIM3_CR1_RESET_VALUE;
  56  0000 725f5320      	clr	21280
  57                     ; 47     TIM3->IER = (u8)TIM3_IER_RESET_VALUE;
  59  0004 725f5321      	clr	21281
  60                     ; 48     TIM3->SR2 = (u8)TIM3_SR2_RESET_VALUE;
  62  0008 725f5323      	clr	21283
  63                     ; 51     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  65  000c 725f5327      	clr	21287
  66                     ; 54     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  68  0010 725f5327      	clr	21287
  69                     ; 55     TIM3->CCMR1 = (u8)TIM3_CCMR1_RESET_VALUE;
  71  0014 725f5325      	clr	21285
  72                     ; 56     TIM3->CCMR2 = (u8)TIM3_CCMR2_RESET_VALUE;
  74  0018 725f5326      	clr	21286
  75                     ; 57     TIM3->CNTRH = (u8)TIM3_CNTRH_RESET_VALUE;
  77  001c 725f5328      	clr	21288
  78                     ; 58     TIM3->CNTRL = (u8)TIM3_CNTRL_RESET_VALUE;
  80  0020 725f5329      	clr	21289
  81                     ; 59     TIM3->PSCR = (u8)TIM3_PSCR_RESET_VALUE;
  83  0024 725f532a      	clr	21290
  84                     ; 60     TIM3->ARRH  = (u8)TIM3_ARRH_RESET_VALUE;
  86  0028 35ff532b      	mov	21291,#255
  87                     ; 61     TIM3->ARRL  = (u8)TIM3_ARRL_RESET_VALUE;
  89  002c 35ff532c      	mov	21292,#255
  90                     ; 62     TIM3->CCR1H = (u8)TIM3_CCR1H_RESET_VALUE;
  92  0030 725f532d      	clr	21293
  93                     ; 63     TIM3->CCR1L = (u8)TIM3_CCR1L_RESET_VALUE;
  95  0034 725f532e      	clr	21294
  96                     ; 64     TIM3->CCR2H = (u8)TIM3_CCR2H_RESET_VALUE;
  98  0038 725f532f      	clr	21295
  99                     ; 65     TIM3->CCR2L = (u8)TIM3_CCR2L_RESET_VALUE;
 101  003c 725f5330      	clr	21296
 102                     ; 66     TIM3->SR1 = (u8)TIM3_SR1_RESET_VALUE;
 104  0040 725f5322      	clr	21282
 105                     ; 67 }
 108  0044 81            	ret
 276                     ; 76 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 276                     ; 77                         u16 TIM3_Period)
 276                     ; 78 {
 277                     	switch	.text
 278  0045               _TIM3_TimeBaseInit:
 280  0045 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 80     TIM3->PSCR = (u8)(TIM3_Prescaler);
 286  0046 9f            	ld	a,xl
 287  0047 c7532a        	ld	21290,a
 288                     ; 82     TIM3->ARRH = (u8)(TIM3_Period >> 8);
 290  004a 7b05          	ld	a,(OFST+5,sp)
 291  004c c7532b        	ld	21291,a
 292                     ; 83     TIM3->ARRL = (u8)(TIM3_Period);
 294  004f 7b06          	ld	a,(OFST+6,sp)
 295  0051 c7532c        	ld	21292,a
 296                     ; 84 }
 299  0054 85            	popw	x
 300  0055 81            	ret
 457                     ; 94 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 457                     ; 95                   TIM3_OutputState_TypeDef TIM3_OutputState,
 457                     ; 96                   u16 TIM3_Pulse,
 457                     ; 97                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 457                     ; 98 {
 458                     	switch	.text
 459  0056               _TIM3_OC1Init:
 461  0056 89            	pushw	x
 462  0057 88            	push	a
 463       00000001      OFST:	set	1
 466                     ; 100     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 468                     ; 101     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 470                     ; 102     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 472                     ; 105     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 474  0058 c65327        	ld	a,21287
 475  005b a4fc          	and	a,#252
 476  005d c75327        	ld	21287,a
 477                     ; 107     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 479  0060 7b0b          	ld	a,(OFST+10,sp)
 480  0062 a402          	and	a,#2
 481  0064 6b01          	ld	(OFST+0,sp),a
 482  0066 7b07          	ld	a,(OFST+6,sp)
 483  0068 a401          	and	a,#1
 484  006a 1a01          	or	a,(OFST+0,sp)
 485  006c ca5327        	or	a,21287
 486  006f c75327        	ld	21287,a
 487                     ; 110     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 489  0072 c65325        	ld	a,21285
 490  0075 a48f          	and	a,#143
 491  0077 1a03          	or	a,(OFST+2,sp)
 492  0079 c75325        	ld	21285,a
 493                     ; 113     TIM3->CCR1H = (u8)(TIM3_Pulse >> 8);
 495  007c 7b08          	ld	a,(OFST+7,sp)
 496  007e c7532d        	ld	21293,a
 497                     ; 114     TIM3->CCR1L = (u8)(TIM3_Pulse);
 499  0081 7b09          	ld	a,(OFST+8,sp)
 500  0083 c7532e        	ld	21294,a
 501                     ; 115 }
 504  0086 5b03          	addw	sp,#3
 505  0088 81            	ret
 569                     ; 126 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 569                     ; 127                   TIM3_OutputState_TypeDef TIM3_OutputState,
 569                     ; 128                   u16 TIM3_Pulse,
 569                     ; 129                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 569                     ; 130 {
 570                     	switch	.text
 571  0089               _TIM3_OC2Init:
 573  0089 89            	pushw	x
 574  008a 88            	push	a
 575       00000001      OFST:	set	1
 578                     ; 132     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 580                     ; 133     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 582                     ; 134     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 584                     ; 138     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 586  008b c65327        	ld	a,21287
 587  008e a4cf          	and	a,#207
 588  0090 c75327        	ld	21287,a
 589                     ; 140     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 591  0093 7b0b          	ld	a,(OFST+10,sp)
 592  0095 a420          	and	a,#32
 593  0097 6b01          	ld	(OFST+0,sp),a
 594  0099 7b07          	ld	a,(OFST+6,sp)
 595  009b a410          	and	a,#16
 596  009d 1a01          	or	a,(OFST+0,sp)
 597  009f ca5327        	or	a,21287
 598  00a2 c75327        	ld	21287,a
 599                     ; 144     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 601  00a5 c65326        	ld	a,21286
 602  00a8 a48f          	and	a,#143
 603  00aa 1a03          	or	a,(OFST+2,sp)
 604  00ac c75326        	ld	21286,a
 605                     ; 148     TIM3->CCR2H = (u8)(TIM3_Pulse >> 8);
 607  00af 7b08          	ld	a,(OFST+7,sp)
 608  00b1 c7532f        	ld	21295,a
 609                     ; 149     TIM3->CCR2L = (u8)(TIM3_Pulse);
 611  00b4 7b09          	ld	a,(OFST+8,sp)
 612  00b6 c75330        	ld	21296,a
 613                     ; 150 }
 616  00b9 5b03          	addw	sp,#3
 617  00bb 81            	ret
 801                     ; 161 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 801                     ; 162                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 801                     ; 163                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 801                     ; 164                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 801                     ; 165                  u8 TIM3_ICFilter)
 801                     ; 166 {
 802                     	switch	.text
 803  00bc               _TIM3_ICInit:
 805  00bc 89            	pushw	x
 806       00000000      OFST:	set	0
 809                     ; 168     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 811                     ; 169     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 813                     ; 170     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 815                     ; 171     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 817                     ; 172     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 819                     ; 174     if (TIM3_Channel != TIM3_CHANNEL_2)
 821  00bd a30001        	cpw	x,#1
 822  00c0 2714          	jreq	L343
 823                     ; 177         TI1_Config((u8)TIM3_ICPolarity,
 823                     ; 178                    (u8)TIM3_ICSelection,
 823                     ; 179                    (u8)TIM3_ICFilter);
 825  00c2 7b0b          	ld	a,(OFST+11,sp)
 826  00c4 88            	push	a
 827  00c5 7b09          	ld	a,(OFST+9,sp)
 828  00c7 97            	ld	xl,a
 829  00c8 7b07          	ld	a,(OFST+7,sp)
 830  00ca 95            	ld	xh,a
 831  00cb cd039a        	call	L3_TI1_Config
 833  00ce 84            	pop	a
 834                     ; 182         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 836  00cf 1e09          	ldw	x,(OFST+9,sp)
 837  00d1 cd02a5        	call	_TIM3_SetIC1Prescaler
 840  00d4 2012          	jra	L543
 841  00d6               L343:
 842                     ; 187         TI2_Config((u8)TIM3_ICPolarity,
 842                     ; 188                    (u8)TIM3_ICSelection,
 842                     ; 189                    (u8)TIM3_ICFilter);
 844  00d6 7b0b          	ld	a,(OFST+11,sp)
 845  00d8 88            	push	a
 846  00d9 7b09          	ld	a,(OFST+9,sp)
 847  00db 97            	ld	xl,a
 848  00dc 7b07          	ld	a,(OFST+7,sp)
 849  00de 95            	ld	xh,a
 850  00df cd03ca        	call	L5_TI2_Config
 852  00e2 84            	pop	a
 853                     ; 192         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 855  00e3 1e09          	ldw	x,(OFST+9,sp)
 856  00e5 cd02b2        	call	_TIM3_SetIC2Prescaler
 858  00e8               L543:
 859                     ; 194 }
 862  00e8 85            	popw	x
 863  00e9 81            	ret
 959                     ; 204 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 959                     ; 205                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 959                     ; 206                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 959                     ; 207                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 959                     ; 208                      u8 TIM3_ICFilter)
 959                     ; 209 {
 960                     	switch	.text
 961  00ea               _TIM3_PWMIConfig:
 963  00ea 89            	pushw	x
 964  00eb 89            	pushw	x
 965       00000002      OFST:	set	2
 968                     ; 210     u8 icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 970                     ; 211     u8 icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
 972                     ; 214     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 974                     ; 215     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 976                     ; 216     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 978                     ; 217     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 980                     ; 220     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 982  00ec 1e07          	ldw	x,(OFST+5,sp)
 983  00ee a30044        	cpw	x,#68
 984  00f1 2706          	jreq	L514
 985                     ; 222         icpolarity = (u8)TIM3_ICPOLARITY_FALLING;
 987  00f3 a644          	ld	a,#68
 988  00f5 6b01          	ld	(OFST-1,sp),a
 990  00f7 2002          	jra	L714
 991  00f9               L514:
 992                     ; 226         icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 994  00f9 0f01          	clr	(OFST-1,sp)
 995  00fb               L714:
 996                     ; 230     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 998  00fb 1e09          	ldw	x,(OFST+7,sp)
 999  00fd a30001        	cpw	x,#1
1000  0100 2606          	jrne	L124
1001                     ; 232         icselection = (u8)TIM3_ICSELECTION_INDIRECTTI;
1003  0102 a602          	ld	a,#2
1004  0104 6b02          	ld	(OFST+0,sp),a
1006  0106 2004          	jra	L324
1007  0108               L124:
1008                     ; 236         icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
1010  0108 a601          	ld	a,#1
1011  010a 6b02          	ld	(OFST+0,sp),a
1012  010c               L324:
1013                     ; 239     if (TIM3_Channel != TIM3_CHANNEL_2)
1015  010c 1e03          	ldw	x,(OFST+1,sp)
1016  010e a30001        	cpw	x,#1
1017  0111 2726          	jreq	L524
1018                     ; 242         TI1_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1018                     ; 243                    (u8)TIM3_ICFilter);
1020  0113 7b0d          	ld	a,(OFST+11,sp)
1021  0115 88            	push	a
1022  0116 7b0b          	ld	a,(OFST+9,sp)
1023  0118 97            	ld	xl,a
1024  0119 7b09          	ld	a,(OFST+7,sp)
1025  011b 95            	ld	xh,a
1026  011c cd039a        	call	L3_TI1_Config
1028  011f 84            	pop	a
1029                     ; 246         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1031  0120 1e0b          	ldw	x,(OFST+9,sp)
1032  0122 cd02a5        	call	_TIM3_SetIC1Prescaler
1034                     ; 249         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1036  0125 7b0d          	ld	a,(OFST+11,sp)
1037  0127 88            	push	a
1038  0128 7b03          	ld	a,(OFST+1,sp)
1039  012a 97            	ld	xl,a
1040  012b 7b02          	ld	a,(OFST+0,sp)
1041  012d 95            	ld	xh,a
1042  012e cd03ca        	call	L5_TI2_Config
1044  0131 84            	pop	a
1045                     ; 252         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1047  0132 1e0b          	ldw	x,(OFST+9,sp)
1048  0134 cd02b2        	call	_TIM3_SetIC2Prescaler
1051  0137 2024          	jra	L724
1052  0139               L524:
1053                     ; 257         TI2_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1053                     ; 258                    (u8)TIM3_ICFilter);
1055  0139 7b0d          	ld	a,(OFST+11,sp)
1056  013b 88            	push	a
1057  013c 7b0b          	ld	a,(OFST+9,sp)
1058  013e 97            	ld	xl,a
1059  013f 7b09          	ld	a,(OFST+7,sp)
1060  0141 95            	ld	xh,a
1061  0142 cd03ca        	call	L5_TI2_Config
1063  0145 84            	pop	a
1064                     ; 261         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1066  0146 1e0b          	ldw	x,(OFST+9,sp)
1067  0148 cd02b2        	call	_TIM3_SetIC2Prescaler
1069                     ; 264         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1071  014b 7b0d          	ld	a,(OFST+11,sp)
1072  014d 88            	push	a
1073  014e 7b03          	ld	a,(OFST+1,sp)
1074  0150 97            	ld	xl,a
1075  0151 7b02          	ld	a,(OFST+0,sp)
1076  0153 95            	ld	xh,a
1077  0154 cd039a        	call	L3_TI1_Config
1079  0157 84            	pop	a
1080                     ; 267         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1082  0158 1e0b          	ldw	x,(OFST+9,sp)
1083  015a cd02a5        	call	_TIM3_SetIC1Prescaler
1085  015d               L724:
1086                     ; 269 }
1089  015d 5b04          	addw	sp,#4
1090  015f 81            	ret
1145                     ; 278 void TIM3_Cmd(FunctionalState NewState)
1145                     ; 279 {
1146                     	switch	.text
1147  0160               _TIM3_Cmd:
1151                     ; 281     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1153                     ; 284     if (NewState != DISABLE)
1155  0160 a30000        	cpw	x,#0
1156  0163 2706          	jreq	L754
1157                     ; 286         TIM3->CR1 |= (u8)TIM3_CR1_CEN;
1159  0165 72105320      	bset	21280,#0
1161  0169 2004          	jra	L164
1162  016b               L754:
1163                     ; 290         TIM3->CR1 &= (u8)(~TIM3_CR1_CEN);
1165  016b 72115320      	bres	21280,#0
1166  016f               L164:
1167                     ; 292 }
1170  016f 81            	ret
1242                     ; 307 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1242                     ; 308 {
1243                     	switch	.text
1244  0170               _TIM3_ITConfig:
1246  0170 89            	pushw	x
1247       00000000      OFST:	set	0
1250                     ; 310     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1252                     ; 311     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1254                     ; 313     if (NewState != DISABLE)
1256  0171 1e05          	ldw	x,(OFST+5,sp)
1257  0173 270a          	jreq	L715
1258                     ; 316         TIM3->IER |= (u8)TIM3_IT;
1260  0175 c65321        	ld	a,21281
1261  0178 1a02          	or	a,(OFST+2,sp)
1262  017a c75321        	ld	21281,a
1264  017d 2009          	jra	L125
1265  017f               L715:
1266                     ; 321         TIM3->IER &= (u8)(~TIM3_IT);
1268  017f 7b02          	ld	a,(OFST+2,sp)
1269  0181 43            	cpl	a
1270  0182 c45321        	and	a,21281
1271  0185 c75321        	ld	21281,a
1272  0188               L125:
1273                     ; 323 }
1276  0188 85            	popw	x
1277  0189 81            	ret
1313                     ; 332 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1313                     ; 333 {
1314                     	switch	.text
1315  018a               _TIM3_UpdateDisableConfig:
1319                     ; 335     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1321                     ; 338     if (NewState != DISABLE)
1323  018a a30000        	cpw	x,#0
1324  018d 2706          	jreq	L145
1325                     ; 340         TIM3->CR1 |= TIM3_CR1_UDIS;
1327  018f 72125320      	bset	21280,#1
1329  0193 2004          	jra	L345
1330  0195               L145:
1331                     ; 344         TIM3->CR1 &= (u8)(~TIM3_CR1_UDIS);
1333  0195 72135320      	bres	21280,#1
1334  0199               L345:
1335                     ; 346 }
1338  0199 81            	ret
1396                     ; 356 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1396                     ; 357 {
1397                     	switch	.text
1398  019a               _TIM3_UpdateRequestConfig:
1402                     ; 359     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1404                     ; 362     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1406  019a a30000        	cpw	x,#0
1407  019d 2706          	jreq	L375
1408                     ; 364         TIM3->CR1 |= TIM3_CR1_URS;
1410  019f 72145320      	bset	21280,#2
1412  01a3 2004          	jra	L575
1413  01a5               L375:
1414                     ; 368         TIM3->CR1 &= (u8)(~TIM3_CR1_URS);
1416  01a5 72155320      	bres	21280,#2
1417  01a9               L575:
1418                     ; 370 }
1421  01a9 81            	ret
1478                     ; 381 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1478                     ; 382 {
1479                     	switch	.text
1480  01aa               _TIM3_SelectOnePulseMode:
1484                     ; 384     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1486                     ; 387     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1488  01aa a30000        	cpw	x,#0
1489  01ad 2706          	jreq	L526
1490                     ; 389         TIM3->CR1 |= TIM3_CR1_OPM;
1492  01af 72165320      	bset	21280,#3
1494  01b3 2004          	jra	L726
1495  01b5               L526:
1496                     ; 393         TIM3->CR1 &= (u8)(~TIM3_CR1_OPM);
1498  01b5 72175320      	bres	21280,#3
1499  01b9               L726:
1500                     ; 396 }
1503  01b9 81            	ret
1571                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1571                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1571                     ; 429 {
1572                     	switch	.text
1573  01ba               _TIM3_PrescalerConfig:
1575  01ba 89            	pushw	x
1576       00000000      OFST:	set	0
1579                     ; 431     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1581                     ; 432     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1583                     ; 435     TIM3->PSCR = (u8)Prescaler;
1585  01bb 9f            	ld	a,xl
1586  01bc c7532a        	ld	21290,a
1587                     ; 438     TIM3->EGR = (u8)TIM3_PSCReloadMode;
1589  01bf 7b06          	ld	a,(OFST+6,sp)
1590  01c1 c75324        	ld	21284,a
1591                     ; 439 }
1594  01c4 85            	popw	x
1595  01c5 81            	ret
1653                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1653                     ; 451 {
1654                     	switch	.text
1655  01c6               _TIM3_ForcedOC1Config:
1657  01c6 89            	pushw	x
1658       00000000      OFST:	set	0
1661                     ; 453     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1663                     ; 456     TIM3->CCMR1 =  (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM))  | (u8)TIM3_ForcedAction);
1665  01c7 c65325        	ld	a,21285
1666  01ca a48f          	and	a,#143
1667  01cc 1a02          	or	a,(OFST+2,sp)
1668  01ce c75325        	ld	21285,a
1669                     ; 457 }
1672  01d1 85            	popw	x
1673  01d2 81            	ret
1709                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1709                     ; 469 {
1710                     	switch	.text
1711  01d3               _TIM3_ForcedOC2Config:
1713  01d3 89            	pushw	x
1714       00000000      OFST:	set	0
1717                     ; 471     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1719                     ; 474     TIM3->CCMR2 =  (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_ForcedAction);
1721  01d4 c65326        	ld	a,21286
1722  01d7 a48f          	and	a,#143
1723  01d9 1a02          	or	a,(OFST+2,sp)
1724  01db c75326        	ld	21286,a
1725                     ; 475 }
1728  01de 85            	popw	x
1729  01df 81            	ret
1765                     ; 484 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1765                     ; 485 {
1766                     	switch	.text
1767  01e0               _TIM3_ARRPreloadConfig:
1771                     ; 487     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1773                     ; 490     if (NewState != DISABLE)
1775  01e0 a30000        	cpw	x,#0
1776  01e3 2706          	jreq	L547
1777                     ; 492         TIM3->CR1 |= TIM3_CR1_ARPE;
1779  01e5 721e5320      	bset	21280,#7
1781  01e9 2004          	jra	L747
1782  01eb               L547:
1783                     ; 496         TIM3->CR1 &= (u8)(~TIM3_CR1_ARPE);
1785  01eb 721f5320      	bres	21280,#7
1786  01ef               L747:
1787                     ; 498 }
1790  01ef 81            	ret
1826                     ; 507 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1826                     ; 508 {
1827                     	switch	.text
1828  01f0               _TIM3_OC1PreloadConfig:
1832                     ; 510     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1834                     ; 513     if (NewState != DISABLE)
1836  01f0 a30000        	cpw	x,#0
1837  01f3 2706          	jreq	L767
1838                     ; 515         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1840  01f5 72165325      	bset	21285,#3
1842  01f9 2004          	jra	L177
1843  01fb               L767:
1844                     ; 519         TIM3->CCMR1 &= (u8)(~TIM3_CCMR_OCxPE);
1846  01fb 72175325      	bres	21285,#3
1847  01ff               L177:
1848                     ; 521 }
1851  01ff 81            	ret
1887                     ; 530 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1887                     ; 531 {
1888                     	switch	.text
1889  0200               _TIM3_OC2PreloadConfig:
1893                     ; 533     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1895                     ; 536     if (NewState != DISABLE)
1897  0200 a30000        	cpw	x,#0
1898  0203 2706          	jreq	L1101
1899                     ; 538         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1901  0205 72165326      	bset	21286,#3
1903  0209 2004          	jra	L3101
1904  020b               L1101:
1905                     ; 542         TIM3->CCMR2 &= (u8)(~TIM3_CCMR_OCxPE);
1907  020b 72175326      	bres	21286,#3
1908  020f               L3101:
1909                     ; 544 }
1912  020f 81            	ret
1977                     ; 555 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1977                     ; 556 {
1978                     	switch	.text
1979  0210               _TIM3_GenerateEvent:
1983                     ; 558     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1985                     ; 561     TIM3->EGR = (u8)TIM3_EventSource;
1987  0210 9f            	ld	a,xl
1988  0211 c75324        	ld	21284,a
1989                     ; 562 }
1992  0214 81            	ret
2028                     ; 573 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2028                     ; 574 {
2029                     	switch	.text
2030  0215               _TIM3_OC1PolarityConfig:
2034                     ; 576     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2036                     ; 579     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2038  0215 a30000        	cpw	x,#0
2039  0218 2706          	jreq	L3601
2040                     ; 581         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2042  021a 72125327      	bset	21287,#1
2044  021e 2004          	jra	L5601
2045  0220               L3601:
2046                     ; 585         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
2048  0220 72135327      	bres	21287,#1
2049  0224               L5601:
2050                     ; 587 }
2053  0224 81            	ret
2089                     ; 598 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2089                     ; 599 {
2090                     	switch	.text
2091  0225               _TIM3_OC2PolarityConfig:
2095                     ; 601     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2097                     ; 604     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2099  0225 a30000        	cpw	x,#0
2100  0228 2706          	jreq	L5011
2101                     ; 606         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2103  022a 721a5327      	bset	21287,#5
2105  022e 2004          	jra	L7011
2106  0230               L5011:
2107                     ; 610         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
2109  0230 721b5327      	bres	21287,#5
2110  0234               L7011:
2111                     ; 612 }
2114  0234 81            	ret
2159                     ; 625 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2159                     ; 626 {
2160                     	switch	.text
2161  0235               _TIM3_CCxCmd:
2163  0235 89            	pushw	x
2164       00000000      OFST:	set	0
2167                     ; 628     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2169                     ; 629     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2171                     ; 631     if (TIM3_Channel == TIM3_CHANNEL_1)
2173  0236 a30000        	cpw	x,#0
2174  0239 2610          	jrne	L3311
2175                     ; 634         if (NewState != DISABLE)
2177  023b 1e05          	ldw	x,(OFST+5,sp)
2178  023d 2706          	jreq	L5311
2179                     ; 636             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2181  023f 72105327      	bset	21287,#0
2183  0243 2014          	jra	L1411
2184  0245               L5311:
2185                     ; 640             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2187  0245 72115327      	bres	21287,#0
2188  0249 200e          	jra	L1411
2189  024b               L3311:
2190                     ; 647         if (NewState != DISABLE)
2192  024b 1e05          	ldw	x,(OFST+5,sp)
2193  024d 2706          	jreq	L3411
2194                     ; 649             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2196  024f 72185327      	bset	21287,#4
2198  0253 2004          	jra	L1411
2199  0255               L3411:
2200                     ; 653             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2202  0255 72195327      	bres	21287,#4
2203  0259               L1411:
2204                     ; 657 }
2207  0259 85            	popw	x
2208  025a 81            	ret
2253                     ; 678 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2253                     ; 679 {
2254                     	switch	.text
2255  025b               _TIM3_SelectOCxM:
2257  025b 89            	pushw	x
2258       00000000      OFST:	set	0
2261                     ; 681     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2263                     ; 682     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2265                     ; 684     if (TIM3_Channel == TIM3_CHANNEL_1)
2267  025c a30000        	cpw	x,#0
2268  025f 2610          	jrne	L1711
2269                     ; 687         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2271  0261 72115327      	bres	21287,#0
2272                     ; 690         TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2274  0265 c65325        	ld	a,21285
2275  0268 a48f          	and	a,#143
2276  026a 1a06          	or	a,(OFST+6,sp)
2277  026c c75325        	ld	21285,a
2279  026f 200e          	jra	L3711
2280  0271               L1711:
2281                     ; 695         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2283  0271 72195327      	bres	21287,#4
2284                     ; 698         TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2286  0275 c65326        	ld	a,21286
2287  0278 a48f          	and	a,#143
2288  027a 1a06          	or	a,(OFST+6,sp)
2289  027c c75326        	ld	21286,a
2290  027f               L3711:
2291                     ; 700 }
2294  027f 85            	popw	x
2295  0280 81            	ret
2329                     ; 709 void TIM3_SetCounter(u16 Counter)
2329                     ; 710 {
2330                     	switch	.text
2331  0281               _TIM3_SetCounter:
2335                     ; 712     TIM3->CNTRH = (u8)(Counter >> 8);
2337  0281 9e            	ld	a,xh
2338  0282 c75328        	ld	21288,a
2339                     ; 713     TIM3->CNTRL = (u8)(Counter);
2341  0285 9f            	ld	a,xl
2342  0286 c75329        	ld	21289,a
2343                     ; 715 }
2346  0289 81            	ret
2380                     ; 724 void TIM3_SetAutoreload(u16 Autoreload)
2380                     ; 725 {
2381                     	switch	.text
2382  028a               _TIM3_SetAutoreload:
2386                     ; 727     TIM3->ARRH = (u8)(Autoreload >> 8);
2388  028a 9e            	ld	a,xh
2389  028b c7532b        	ld	21291,a
2390                     ; 728     TIM3->ARRL = (u8)(Autoreload);
2392  028e 9f            	ld	a,xl
2393  028f c7532c        	ld	21292,a
2394                     ; 729 }
2397  0292 81            	ret
2431                     ; 738 void TIM3_SetCompare1(u16 Compare1)
2431                     ; 739 {
2432                     	switch	.text
2433  0293               _TIM3_SetCompare1:
2437                     ; 741     TIM3->CCR1H = (u8)(Compare1 >> 8);
2439  0293 9e            	ld	a,xh
2440  0294 c7532d        	ld	21293,a
2441                     ; 742     TIM3->CCR1L = (u8)(Compare1);
2443  0297 9f            	ld	a,xl
2444  0298 c7532e        	ld	21294,a
2445                     ; 743 }
2448  029b 81            	ret
2482                     ; 752 void TIM3_SetCompare2(u16 Compare2)
2482                     ; 753 {
2483                     	switch	.text
2484  029c               _TIM3_SetCompare2:
2488                     ; 755     TIM3->CCR2H = (u8)(Compare2 >> 8);
2490  029c 9e            	ld	a,xh
2491  029d c7532f        	ld	21295,a
2492                     ; 756     TIM3->CCR2L = (u8)(Compare2);
2494  02a0 9f            	ld	a,xl
2495  02a1 c75330        	ld	21296,a
2496                     ; 757 }
2499  02a4 81            	ret
2535                     ; 770 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2535                     ; 771 {
2536                     	switch	.text
2537  02a5               _TIM3_SetIC1Prescaler:
2539  02a5 89            	pushw	x
2540       00000000      OFST:	set	0
2543                     ; 773     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2545                     ; 776     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC1Prescaler);
2547  02a6 c65325        	ld	a,21285
2548  02a9 a4f3          	and	a,#243
2549  02ab 1a02          	or	a,(OFST+2,sp)
2550  02ad c75325        	ld	21285,a
2551                     ; 777 }
2554  02b0 85            	popw	x
2555  02b1 81            	ret
2591                     ; 789 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2591                     ; 790 {
2592                     	switch	.text
2593  02b2               _TIM3_SetIC2Prescaler:
2595  02b2 89            	pushw	x
2596       00000000      OFST:	set	0
2599                     ; 792     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2601                     ; 795     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC2Prescaler);
2603  02b3 c65326        	ld	a,21286
2604  02b6 a4f3          	and	a,#243
2605  02b8 1a02          	or	a,(OFST+2,sp)
2606  02ba c75326        	ld	21286,a
2607                     ; 796 }
2610  02bd 85            	popw	x
2611  02be 81            	ret
2663                     ; 803 u16 TIM3_GetCapture1(void)
2663                     ; 804 {
2664                     	switch	.text
2665  02bf               _TIM3_GetCapture1:
2667  02bf 5204          	subw	sp,#4
2668       00000004      OFST:	set	4
2671                     ; 806     u16 tmpccr1 = 0;
2673                     ; 807     u8 tmpccr1l=0, tmpccr1h=0;
2677                     ; 809     tmpccr1h = TIM3->CCR1H;
2679  02c1 c6532d        	ld	a,21293
2680  02c4 6b02          	ld	(OFST-2,sp),a
2681                     ; 810     tmpccr1l = TIM3->CCR1L;
2683  02c6 c6532e        	ld	a,21294
2684  02c9 6b01          	ld	(OFST-3,sp),a
2685                     ; 812     tmpccr1 = (u16)(tmpccr1l);
2687  02cb 7b01          	ld	a,(OFST-3,sp)
2688  02cd 5f            	clrw	x
2689  02ce 97            	ld	xl,a
2690  02cf 1f03          	ldw	(OFST-1,sp),x
2691                     ; 813     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
2693  02d1 7b02          	ld	a,(OFST-2,sp)
2694  02d3 5f            	clrw	x
2695  02d4 97            	ld	xl,a
2696  02d5 4f            	clr	a
2697  02d6 02            	rlwa	x,a
2698  02d7 01            	rrwa	x,a
2699  02d8 1a04          	or	a,(OFST+0,sp)
2700  02da 01            	rrwa	x,a
2701  02db 1a03          	or	a,(OFST-1,sp)
2702  02dd 01            	rrwa	x,a
2703  02de 1f03          	ldw	(OFST-1,sp),x
2704                     ; 815     return (u16)tmpccr1;
2706  02e0 1e03          	ldw	x,(OFST-1,sp)
2709  02e2 5b04          	addw	sp,#4
2710  02e4 81            	ret
2762                     ; 824 u16 TIM3_GetCapture2(void)
2762                     ; 825 {
2763                     	switch	.text
2764  02e5               _TIM3_GetCapture2:
2766  02e5 5204          	subw	sp,#4
2767       00000004      OFST:	set	4
2770                     ; 827     u16 tmpccr2 = 0;
2772                     ; 828     u8 tmpccr2l=0, tmpccr2h=0;
2776                     ; 830     tmpccr2h = TIM3->CCR2H;
2778  02e7 c6532f        	ld	a,21295
2779  02ea 6b02          	ld	(OFST-2,sp),a
2780                     ; 831     tmpccr2l = TIM3->CCR2L;
2782  02ec c65330        	ld	a,21296
2783  02ef 6b01          	ld	(OFST-3,sp),a
2784                     ; 833     tmpccr2 = (u16)(tmpccr2l);
2786  02f1 7b01          	ld	a,(OFST-3,sp)
2787  02f3 5f            	clrw	x
2788  02f4 97            	ld	xl,a
2789  02f5 1f03          	ldw	(OFST-1,sp),x
2790                     ; 834     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
2792  02f7 7b02          	ld	a,(OFST-2,sp)
2793  02f9 5f            	clrw	x
2794  02fa 97            	ld	xl,a
2795  02fb 4f            	clr	a
2796  02fc 02            	rlwa	x,a
2797  02fd 01            	rrwa	x,a
2798  02fe 1a04          	or	a,(OFST+0,sp)
2799  0300 01            	rrwa	x,a
2800  0301 1a03          	or	a,(OFST-1,sp)
2801  0303 01            	rrwa	x,a
2802  0304 1f03          	ldw	(OFST-1,sp),x
2803                     ; 836     return (u16)tmpccr2;
2805  0306 1e03          	ldw	x,(OFST-1,sp)
2808  0308 5b04          	addw	sp,#4
2809  030a 81            	ret
2832                     ; 845 u16 TIM3_GetCounter(void)
2832                     ; 846 {
2833                     	switch	.text
2834  030b               _TIM3_GetCounter:
2836  030b 89            	pushw	x
2837       00000002      OFST:	set	2
2840                     ; 848     return (u16)(((u16)TIM3->CNTRH << 8) | (u16)(TIM3->CNTRL));
2842  030c c65329        	ld	a,21289
2843  030f 5f            	clrw	x
2844  0310 97            	ld	xl,a
2845  0311 1f01          	ldw	(OFST-1,sp),x
2846  0313 c65328        	ld	a,21288
2847  0316 5f            	clrw	x
2848  0317 97            	ld	xl,a
2849  0318 4f            	clr	a
2850  0319 02            	rlwa	x,a
2851  031a 01            	rrwa	x,a
2852  031b 1a02          	or	a,(OFST+0,sp)
2853  031d 01            	rrwa	x,a
2854  031e 1a01          	or	a,(OFST-1,sp)
2855  0320 01            	rrwa	x,a
2858  0321 5b02          	addw	sp,#2
2859  0323 81            	ret
2883                     ; 858 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2883                     ; 859 {
2884                     	switch	.text
2885  0324               _TIM3_GetPrescaler:
2889                     ; 861     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2891  0324 c6532a        	ld	a,21290
2892  0327 5f            	clrw	x
2893  0328 97            	ld	xl,a
2896  0329 81            	ret
3021                     ; 876 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3021                     ; 877 {
3022                     	switch	.text
3023  032a               _TIM3_GetFlagStatus:
3025  032a 89            	pushw	x
3026  032b 5205          	subw	sp,#5
3027       00000005      OFST:	set	5
3030                     ; 878     volatile FlagStatus bitstatus = RESET;
3032  032d 5f            	clrw	x
3033  032e 1f04          	ldw	(OFST-1,sp),x
3034                     ; 882     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3036                     ; 884     tim3_flag_l = (u8)(TIM3_FLAG);
3038  0330 7b07          	ld	a,(OFST+2,sp)
3039  0332 6b02          	ld	(OFST-3,sp),a
3040                     ; 885     tim3_flag_h = (u8)(TIM3_FLAG >> 8);
3042  0334 7b06          	ld	a,(OFST+1,sp)
3043  0336 6b03          	ld	(OFST-2,sp),a
3044                     ; 887     if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != (u8)RESET )
3046  0338 c65323        	ld	a,21283
3047  033b 1403          	and	a,(OFST-2,sp)
3048  033d 6b01          	ld	(OFST-4,sp),a
3049  033f c65322        	ld	a,21282
3050  0342 1402          	and	a,(OFST-3,sp)
3051  0344 1a01          	or	a,(OFST-4,sp)
3052  0346 2707          	jreq	L5741
3053                     ; 889         bitstatus = SET;
3055  0348 ae0001        	ldw	x,#1
3056  034b 1f04          	ldw	(OFST-1,sp),x
3058  034d 2003          	jra	L7741
3059  034f               L5741:
3060                     ; 893         bitstatus = RESET;
3062  034f 5f            	clrw	x
3063  0350 1f04          	ldw	(OFST-1,sp),x
3064  0352               L7741:
3065                     ; 895     return (FlagStatus)bitstatus;
3067  0352 1e04          	ldw	x,(OFST-1,sp)
3070  0354 5b07          	addw	sp,#7
3071  0356 81            	ret
3106                     ; 910 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3106                     ; 911 {
3107                     	switch	.text
3108  0357               _TIM3_ClearFlag:
3110  0357 89            	pushw	x
3111       00000000      OFST:	set	0
3114                     ; 913     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3116                     ; 916     TIM3->SR1 = (u8)(~((u8)(TIM3_FLAG)));
3118  0358 9f            	ld	a,xl
3119  0359 43            	cpl	a
3120  035a c75322        	ld	21282,a
3121                     ; 917     TIM3->SR2 = (u8)(~((u8)(TIM3_FLAG >> 8)));
3123  035d 7b01          	ld	a,(OFST+1,sp)
3124  035f 43            	cpl	a
3125  0360 c75323        	ld	21283,a
3126                     ; 918 }
3129  0363 85            	popw	x
3130  0364 81            	ret
3194                     ; 931 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3194                     ; 932 {
3195                     	switch	.text
3196  0365               _TIM3_GetITStatus:
3198  0365 89            	pushw	x
3199  0366 5204          	subw	sp,#4
3200       00000004      OFST:	set	4
3203                     ; 933     volatile ITStatus bitstatus = RESET;
3205  0368 5f            	clrw	x
3206  0369 1f03          	ldw	(OFST-1,sp),x
3207                     ; 934     vu8 TIM3_itStatus = 0, TIM3_itEnable = 0;
3209  036b 0f01          	clr	(OFST-3,sp)
3212  036d 0f02          	clr	(OFST-2,sp)
3213                     ; 937     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3215                     ; 939     TIM3_itStatus = (u8)(TIM3->SR1 & TIM3_IT);
3217  036f c65322        	ld	a,21282
3218  0372 1406          	and	a,(OFST+2,sp)
3219  0374 6b01          	ld	(OFST-3,sp),a
3220                     ; 941     TIM3_itEnable = (u8)(TIM3->IER & TIM3_IT);
3222  0376 c65321        	ld	a,21281
3223  0379 1406          	and	a,(OFST+2,sp)
3224  037b 6b02          	ld	(OFST-2,sp),a
3225                     ; 943     if ((TIM3_itStatus != (u8)RESET ) && (TIM3_itEnable != (u8)RESET ))
3227  037d 0d01          	tnz	(OFST-3,sp)
3228  037f 270b          	jreq	L1551
3230  0381 0d02          	tnz	(OFST-2,sp)
3231  0383 2707          	jreq	L1551
3232                     ; 945         bitstatus = SET;
3234  0385 ae0001        	ldw	x,#1
3235  0388 1f03          	ldw	(OFST-1,sp),x
3237  038a 2003          	jra	L3551
3238  038c               L1551:
3239                     ; 949         bitstatus = RESET;
3241  038c 5f            	clrw	x
3242  038d 1f03          	ldw	(OFST-1,sp),x
3243  038f               L3551:
3244                     ; 951     return (ITStatus)(bitstatus);
3246  038f 1e03          	ldw	x,(OFST-1,sp)
3249  0391 5b06          	addw	sp,#6
3250  0393 81            	ret
3286                     ; 964 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3286                     ; 965 {
3287                     	switch	.text
3288  0394               _TIM3_ClearITPendingBit:
3292                     ; 967     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3294                     ; 970     TIM3->SR1 = (u8)(~TIM3_IT);
3296  0394 9f            	ld	a,xl
3297  0395 43            	cpl	a
3298  0396 c75322        	ld	21282,a
3299                     ; 971 }
3302  0399 81            	ret
3354                     ; 990 static void TI1_Config(u8 TIM3_ICPolarity,
3354                     ; 991                        u8 TIM3_ICSelection,
3354                     ; 992                        u8 TIM3_ICFilter)
3354                     ; 993 {
3355                     	switch	.text
3356  039a               L3_TI1_Config:
3358  039a 89            	pushw	x
3359  039b 88            	push	a
3360       00000001      OFST:	set	1
3363                     ; 995     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
3365  039c 72115327      	bres	21287,#0
3366                     ; 998     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3368  03a0 7b06          	ld	a,(OFST+5,sp)
3369  03a2 97            	ld	xl,a
3370  03a3 a610          	ld	a,#16
3371  03a5 42            	mul	x,a
3372  03a6 9f            	ld	a,xl
3373  03a7 1a03          	or	a,(OFST+2,sp)
3374  03a9 6b01          	ld	(OFST+0,sp),a
3375  03ab c65325        	ld	a,21285
3376  03ae a40c          	and	a,#12
3377  03b0 1a01          	or	a,(OFST+0,sp)
3378  03b2 c75325        	ld	21285,a
3379                     ; 1001     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3381  03b5 0d02          	tnz	(OFST+1,sp)
3382  03b7 2706          	jreq	L1261
3383                     ; 1003         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3385  03b9 72125327      	bset	21287,#1
3387  03bd 2004          	jra	L3261
3388  03bf               L1261:
3389                     ; 1007         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
3391  03bf 72135327      	bres	21287,#1
3392  03c3               L3261:
3393                     ; 1010     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3395  03c3 72105327      	bset	21287,#0
3396                     ; 1011 }
3399  03c7 5b03          	addw	sp,#3
3400  03c9 81            	ret
3452                     ; 1030 static void TI2_Config(u8 TIM3_ICPolarity,
3452                     ; 1031                        u8 TIM3_ICSelection,
3452                     ; 1032                        u8 TIM3_ICFilter)
3452                     ; 1033 {
3453                     	switch	.text
3454  03ca               L5_TI2_Config:
3456  03ca 89            	pushw	x
3457  03cb 88            	push	a
3458       00000001      OFST:	set	1
3461                     ; 1035     TIM3->CCER1 &=  (u8)(~TIM3_CCER1_CC2E);
3463  03cc 72195327      	bres	21287,#4
3464                     ; 1038     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3466  03d0 7b06          	ld	a,(OFST+5,sp)
3467  03d2 97            	ld	xl,a
3468  03d3 a610          	ld	a,#16
3469  03d5 42            	mul	x,a
3470  03d6 9f            	ld	a,xl
3471  03d7 1a03          	or	a,(OFST+2,sp)
3472  03d9 6b01          	ld	(OFST+0,sp),a
3473  03db c65326        	ld	a,21286
3474  03de a40c          	and	a,#12
3475  03e0 1a01          	or	a,(OFST+0,sp)
3476  03e2 c75326        	ld	21286,a
3477                     ; 1042     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3479  03e5 0d02          	tnz	(OFST+1,sp)
3480  03e7 2706          	jreq	L3561
3481                     ; 1044         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3483  03e9 721a5327      	bset	21287,#5
3485  03ed 2004          	jra	L5561
3486  03ef               L3561:
3487                     ; 1048         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
3489  03ef 721b5327      	bres	21287,#5
3490  03f3               L5561:
3491                     ; 1052     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3493  03f3 72185327      	bset	21287,#4
3494                     ; 1054 }
3497  03f7 5b03          	addw	sp,#3
3498  03f9 81            	ret
3511                     	xdef	_TIM3_ClearITPendingBit
3512                     	xdef	_TIM3_GetITStatus
3513                     	xdef	_TIM3_ClearFlag
3514                     	xdef	_TIM3_GetFlagStatus
3515                     	xdef	_TIM3_GetPrescaler
3516                     	xdef	_TIM3_GetCounter
3517                     	xdef	_TIM3_GetCapture2
3518                     	xdef	_TIM3_GetCapture1
3519                     	xdef	_TIM3_SetIC2Prescaler
3520                     	xdef	_TIM3_SetIC1Prescaler
3521                     	xdef	_TIM3_SetCompare2
3522                     	xdef	_TIM3_SetCompare1
3523                     	xdef	_TIM3_SetAutoreload
3524                     	xdef	_TIM3_SetCounter
3525                     	xdef	_TIM3_SelectOCxM
3526                     	xdef	_TIM3_CCxCmd
3527                     	xdef	_TIM3_OC2PolarityConfig
3528                     	xdef	_TIM3_OC1PolarityConfig
3529                     	xdef	_TIM3_GenerateEvent
3530                     	xdef	_TIM3_OC2PreloadConfig
3531                     	xdef	_TIM3_OC1PreloadConfig
3532                     	xdef	_TIM3_ARRPreloadConfig
3533                     	xdef	_TIM3_ForcedOC2Config
3534                     	xdef	_TIM3_ForcedOC1Config
3535                     	xdef	_TIM3_PrescalerConfig
3536                     	xdef	_TIM3_SelectOnePulseMode
3537                     	xdef	_TIM3_UpdateRequestConfig
3538                     	xdef	_TIM3_UpdateDisableConfig
3539                     	xdef	_TIM3_ITConfig
3540                     	xdef	_TIM3_Cmd
3541                     	xdef	_TIM3_PWMIConfig
3542                     	xdef	_TIM3_ICInit
3543                     	xdef	_TIM3_OC2Init
3544                     	xdef	_TIM3_OC1Init
3545                     	xdef	_TIM3_TimeBaseInit
3546                     	xdef	_TIM3_DeInit
3565                     	end
