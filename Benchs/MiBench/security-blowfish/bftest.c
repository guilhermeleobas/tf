/* crypto/bf/bftest.c */
/* Copyright (C) 1995-1997 Eric Young (eay@mincom.oz.au)
 * All rights reserved.
 *
 * This package is an SSL implementation written
 * by Eric Young (eay@mincom.oz.au).
 * The implementation was written so as to conform with Netscapes SSL.
 *
 * This library is free for commercial and non-commercial use as long as
 * the following conditions are aheared to.  The following conditions
 * apply to all code found in this distribution, be it the RC4, RSA,
 * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
 * included with this distribution is covered by the same copyright terms
 * except that the holder is Tim Hudson (tjh@mincom.oz.au).
 *
 * Copyright remains Eric Young's, and as such any Copyright notices in
 * the code are not to be removed.
 * If this package is used in a product, Eric Young should be given attribution
 * as the author of the parts of the library used.
 * This can be in the form of a textual message at program startup or
 * in documentation (online or textual) provided with the package.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *    "This product includes cryptographic software written by
 *     Eric Young (eay@mincom.oz.au)"
 *    The word 'cryptographic' can be left out if the rouines from the library
 *    being used are not cryptographic related :-).
 * 4. If you include any Windows specific code (or a derivative thereof) from
 *    the apps directory (application code) you must include an acknowledgement:
 *    "This product includes software written by Tim Hudson (tjh@mincom.oz.au)"
 *
 * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * The licence and distribution terms for any publically available version or
 * derivative of this code cannot be changed.  i.e. this code cannot simply be
 * copied and put under another distribution licence
 * [including the GNU Public Licence.]
 */

/* This has been a quickly hacked 'ideatest.c'.  When I add tests for other
 * RC2 modes, more of the code will be uncommented. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "blowfish.h"

int test();

char *bf_key[2] = {"abcdefghijklmnopqrstuvwxyz", "Who is John Galt?"};

/* big endian */
BF_LONG bf_plain[2][2] = {{0x424c4f57, 0x46495348}, {0xfedcba98, 0x76543210}};

BF_LONG bf_cipher[2][2] = {{0x324ed0fe, 0xf413a203}, {0xcc91732b, 0x8022f684}};
/************/

/* Lets use the DES test vectors :-) */
#define NUM_TESTS 34
static unsigned char ecb_data[NUM_TESTS][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10},
    {0x7C, 0xA1, 0x10, 0x45, 0x4A, 0x1A, 0x6E, 0x57},
    {0x01, 0x31, 0xD9, 0x61, 0x9D, 0xC1, 0x37, 0x6E},
    {0x07, 0xA1, 0x13, 0x3E, 0x4A, 0x0B, 0x26, 0x86},
    {0x38, 0x49, 0x67, 0x4C, 0x26, 0x02, 0x31, 0x9E},
    {0x04, 0xB9, 0x15, 0xBA, 0x43, 0xFE, 0xB5, 0xB6},
    {0x01, 0x13, 0xB9, 0x70, 0xFD, 0x34, 0xF2, 0xCE},
    {0x01, 0x70, 0xF1, 0x75, 0x46, 0x8F, 0xB5, 0xE6},
    {0x43, 0x29, 0x7F, 0xAD, 0x38, 0xE3, 0x73, 0xFE},
    {0x07, 0xA7, 0x13, 0x70, 0x45, 0xDA, 0x2A, 0x16},
    {0x04, 0x68, 0x91, 0x04, 0xC2, 0xFD, 0x3B, 0x2F},
    {0x37, 0xD0, 0x6B, 0xB5, 0x16, 0xCB, 0x75, 0x46},
    {0x1F, 0x08, 0x26, 0x0D, 0x1A, 0xC2, 0x46, 0x5E},
    {0x58, 0x40, 0x23, 0x64, 0x1A, 0xBA, 0x61, 0x76},
    {0x02, 0x58, 0x16, 0x16, 0x46, 0x29, 0xB0, 0x07},
    {0x49, 0x79, 0x3E, 0xBC, 0x79, 0xB3, 0x25, 0x8F},
    {0x4F, 0xB0, 0x5E, 0x15, 0x15, 0xAB, 0x73, 0xA7},
    {0x49, 0xE9, 0x5D, 0x6D, 0x4C, 0xA2, 0x29, 0xBF},
    {0x01, 0x83, 0x10, 0xDC, 0x40, 0x9B, 0x26, 0xD6},
    {0x1C, 0x58, 0x7F, 0x1C, 0x13, 0x92, 0x4F, 0xEF},
    {0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01},
    {0x1F, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x0E},
    {0xE0, 0xFE, 0xE0, 0xFE, 0xF1, 0xFE, 0xF1, 0xFE},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10}};

