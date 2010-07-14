/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#ifndef __AES_CORE_H
#define __AES_CORE_H

void aes_keyexp(const uint8_t key[], uint8_t key_sched[]);

void aes_encrypt(const uint8_t plain_text[], uint8_t cipher_text[], const uint8_t key_sched[]);
void aes_decrypt(const uint8_t cipher_text[], uint8_t plain_text[], const uint8_t key_sched[]);

#endif
