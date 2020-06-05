#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : May 1th 2020
# --------------------------------------------------

import numpy as np
import pandas as pd
import random
from scipy.sparse import coo_matrix

def toMatrix(rows, cols, values):
    result = []
    for (row, col, value) in zip(rows, cols, values):
        row = int(row)
        col = int(col)
        
        result.append([row, col, value])
    return np.array(result)

def toMatrixDict(rows, cols, values):
    result = {}
    for (row, col, value) in zip(rows, cols, values):
        row = int(row)
        col = int(col)
        
        result[(row, col)] = value
    return result

# def split_train_n_test(df):
#     n_users = df.shape[0]
#     n_movies = df.shape[1]
#     # print("n_users: " + str(n_users), "n_movies: " + str(n_movies))

#     n_training_users = int(0.8 * n_users)
#     # print("Splitting test / train")

#     train_ids = random.sample(range(n_users),
#                               n_training_users)

#     test_ids = set(range(n_users)) - set(train_ids)
#     test_ids = list(test_ids)
#     # n_test_users = len(test_ids)
#     return df[df['userId'].isin(train_ids)], df[df['userId'].isin(test_ids)]