static unsigned char plain_data[NUM_TESTS][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0xA1, 0xD6, 0xD0, 0x39, 0x77, 0x67, 0x42},
    {0x5C, 0xD5, 0x4C, 0xA8, 0x3D, 0xEF, 0x57, 0xDA},
    {0x02, 0x48, 0xD4, 0x38, 0x06, 0xF6, 0x71, 0x72},
    {0x51, 0x45, 0x4B, 0x58, 0x2D, 0xDF, 0x44, 0x0A},
    {0x42, 0xFD, 0x44, 0x30, 0x59, 0x57, 0x7F, 0xA2},
    {0x05, 0x9B, 0x5E, 0x08, 0x51, 0xCF, 0x14, 0x3A},
    {0x07, 0x56, 0xD8, 0xE0, 0x77, 0x47, 0x61, 0xD2},
    {0x76, 0x25, 0x14, 0xB8, 0x29, 0xBF, 0x48, 0x6A},
    {0x3B, 0xDD, 0x11, 0x90, 0x49, 0x37, 0x28, 0x02},
    {0x26, 0x95, 0x5F, 0x68, 0x35, 0xAF, 0x60, 0x9A},
    {0x16, 0x4D, 0x5E, 0x40, 0x4F, 0x27, 0x52, 0x32},
    {0x6B, 0x05, 0x6E, 0x18, 0x75, 0x9F, 0x5C, 0xCA},
    {0x00, 0x4B, 0xD6, 0xEF, 0x09, 0x17, 0x60, 0x62},
    {0x48, 0x0D, 0x39, 0x00, 0x6E, 0xE7, 0x62, 0xF2},
    {0x43, 0x75, 0x40, 0xC8, 0x69, 0x8F, 0x3C, 0xFA},
    {0x07, 0x2D, 0x43, 0xA0, 0x77, 0x07, 0x52, 0x92},
    {0x02, 0xFE, 0x55, 0x77, 0x81, 0x17, 0xF1, 0x2A},
    {0x1D, 0x9D, 0x5C, 0x50, 0x18, 0xF7, 0x28, 0xC2},
    {0x30, 0x55, 0x32, 0x28, 0x6D, 0x6F, 0x29, 0x5A},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}};

