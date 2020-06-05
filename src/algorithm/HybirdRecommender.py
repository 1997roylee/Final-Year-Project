#!/usr/bin/env python2
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : May 5th 2020
# --------------------------------------------------

import pandas as pd
from model import MatrixFactorization, DeepMatrixFactorization, PopularModel
from utils import toMatrix
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import sys
import pickle
from scipy import sparse, io
import argparse

def main():
    if arg.mode:
        print(arg.mode)
        if arg.mode == "mf":
            model = MatrixFactorization()
            df = pd.read_csv("./dataset/ratings.csv")
            result = model.train(df)
            result.to_csv("./dataset/matrix-factorization.csv")
            io.mmwrite("test.mtx", result)
            print(result)
        elif arg.mode == "popularity":
            model = PopularModel()
            df = pd.read_csv("./dataset/ratings.csv")
            result = model.fit(df)
            print(result)
            result.to_csv("./dataset/popular.csv", index=False)
        elif arg.mode == "tmf":
            df = pd.read_csv("./dataset/ratings-large.csv")
            df = df.sort_values(by=['course_id'])
        
            ratingMatrix = toMatrix(
                df.user_id.values, df.course_id.values, df.rating.values)
            
            userCount = int(df.user_id.max()) + 1
            itemCount = int(df.course_id.max()) + 1
            ratingMatrix[:, 2] -= ratingMatrix[1:, 2].mean()
            print(ratingMatrix)
            print(userCount, "users")
            print(itemCount, "items")
            print("Run models")
            model = DeepMatrixFactorization(userCount, itemCount, withBias=False, epochs=25)
            history = model.fit(ratingMatrix)
            from keras.utils import plot_model
            plot_model(model.model, to_file='model.png')

            print(history.history["loss"], history.history["getRMSE"], history.history["val_loss"], history.history["val_getRMSE"])
            plt.plot(history.history['loss'], label="train loss")
            plt.plot(history.history['val_loss'], label='test loss')
            plt.legend()
            plt.show()
            # plot rmse
            plt.plot(history.history['getRMSE'], label='train RMSE')
            plt.plot(history.history['val_getRMSE'], label='test RMSEE')
            plt.legend()
            plt.show()
            # plot mse
            plt.plot(history.history['f1_score'], label='train F1 score')
            plt.plot(history.history['val_f1_score'], label='test F1 score')
            plt.legend()
            plt.show()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--mode', nargs='?', const=True, default=False)
    arg = parser.parse_args()

    main()