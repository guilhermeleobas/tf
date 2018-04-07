/**********************************************************************************************/
/*  This program is part of the Barcelona OpenMP Tasks Suite */
/*  Copyright (C) 2009 Barcelona Supercomputing Center - Centro Nacional de
 * Supercomputacion  */
/*  Copyright (C) 2009 Universitat Politecnica de Catalunya */
/*                                                                                            */
/*  This program is free software; you can redistribute it and/or modify */
/*  it under the terms of the GNU General Public License as published by */
/*  the Free Software Foundation; either version 2 of the License, or */
/*  (at your option) any later version. */
/*                                                                                            */
/*  This program is distributed in the hope that it will be useful, */
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of */
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the */
/*  GNU General Public License for more details. */
/*                                                                                            */
/*  You should have received a copy of the GNU General Public License */
/*  along with this program; if not, write to the Free Software */
/*  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA            */
/**********************************************************************************************/

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <libgen.h>
#include "sparselu.h"

/***********************************************************************
 * genmat:
 **********************************************************************/
static void genmat(float *M[], int matrix_size, int submatrix_size) {
  int null_entry, init_val, i, j, ii, jj;
  float *p;

  init_val = 1325;

  /* generating the structure */
  for (ii = 0; ii < matrix_size; ii++) {
    for (jj = 0; jj < matrix_size; jj++) {
      /* computing null entries */
      null_entry = 0;
      if ((ii < jj) && (ii % 3 != 0))
        null_entry = 1;
      if ((ii > jj) && (jj % 3 != 0))
        null_entry = 1;
      if (ii % 2 == 1)
        null_entry = 1;
      if (jj % 2 == 1)
        null_entry = 1;
      if (ii == jj)
        null_entry = 0;
      if (ii == jj - 1)
        null_entry = 0;
      if (ii - 1 == jj)
        null_entry = 0;
      /* allocating matrix */
      if (null_entry == 0) {
        M[ii * matrix_size + jj] =
            (float *)malloc(submatrix_size * submatrix_size * sizeof(float));
        if (M[ii * matrix_size + jj] == NULL)
          exit(101);
        /* initializing matrix */
        p = M[ii * matrix_size + jj];
        for (i = 0; i < submatrix_size; i++) {
          for (j = 0; j < submatrix_size; j++) {
            init_val = (3125 * init_val) % 65536;
            (*p) = (float)((init_val - 32768.0) / 16384.0);
            p++;
          }
        }
      } else {
        M[ii * matrix_size + jj] = NULL;
      }
    }
  }
}
/***********************************************************************
 * allocate_clean_block:
 **********************************************************************/
float *allocate_clean_block(int submatrix_size) {
  int i, j;
  float *p, *q;

  p = (float *)malloc(submatrix_size * submatrix_size * sizeof(float));
  q = p;
  if (p != NULL) {
    for (i = 0; i < submatrix_size; i++)
      for (j = 0; j < submatrix_size; j++) {
        (*p) = 0.0;
        p++;
      }

  } else
    exit(101);
  return (q);
}

/***********************************************************************
 * lu0:
 **********************************************************************/
void lu0(float *diag, int submatrix_size) {
  int i, j, k;

  for (k = 0; k < submatrix_size; k++)
    for (i = k + 1; i < submatrix_size; i++) {
      diag[i * submatrix_size + k] =
          diag[i * submatrix_size + k] / diag[k * submatrix_size + k];
      for (j = k + 1; j < submatrix_size; j++)
        diag[i * submatrix_size + j] =
            diag[i * submatrix_size + j] -
            diag[i * submatrix_size + k] * diag[k * submatrix_size + j];
    }
}

/***********************************************************************
 * bdiv:
 **********************************************************************/
void bdiv(float *diag, float *row, int submatrix_size) {
  int i, j, k;
  for (i = 0; i < submatrix_size; i++)
    for (k = 0; k < submatrix_size; k++) {
      row[i * submatrix_size + k] =
          row[i * submatrix_size + k] / diag[k * submatrix_size + k];
      for (j = k + 1; j < submatrix_size; j++)
        row[i * submatrix_size + j] =
            row[i * submatrix_size + j] -
            row[i * submatrix_size + k] * diag[k * submatrix_size + j];
    }
}
/***********************************************************************
 * bmod:
 **********************************************************************/
void bmod(float *row, float *col, float *inner, int submatrix_size) {
  int i, j, k;
  for (i = 0; i < submatrix_size; i++)
    for (j = 0; j < submatrix_size; j++)
      for (k = 0; k < submatrix_size; k++)
        inner[i * submatrix_size + j] =
            inner[i * submatrix_size + j] -
            row[i * submatrix_size + k] * col[k * submatrix_size + j];
}
/***********************************************************************
 * fwd:
 **********************************************************************/
void fwd(float *diag, float *col, int submatrix_size) {
  int i, j, k;
  for (j = 0; j < submatrix_size; j++)
    for (k = 0; k < submatrix_size; k++)
      for (i = k + 1; i < submatrix_size; i++)
        col[i * submatrix_size + j] =
            col[i * submatrix_size + j] -
            diag[i * submatrix_size + k] * col[k * submatrix_size + j];
}

