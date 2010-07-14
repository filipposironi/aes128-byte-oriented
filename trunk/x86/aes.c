/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "aes.h"
#include "aes-core.h"

void ecb_aes_encrypt(const uint8_t plain_text[], const size_t plain_text_size, uint8_t cipher_text[], const uint8_t key[])
{
	uint8_t pad_value = plain_text_size & 0x0f;
	size_t cipher_text_size = plain_text_size + 16 - pad_value;
	
	uint8_t key_sched[176];
	
	unsigned int i;
	
	memcpy(cipher_text, plain_text, plain_text_size);
	memset(cipher_text + plain_text_size, pad_value, 16 - pad_value);
	aes_keyexp(key, key_sched);
	for (i = 0; i < cipher_text_size; i += 16)
		aes_encrypt(cipher_text + i, cipher_text + i, key_sched);
}

void ecb_aes_decrypt(const uint8_t cipher_text[], const size_t cipher_text_size, uint8_t plain_text[], const uint8_t key[])
{
	uint8_t plain_text_last[16];
	size_t plain_text_size = cipher_text_size - 16;
	
	uint8_t key_sched[176];
	
	unsigned int i;
	
	aes_keyexp(key, key_sched);
	for (i = 0; i < plain_text_size; i += 16)
		aes_decrypt(cipher_text + i, plain_text + i, key_sched);
	aes_decrypt(cipher_text + i, plain_text_last, key_sched);
	
	plain_text_size += plain_text_last[15];
	for (i = cipher_text_size - 16; i < plain_text_size; ++i)
		plain_text[i] = plain_text_last[i];
}