static unsigned char cipher_data[NUM_TESTS][8] = {
    {0x4E, 0xF9, 0x97, 0x45, 0x61, 0x98, 0xDD, 0x78},
    {0x51, 0x86, 0x6F, 0xD5, 0xB8, 0x5E, 0xCB, 0x8A},
    {0x7D, 0x85, 0x6F, 0x9A, 0x61, 0x30, 0x63, 0xF2},
    {0x24, 0x66, 0xDD, 0x87, 0x8B, 0x96, 0x3C, 0x9D},
    {0x61, 0xF9, 0xC3, 0x80, 0x22, 0x81, 0xB0, 0x96},
    {0x7D, 0x0C, 0xC6, 0x30, 0xAF, 0xDA, 0x1E, 0xC7},
    {0x4E, 0xF9, 0x97, 0x45, 0x61, 0x98, 0xDD, 0x78},
    {0x0A, 0xCE, 0xAB, 0x0F, 0xC6, 0xA0, 0xA2, 0x8D},
    {0x59, 0xC6, 0x82, 0x45, 0xEB, 0x05, 0x28, 0x2B},
    {0xB1, 0xB8, 0xCC, 0x0B, 0x25, 0x0F, 0x09, 0xA0},
    {0x17, 0x30, 0xE5, 0x77, 0x8B, 0xEA, 0x1D, 0xA4},
    {0xA2, 0x5E, 0x78, 0x56, 0xCF, 0x26, 0x51, 0xEB},
    {0x35, 0x38, 0x82, 0xB1, 0x09, 0xCE, 0x8F, 0x1A},
    {0x48, 0xF4, 0xD0, 0x88, 0x4C, 0x37, 0x99, 0x18},
    {0x43, 0x21, 0x93, 0xB7, 0x89, 0x51, 0xFC, 0x98},
    {0x13, 0xF0, 0x41, 0x54, 0xD6, 0x9D, 0x1A, 0xE5},
    {0x2E, 0xED, 0xDA, 0x93, 0xFF, 0xD3, 0x9C, 0x79},
    {0xD8, 0x87, 0xE0, 0x39, 0x3C, 0x2D, 0xA6, 0xE3},
    {0x5F, 0x99, 0xD0, 0x4F, 0x5B, 0x16, 0x39, 0x69},
    {0x4A, 0x05, 0x7A, 0x3B, 0x24, 0xD3, 0x97, 0x7B},
    {0x45, 0x20, 0x31, 0xC1, 0xE4, 0xFA, 0xDA, 0x8E},
    {0x75, 0x55, 0xAE, 0x39, 0xF5, 0x9B, 0x87, 0xBD},
    {0x53, 0xC5, 0x5F, 0x9C, 0xB4, 0x9F, 0xC0, 0x19},
    {0x7A, 0x8E, 0x7B, 0xFA, 0x93, 0x7E, 0x89, 0xA3},
    {0xCF, 0x9C, 0x5D, 0x7A, 0x49, 0x86, 0xAD, 0xB5},
    {0xD1, 0xAB, 0xB2, 0x90, 0x65, 0x8B, 0xC7, 0x78},
    {0x55, 0xCB, 0x37, 0x74, 0xD1, 0x3E, 0xF2, 0x01},
    {0xFA, 0x34, 0xEC, 0x48, 0x47, 0xB2, 0x68, 0xB2},
    {0xA7, 0x90, 0x79, 0x51, 0x08, 0xEA, 0x3C, 0xAE},
    {0xC3, 0x9E, 0x07, 0x2D, 0x9F, 0xAC, 0x63, 0x1D},
    {0x01, 0x49, 0x33, 0xE0, 0xCD, 0xAF, 0xF6, 0xE4},
    {0xF2, 0x1E, 0x9A, 0x77, 0xB7, 0x1C, 0x49, 0xBC},
    {0x24, 0x59, 0x46, 0x88, 0x57, 0x54, 0x36, 0x9A},
    {0x6B, 0x5C, 0x5A, 0x9C, 0x5D, 0x9E, 0x0A, 0x5A},
};

static unsigned char cbc_key[16] = {0x01, 0x23, 0x45, 0x67, 0x89, 0xab,
                                    0xcd, 0xef, 0xf0, 0xe1, 0xd2, 0xc3,
                                    0xb4, 0xa5, 0x96, 0x87};
static unsigned char cbc_iv[8] = {0xfe, 0xdc, 0xba, 0x98,
                                  0x76, 0x54, 0x32, 0x10};
static char cbc_data[40] = "7654321 Now is the time for ";
static unsigned char cbc_ok[32] = {
    0x6B, 0x77, 0xB4, 0xD6, 0x30, 0x06, 0xDE, 0xE6, 0x05, 0xB1, 0x56,
    0xE2, 0x74, 0x03, 0x97, 0x93, 0x58, 0xDE, 0xB9, 0xE7, 0x15, 0x46,
    0x16, 0xD9, 0x59, 0xF1, 0x65, 0x2B, 0xD5, 0xFF, 0x92, 0xCC};

static unsigned char cfb64_ok[] = {
    0xE7, 0x32, 0x14, 0xA2, 0x82, 0x21, 0x39, 0xCA, 0xF2, 0x6E,
    0xCF, 0x6D, 0x2E, 0xB9, 0xE7, 0x6E, 0x3D, 0xA3, 0xDE, 0x04,
    0xD1, 0x51, 0x72, 0x00, 0x51, 0x9D, 0x57, 0xA6, 0xC3};

static unsigned char ofb64_ok[] = {
    0xE7, 0x32, 0x14, 0xA2, 0x82, 0x21, 0x39, 0xCA, 0x62, 0xB3,
    0x43, 0xCC, 0x5B, 0x65, 0x58, 0x73, 0x10, 0xDD, 0x90, 0x8D,
    0x0C, 0x24, 0x1B, 0x22, 0x63, 0xC2, 0xCF, 0x80, 0xDA};

#define KEY_TEST_NUM 25
unsigned char key_test[KEY_TEST_NUM] = {
    0xf0, 0xe1, 0xd2, 0xc3, 0xb4, 0xa5, 0x96, 0x87, 0x78,
    0x69, 0x5a, 0x4b, 0x3c, 0x2d, 0x1e, 0x0f, 0x00, 0x11,
    0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88};

