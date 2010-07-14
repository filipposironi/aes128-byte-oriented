/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#include "stm8s.h"
#include "stm8s_clk.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "aes.h"

extern volatile u16 overflows;
volatile u16 t_begin, t_end;

void test_ctrl(void);
void test_perf(void);

int main(void)
{
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);



	UART2_DeInit();

	UART2_Init(
		(u32) 9600,
		UART2_WORDLENGTH_8D,
		UART2_STOPBITS_1,
		UART2_PARITY_NO,
		UART2_SYNCMODE_CLOCK_DISABLE,
		UART2_MODE_TXRX_ENABLE);



	printf("\n\rstart\n\r");
	// test_ctrl();
	test_perf();
	printf("\n\rstop\n\r");

	for (;;)
		nop();

	return 0;
}

char putchar(char c)
{
	UART2_SendData8(c);
	while ((UART2->SR & UART2_SR_TXE ) != UART2_SR_TXE);

	return c;
}

void test_ctrl(void)
{
	u8 text[] = {

		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,

		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	};

	u8 plain_text[16], cipher_text[32];

	u8 key[] = "Bella di padella";



	unsigned int i, j;



	for (i = 0; i < 1024; ++i) {

		text[15] = i & 0xff;

		text[14] = i >> 8;


		printf("\n\r");

		printf("plain text:  ");

		for (j = 0; j < 16; ++j)

			printf("%02x", (int) text[j]);

		printf("\n\r");



		ecb_aes_encrypt(text, 16, cipher_text, key);



		printf("cipher text: ");

		for (j = 0; j < 32; ++j)

			printf("%02x", (int) cipher_text[j]);

		printf("\n\r");



		ecb_aes_decrypt(cipher_text, 32, plain_text, key);



		printf("plain text:  ");

		for (j = 0; j < 16; ++j) {

			printf("%02x", (int) plain_text[j]);

			if (plain_text[j] != text[j]) {

				printf(" ERROR");

				break;

			}

		}

		printf("\n\r");

	}
}

#define BLOCKS (53)
#define PTS (BLOCKS * 16)
#define CTS ((BLOCKS + 1) * 16)

void test_perf(void)
{
	u8 plain_text[PTS];
	u8 cipher_text[CTS];
	u8 key[] = "Bella di padella";

	unsigned int i, j;

	for (i = 0; i < BLOCKS; ++i) {
		overflows = 0;
		t_begin = 0;
		t_end = 0;

		TIM1_DeInit();
		TIM1_TimeBaseInit(2, TIM1_COUNTERMODE_UP, U16_MAX, 0);
		TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);

		enableInterrupts();

		TIM1_GetCounter();
		TIM1_Cmd(ENABLE);
		t_begin = TIM1_GetCounter();
		ecb_aes_encrypt(plain_text, (i + 1) * 16, cipher_text, key);
		t_end = TIM1_GetCounter();
		TIM1_Cmd(DISABLE);

		disableInterrupts();

		printf("\n\r");
		printf("encrypt %d blocks takes: %lu us\n\r", i + 2,
				((u32) overflows * U16_MAX) + t_end - t_begin);

		overflows = 0;
		t_begin = 0;
		t_end = 0;

		TIM1_DeInit();
		TIM1_TimeBaseInit(2, TIM1_COUNTERMODE_UP, U16_MAX, 0);
		TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);

		enableInterrupts();

		TIM1_GetCounter();
		TIM1_Cmd(ENABLE);
		t_begin = TIM1_GetCounter();
		ecb_aes_decrypt(cipher_text, (i + 2) * 16, plain_text, key);
		t_end = TIM1_GetCounter();
		TIM1_Cmd(DISABLE);

		disableInterrupts();

		printf("decrypt %d blocks takes: %lu us\n\r", i + 2,
				((u32) overflows * U16_MAX) + t_end - t_begin);
	}
}
