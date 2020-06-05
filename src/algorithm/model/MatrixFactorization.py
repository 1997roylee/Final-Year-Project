#!/usr/bin/env python2
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : April 20rd 2020
# --------------------------------------------------
from scipy.sparse.linalg import svds
import numpy as np
import pandas as pd
from datetime import datetime
from sklearn.metrics import mean_squared_error

class MatrixFactorization(object):
    def __init__(self, K=10, learning_rate=0., regularization=0.1, iterations=25):
        self.mean = 0  # mean
        self.user_biases = 0  # item bais
        self.item_biases = 0  # user bais
        self.learning_rate = learning_rate
        self.regularization = regularization
        self.iterations = iterations
        self.n_users = 0
        self.n_items = 0
        self.K = K

    def train(self, df):
        # Singular Value Decomposition
        pivot_df = self._convert_origin_2_pivot(df)
        U, sigma, Vt = svds(pivot_df, k=10)
        sigma = np.diag(sigma)
        
        # Predicted ratings
        all_user_predicted_ratings = np.dot(np.dot(U, sigma), Vt)
        trains_df = pd.DataFrame(
            all_user_predicted_ratings, columns=pivot_df.columns)
        self.trains_df = trains_df
        return trains_df

    def train_v2(self, samples):
        return self.sgd(samples)

    def _convert_origin_2_pivot(self, df):
        return df.pivot(index='user_id', columns='course_id', values='rating').fillna(0)

    def recommend(self, index, origin_df, n):
        trains_df = self.trains_df

        pivot_df = self._convert_origin_2_pivot(origin_df)
        sorted_user_ratings = pivot_df.iloc[index].sort_values(ascending=False)
        sorted_user_predictions = trains_df.iloc[index].sort_values(
            ascending=False)

        df_concat = pd.concat(
            [sorted_user_ratings, sorted_user_predictions], axis=1)
        df_concat.index.name = "Recommender Items"
        df_concat.columns = ["User Rating", "User Prediction"]

        temp = df_concat.loc[df_concat["User Rating"] == 0]
        temp = temp.sort_values('User Prediction', ascending=False)

        # print(temp[temp['User Prediction'] > 0])

    def _predict_user_rating(self, user, item):
        prediction = self.mean + \
            self.user_biases[user] + self.item_biases[item]
        prediction += self.user_factors[user,
                                        :].dot(self.item_factors[item, :].T)
        
        return prediction

    def _predict_all_ratings(self):
        predictions = np.zeros((self.n_users, self.n_items))
        
        for i in range(self.n_users):
            for j in range(self.n_items):
                predictions[i, j] = self._predict_user_rating(i, j)

        # print(predictions)
        return predictions

    def mse(self, samples):
        predictions = self._predict_all_ratings()

        predicted = predictions[samples > 0].flatten()
        origin = np.array(samples[samples > 0]).flatten()

        training_mse = mean_squared_error(predicted, origin)
        print('training mse: ', training_mse)
        return training_mse
        # test_mse = mean_squared_error(predicted_test_ratings, actual_test_ratings)
        # print('test mse: ', test_mse)

    def _get_loss(self, sample):
        N = float(len(sample))
        sse = 0
        for user, item, rating in sample:
            prediction = self.mean + \
                self.user_biases[user] + self.item_biases[item]
            prediction += self.user_factors[user,
                                            :].dot(self.item_factors[item, :].T)
            sse += (prediction - rating) * (prediction - rating)
            
        print('training mse: ', sse / N)
        return sse / N

    def _convert(self, samples):
        n, m = samples.shape
        return [(i, j, samples[i, j]) for i in range(n) for j in range(m) if samples[i, j] > 0]

    def sgd(self, samples):
        learning_rate = self.learning_rate
        regularization = self.regularization
        itrs = self.iterations
        self.n_users, self.n_items = samples.shape

        self.user_factors = np.random.uniform(-1, 1, (self.n_users, self.K))
        self.item_factors = np.random.uniform(-1, 1, (self.n_items, self.K))

        self.user_biases = np.zeros(self.n_users)
        self.item_biases = np.zeros(self.n_items)

        self.b = np.mean(samples[samples.values > 0].values)

        print("doing matrix factorization...")
        self.train_mse = []
        self.test_mse = []

        train_samples = self._convert(np.array(samples))
        for iter in range(itrs):
            print("Iteration: ", iter)
            epoch_start = datetime.now()
            np.random.shuffle(train_samples)

            for user, item, rating in train_samples:
                prediction = self._predict_user_rating(user, item)
                error = rating - prediction

                self.user_factors[user] += learning_rate * (
                    (error * self.item_factors[item]) - (regularization * self.user_factors[user]))
                self.item_factors[item] += learning_rate * (
                    (error * self.user_factors[user]) - (regularization * self.item_factors[item]))

                self.user_biases[user] += learning_rate * \
                    (error - regularization * self.user_biases[user])
                self.item_biases[item] += learning_rate * \
                    (error - regularization * self.item_biases[item])

            print("epoch duration:", (datetime.now() - epoch_start).total_seconds())
            
            self.mse(np.array(samples))
            self.train_mse.append(self._get_loss(train_samples))
            
        print(self.train_mse)