/***********************************************************************
 * checkmat:
 **********************************************************************/
static int checkmat(float *M, float *N, int submatrix_size) {
  int i, j;
  float r_err;

  for (i = 0; i < submatrix_size; i++) {
    for (j = 0; j < submatrix_size; j++) {
      r_err = M[i * submatrix_size + j] - N[i * submatrix_size + j];
      if (r_err == 0.0)
        continue;

      if (r_err < 0.0)
        r_err = -r_err;

      if (M[i * submatrix_size + j] == 0)
        return 0;
      r_err = r_err / M[i * submatrix_size + j];
      if (r_err > EPSILON)
        return 0;
    }
  }
  return 1;
}

static int sparselu_check(float **BENCH_SEQ, float **BENCH, int matrix_size,
                          int submatrix_size) {
  int ii, jj, ok = 1;

  for (ii = 0; ((ii < matrix_size) && ok); ii++) {
    for (jj = 0; ((jj < matrix_size) && ok); jj++) {
      if ((BENCH_SEQ[ii * matrix_size + jj] == NULL) &&
          (BENCH[ii * matrix_size + jj] != NULL))
        ok = 0;
      if ((BENCH_SEQ[ii * matrix_size + jj] != NULL) &&
          (BENCH[ii * matrix_size + jj] == NULL))
        ok = 0;
      if ((BENCH_SEQ[ii * matrix_size + jj] != NULL) &&
          (BENCH[ii * matrix_size + jj] != NULL))
        ok = checkmat(BENCH_SEQ[ii * matrix_size + jj],
                      BENCH[ii * matrix_size + jj], submatrix_size);
    }
  }
  return ok;
}

/***********************************************************************
 * print_structure:
 **********************************************************************/
void print_structure(char *name, float *M[], int matrix_size) {
  int ii, jj;
  printf("Structure for matrix %s @ 0x%p\n", name, M);
  for (ii = 0; ii < matrix_size; ii++) {
    for (jj = 0; jj < matrix_size; jj++) {
      if (M[ii * matrix_size + jj] != NULL) {
        printf("x");
      } else
        printf(" ");
    }
    printf("\n");
  }
  printf("\n");
}

static void sparselu_init(float ***pBENCH, int matrix_size,
                          int submatrix_size) {
  *pBENCH = (float **)malloc(matrix_size * matrix_size * sizeof(float *));
  genmat(*pBENCH, matrix_size, submatrix_size);
}

void sparselu(float **BENCH, int matrix_size, int submatrix_size) {
  int ii, jj, kk;
  for (kk = 0; kk < matrix_size; kk++) {
    long long int TM5[2];
    TM5[0] = kk * matrix_size;
    TM5[1] = TM5[0] + kk;
    lu0(BENCH[kk * matrix_size + kk], submatrix_size);
    for (jj = kk + 1; jj < matrix_size; jj++) {
      if (BENCH[kk * matrix_size + jj] != NULL) {
        long long int TM7[3];
        TM7[0] = kk * matrix_size;
        TM7[1] = TM7[0] + kk;
        TM7[2] = TM7[0] + jj;
        fwd(BENCH[kk * matrix_size + kk], BENCH[kk * matrix_size + jj], submatrix_size);
      }
    }
    for (ii = kk + 1; ii < matrix_size; ii++) {
      if (BENCH[ii * matrix_size + kk] != NULL) {
        long long int TM10[4];
        TM10[0] = kk * matrix_size;
        TM10[1] = TM10[0] + kk;
        TM10[2] = ii * matrix_size;
        TM10[3] = TM10[2] + kk;
        bdiv(BENCH[kk * matrix_size + kk], BENCH[ii * matrix_size + kk], submatrix_size);
      }
    }
    for (ii = kk + 1; ii < matrix_size; ii++) {
      if (BENCH[ii * matrix_size + kk] != NULL) {
        for (jj = kk + 1; jj < matrix_size; jj++) {
          if (BENCH[kk * matrix_size + jj] != NULL) {
            if (BENCH[ii * matrix_size + jj] == NULL) {
              BENCH[ii * matrix_size + jj] = allocate_clean_block(submatrix_size);
            }
            long long int TM15[5];
            TM15[0] = ii * matrix_size;
            TM15[1] = TM15[0] + kk;
            TM15[2] = kk * matrix_size;
            TM15[3] = TM15[2] + jj;
            TM15[4] = TM15[0] + jj;
            bmod(BENCH[ii * matrix_size + kk], BENCH[kk * matrix_size + jj], BENCH[ii * matrix_size + jj], submatrix_size);
          }
        }
      }
    }
  }
}


void sparselu_fini(float **BENCH, char *pass, int matrix_size) {
  print_structure(pass, BENCH, matrix_size);
}

int main(int argc, char const *argv[]) {
  /* code */
  float **BENCH;

  int matrix_size = atoi(argv[1]);
  int submatrix_size = atoi(argv[2]);
  sparselu_init(&BENCH, matrix_size, submatrix_size);

  // MAINCALL
  sparselu(BENCH, matrix_size, submatrix_size);

  sparselu_fini(BENCH, "Final State: ", matrix_size);

  return 0;
}