unsigned char key_data[8] = {0xFE, 0xDC, 0xBA, 0x98, 0x76, 0x54, 0x32, 0x10};

unsigned char key_out[KEY_TEST_NUM][8] = {
    {0xF9, 0xAD, 0x59, 0x7C, 0x49, 0xDB, 0x00, 0x5E},
    {0xE9, 0x1D, 0x21, 0xC1, 0xD9, 0x61, 0xA6, 0xD6},
    {0xE9, 0xC2, 0xB7, 0x0A, 0x1B, 0xC6, 0x5C, 0xF3},
    {0xBE, 0x1E, 0x63, 0x94, 0x08, 0x64, 0x0F, 0x05},
    {0xB3, 0x9E, 0x44, 0x48, 0x1B, 0xDB, 0x1E, 0x6E},
    {0x94, 0x57, 0xAA, 0x83, 0xB1, 0x92, 0x8C, 0x0D},
    {0x8B, 0xB7, 0x70, 0x32, 0xF9, 0x60, 0x62, 0x9D},
    {0xE8, 0x7A, 0x24, 0x4E, 0x2C, 0xC8, 0x5E, 0x82},
    {0x15, 0x75, 0x0E, 0x7A, 0x4F, 0x4E, 0xC5, 0x77},
    {0x12, 0x2B, 0xA7, 0x0B, 0x3A, 0xB6, 0x4A, 0xE0},
    {0x3A, 0x83, 0x3C, 0x9A, 0xFF, 0xC5, 0x37, 0xF6},
    {0x94, 0x09, 0xDA, 0x87, 0xA9, 0x0F, 0x6B, 0xF2},
    {0x88, 0x4F, 0x80, 0x62, 0x50, 0x60, 0xB8, 0xB4},
    {0x1F, 0x85, 0x03, 0x1C, 0x19, 0xE1, 0x19, 0x68},
    {0x79, 0xD9, 0x37, 0x3A, 0x71, 0x4C, 0xA3, 0x4F},
    {0x93, 0x14, 0x28, 0x87, 0xEE, 0x3B, 0xE1, 0x5C},
    {0x03, 0x42, 0x9E, 0x83, 0x8C, 0xE2, 0xD1, 0x4B},
    {0xA4, 0x29, 0x9E, 0x27, 0x46, 0x9F, 0xF6, 0x7B},
    {0xAF, 0xD5, 0xAE, 0xD1, 0xC1, 0xBC, 0x96, 0xA8},
    {0x10, 0x85, 0x1C, 0x0E, 0x38, 0x58, 0xDA, 0x9F},
    {0xE6, 0xF5, 0x1E, 0xD7, 0x9B, 0x9D, 0xB2, 0x1F},
    {0x64, 0xA6, 0xE1, 0x4A, 0xFD, 0x36, 0xB4, 0x6F},
    {0x80, 0xC7, 0xD7, 0xD4, 0x5A, 0x54, 0x79, 0xAD},
    {0x05, 0x04, 0x4B, 0x62, 0xFA, 0x52, 0xD0, 0x80},
};

