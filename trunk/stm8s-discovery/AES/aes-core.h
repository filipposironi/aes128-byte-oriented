/*
 * Authors:
 * - Filippo Sironi (filippo.sironi@gmail.com)
 * - Matteo Villa (villa.matteo@gmail.com)
 */

#ifndef __AES_CORE_H
#define __AES_CORE_H

void aes_keyexp(const u8 key[], u8 key_sched[]);

void aes_encrypt(const u8 plain_text[], u8 cipher_text[], const u8 key_sched[]);
void aes_decrypt(const u8 cipher_text[], u8 plain_text[], const u8 key_sched[]);

#endif
