/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#ifndef __AES_H
#define __AES_H

void ecb_aes_encrypt(const u8 plain_text[], const size_t plain_text_size, u8 cipher_text[], const u8 key[]);
void ecb_aes_decrypt(const u8 cipher_text[], const size_t cipher_text_size, u8 plain_text[], const u8 key[]);

#endif