int print_test_data()
{
  int i, j;

  printf("ecb test data\n");
  printf("key bytes\t\tclear bytes\t\tcipher bytes\n");
  for (i = 0; i < NUM_TESTS; i++)
  {
    for (j = 0; j < 8; j++)
    {
      printf("%02X", ecb_data[i][j]);
    }
    printf("\t");
    for (j = 0; j < 8; j++)
    {
      printf("%02X", plain_data[i][j]);
    }
    printf("\t");
    for (j = 0; j < 8; j++)
    {
      printf("%02X", cipher_data[i][j]);
    }
    printf("\n");
  }

  printf("set_key test data\n");
  printf("data[8]= ");
  for (j = 0; j < 8; j++)
  {
    printf("%02X", key_data[j]);
  }
  printf("\n");
  for (i = 0; i < KEY_TEST_NUM - 1; i++)
  {
    printf("c=");
    for (j = 0; j < 8; j++)
    {
      printf("%02X", key_out[i][j]);
    }
    printf(" k[%2d]=", i + 1);
    for (j = 0; j < i + 1; j++)
    {
      printf("%02X", key_test[j]);
    }
    printf("\n");
  }

  printf("\nchaining mode test data\n");
  printf("key[16]   = ");
  for (j = 0; j < 16; j++)
  {
    printf("%02X", cbc_key[j]);
  }
  printf("\niv[8]     = ");
  for (j = 0; j < 8; j++)
  {
    printf("%02X", cbc_iv[j]);
  }
  printf("\ndata[%lu]  = '%s'", strlen(cbc_data) + 1, cbc_data);
  printf("\ndata[%lu]  = ", strlen(cbc_data) + 1);
  for (j = 0; j < strlen(cbc_data) + 1; j++)
  {
    printf("%02X", cbc_data[j]);
  }
  printf("\n");
  printf("cbc cipher text\n");
  printf("cipher[%d]= ", 32);
  for (j = 0; j < 32; j++)
  {
    printf("%02X", cbc_ok[j]);
  }
  printf("\n");

  printf("cfb64 cipher text\n");
  printf("cipher[%lu]= ", strlen(cbc_data) + 1);
  for (j = 0; j < strlen(cbc_data) + 1; j++)
  {
    printf("%02X", cfb64_ok[j]);
  }
  printf("\n");

  printf("ofb64 cipher text\n");
  printf("cipher[%lu]= ", strlen(cbc_data) + 1);
  for (j = 0; j < strlen(cbc_data) + 1; j++)
  {
    printf("%02X", ofb64_ok[j]);
  }
  printf("\n");
  return (0);
}

int main(argc, argv) int argc;
char *argv[];
{
  int ret;

  if (argc > 1)
  {
    ret = print_test_data();
  }
  else
  {
    ret = test();
  }

  exit(ret);
}

