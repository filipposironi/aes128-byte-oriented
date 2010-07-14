/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#ifndef __AES_H
#define __AES_H

void ecb_aes_encrypt(const uint8_t plain_text[], const size_t plain_text_size, uint8_t cipher_text[], const uint8_t key[]);
void ecb_aes_decrypt(const uint8_t cipher_text[], const size_t cipher_text_size, uint8_t plain_text[], const uint8_t key[]);

#endif