int test()
{
  unsigned char cbc_in[40], cbc_out[40], iv[8];
  int i, n, err = 0;
  BF_KEY key;
  BF_LONG data[2];
  unsigned char out[8];
  unsigned long len;

  printf("testing blowfish in raw ecb mode\n");
  for (n = 0; n < 2; n++)
  {
    BF_set_key(&key, strlen(bf_key[n]), (unsigned char *)bf_key[n]);
    printf("Set key.\n");
    data[0] = bf_plain[n][0];
    data[1] = bf_plain[n][1];
    BF_encrypt(data, &key, BF_ENCRYPT);
    printf("Encrypted.\n");
    if (memcmp(&(bf_cipher[n][0]), &(data[0]), 8) != 0)
    {
      printf("BF_encrypt error encrypting\n");
      printf("got     :");
      for (i = 0; i < 2; i++)
      {
        printf("%08lX ", data[i]);
      }
      printf("\n");
      printf("expected:");
      for (i = 0; i < 2; i++)
      {
        printf("%08lX ", bf_cipher[n][i]);
      }
      err = 1;
      printf("\n");
    }

    BF_encrypt(&(data[0]), &key, BF_DECRYPT);
    printf("decrypted.\n");
    if (memcmp(&(bf_plain[n][0]), &(data[0]), 8) != 0)
    {
      printf("BF_encrypt error decrypting\n");
      printf("got     :");
      for (i = 0; i < 2; i++)
      {
        printf("%08lX ", data[i]);
      }
      printf("\n");
      printf("expected:");
      for (i = 0; i < 2; i++)
      {
        printf("%08lX ", bf_plain[n][i]);
      }
      printf("\n");
      err = 1;
    }
  }

  printf("testing blowfish in ecb mode\n");

  for (n = 0; n < NUM_TESTS; n++)
  {
    BF_set_key(&key, 8, ecb_data[n]);

    BF_ecb_encrypt(&(plain_data[n][0]), out, &key, BF_ENCRYPT);
    if (memcmp(&(cipher_data[n][0]), out, 8) != 0)
    {
      printf("BF_ecb_encrypt blowfish error encrypting\n");
      printf("got     :");
      for (i = 0; i < 8; i++)
      {
        printf("%02X ", out[i]);
      }
      printf("\n");
      printf("expected:");
      for (i = 0; i < 8; i++)
      {
        printf("%02X ", cipher_data[n][i]);
      }
      err = 1;
      printf("\n");
    }

    BF_ecb_encrypt(out, out, &key, BF_DECRYPT);
    if (memcmp(&(plain_data[n][0]), out, 8) != 0)
    {
      printf("BF_ecb_encrypt error decrypting\n");
      printf("got     :");
      for (i = 0; i < 8; i++)
      {
        printf("%02X ", out[i]);
      }
      printf("\n");
      printf("expected:");
      for (i = 0; i < 8; i++)
      {
        printf("%02X ", plain_data[n][i]);
      }
      printf("\n");
      err = 1;
    }
  }

  printf("testing blowfish set_key\n");
  for (n = 1; n < KEY_TEST_NUM; n++)
  {
    BF_set_key(&key, n, key_test);
    BF_ecb_encrypt(key_data, out, &key, BF_ENCRYPT);
    if (memcmp(out, &(key_out[n - 1][0]), 8) != 0)
    {
      printf("blowfish setkey error\n");
      err = 1;
    }
  }

  printf("testing blowfish in cbc mode\n");
  len = strlen(cbc_data) + 1;

  BF_set_key(&key, 16, cbc_key);
  memset(cbc_in, 0, 40);
  memset(cbc_out, 0, 40);
  memcpy(iv, cbc_iv, 8);
  BF_cbc_encrypt((unsigned char *)cbc_data, cbc_out, len, &key, iv, BF_ENCRYPT);
  if (memcmp(cbc_out, cbc_ok, 32) != 0)
  {
    err = 1;
    printf("BF_cbc_encrypt encrypt error\n");
    for (i = 0; i < 32; i++)
    {
      printf("0x%02X,", cbc_out[i]);
    }
  }
  memcpy(iv, cbc_iv, 8);
  BF_cbc_encrypt(cbc_out, cbc_in, len, &key, iv, BF_DECRYPT);
  if (memcmp(cbc_in, cbc_data, strlen(cbc_data) + 1) != 0)
  {
    printf("BF_cbc_encrypt decrypt error\n");
    err = 1;
  }

  printf("testing blowfish in cfb64 mode\n");

  BF_set_key(&key, 16, cbc_key);
  memset(cbc_in, 0, 40);
  memset(cbc_out, 0, 40);
  memcpy(iv, cbc_iv, 8);
  n = 0;
  BF_cfb64_encrypt((unsigned char *)cbc_data, cbc_out, (long)13, &key, iv, &n,
                   BF_ENCRYPT);
  BF_cfb64_encrypt((unsigned char *)&(cbc_data[13]), &(cbc_out[13]), len - 13,
                   &key, iv, &n, BF_ENCRYPT);
  if (memcmp(cbc_out, cfb64_ok, (int)len) != 0)
  {
    err = 1;
    printf("BF_cfb64_encrypt encrypt error\n");
    for (i = 0; i < (int)len; i++)
    {
      printf("0x%02X,", cbc_out[i]);
    }
  }
  n = 0;
  memcpy(iv, cbc_iv, 8);
  BF_cfb64_encrypt(cbc_out, cbc_in, 17, &key, iv, &n, BF_DECRYPT);
  BF_cfb64_encrypt(&(cbc_out[17]), &(cbc_in[17]), len - 17, &key, iv, &n,
                   BF_DECRYPT);
  if (memcmp(cbc_in, cbc_data, (int)len) != 0)
  {
    printf("BF_cfb64_encrypt decrypt error\n");
    err = 1;
  }

  printf("testing blowfish in ofb64\n");

  BF_set_key(&key, 16, cbc_key);
  memset(cbc_in, 0, 40);
  memset(cbc_out, 0, 40);
  memcpy(iv, cbc_iv, 8);
  n = 0;
  BF_ofb64_encrypt((unsigned char *)cbc_data, cbc_out, (long)13, &key, iv, &n);
  BF_ofb64_encrypt((unsigned char *)&(cbc_data[13]), &(cbc_out[13]), len - 13,
                   &key, iv, &n);
  if (memcmp(cbc_out, ofb64_ok, (int)len) != 0)
  {
    err = 1;
    printf("BF_ofb64_encrypt encrypt error\n");
    for (i = 0; i < (int)len; i++)
    {
      printf("0x%02X,", cbc_out[i]);
    }
  }
  n = 0;
  memcpy(iv, cbc_iv, 8);
  BF_ofb64_encrypt(cbc_out, cbc_in, 17, &key, iv, &n);
  BF_ofb64_encrypt(&(cbc_out[17]), &(cbc_in[17]), len - 17, &key, iv, &n);
  if (memcmp(cbc_in, cbc_data, (int)len) != 0)
  {
    printf("BF_ofb64_encrypt decrypt error\n");
    err = 1;
  }

  return (err);
}
