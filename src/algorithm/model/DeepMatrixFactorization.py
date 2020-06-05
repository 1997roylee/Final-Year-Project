#!/usr/bin/env python2
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : April 20rd 2020
# --------------------------------------------------
from keras.layers import Input, Embedding, Dot, Add, Flatten, Lambda, Dense
from keras.regularizers import l2
from keras.initializers import RandomNormal
from keras import backend as K
from keras.models import Model
from keras.callbacks import EarlyStopping
import keras
import numpy

class DeepMatrixFactorization(object):
    def __init__(self, userCount=0, itemCount=0, latentFeatures=10,  regularizationScale=.0, epochs=25, batchSize=256, withBias=True, withLambda=False):
        self.params = {
            "userCount": userCount,
            "itemCount": itemCount,
            "latentFeatures": latentFeatures,
            "regularizationScale": regularizationScale,
            "epochs": epochs,
            "batchSize": batchSize,
            "withBias": withBias,
            "withLambda": withLambda
        }

        self._build_session_()

    def _build_session_(self):
        withLambda = self.params["withLambda"]
        withBias = self.params["withBias"]

        inputLayer = self._create_input_layer()
        embeddingLayer = self._create_embedding_layer(
            inputLayer["userLayer"], inputLayer["itemLayer"])

        outputLayer = self._create_output_layer(withLambda, embeddingLayer)

        if withBias:
            biasInputLayer, biasOutputLayer = self._create_bias_output_layer(inputLayer,
                                                                             outputLayer)
            model = self._create_model(inputs=[
                                       inputLayer["userLayer"], inputLayer["itemLayer"], biasInputLayer], outputs=[biasOutputLayer])
        else:
            model = self._create_model(
                inputs=[inputLayer["userLayer"], inputLayer["itemLayer"]], outputs=[outputLayer])

        self.model = model
        self.inputLayer = inputLayer
        self.embeddingLayer = embeddingLayer
        self.model

    def _create_output_layer(self, withLambda, embeddingLayer):
        if withLambda:
            outputLayer = Lambda(self.getDotProduct, output_shape=self.getDotProductShape)(
                [embeddingLayer["userLayer"], embeddingLayer["itemLayer"]])  # add a square layer
        else:
            outputLayer = Dot(
                axes=-1)([embeddingLayer["userLayer"], embeddingLayer["itemLayer"]])
        return outputLayer

    def _create_model(self, inputs, outputs):
        #
        model = Model(
            inputs=inputs, outputs=outputs)
        #
        model.compile(
            optimizer="adam", loss="mean_squared_error", metrics=[self.getRMSE, self.recall, self.f1_score])
        return model

    def _create_embedding_layer(self, userInputLayer, itemInputLayer):
        userCount = self.params["userCount"]
        itemCount = self.params["itemCount"]
        latentFeatures = self.params["latentFeatures"]
        regularizationScale = self.params["regularizationScale"]

        #  tf.keras.regularizers.l2  #loss = l2 * reduce_sum(square(x))
        userEmbeddingLayer = Embedding(input_dim=userCount, output_dim=latentFeatures, input_length=1,
                                       embeddings_regularizer=l2(regularizationScale), embeddings_initializer=RandomNormal())(userInputLayer)
        userEmbeddingLayer = Flatten()(userEmbeddingLayer)

        itemEmbeddingLayer = Embedding(input_dim=itemCount, output_dim=latentFeatures, input_length=1,
                                       embeddings_regularizer=l2(regularizationScale), embeddings_initializer=RandomNormal())(itemInputLayer)
        itemEmbeddingLayer = Flatten()(itemEmbeddingLayer)

        return {
            "userLayer": userEmbeddingLayer,
            "itemLayer": itemEmbeddingLayer
        }

    def _create_input_layer(self):
        '''
        rating = all_mean + user_bias + item_bias + cross_term
        '''
        userLayer = Input(shape=(1, ), dtype='int32')
        itemLayer = Input(shape=(1, ), dtype='int32')
        return {
            "userLayer": userLayer,
            "itemLayer": itemLayer
        }

    def _create_bias_layer(self, inputLayer):
        userCount = self.params["userCount"]
        itemCount = self.params["itemCount"]
        latentFeatures = self.params["latentFeatures"]
        regularizationScale = self.params["regularizationScale"]
        userInputLayer = inputLayer["userLayer"]
        itemInputLayer = inputLayer["itemLayer"]
        # Define user Bias
        userBiasLayer = Embedding(input_dim=userCount, output_dim=1, input_length=1, embeddings_initializer=RandomNormal(
        ), embeddings_regularizer=l2(regularizationScale))(userInputLayer)
        userBiasLayer = Flatten()(userBiasLayer)

        # Define item Bias
        itemBiasLayer = Embedding(input_dim=itemCount, output_dim=1, input_length=1, embeddings_initializer=RandomNormal(
        ), embeddings_regularizer=l2(regularizationScale))(itemInputLayer)
        itemBiasLayer = Flatten()(itemBiasLayer)

        return {
            "userBiasLayer": userBiasLayer,
            "itemBiasLayer": itemBiasLayer
        }

    def _create_bias_output_layer(self, inputLayer, outputLayer):
        regularizationScale = self.params["regularizationScale"]

        biasLayer = self._create_bias_layer(inputLayer)
        biasInputLayer = Input(shape=(1, ))

        # Dense: output = activation(dot(input, kernel) + bias)
        ratingsBiasLayer = Dense(1, activation="linear", use_bias=False, kernel_regularizer=l2(
            regularizationScale), kernel_initializer=RandomNormal())(biasInputLayer)

        outputBiasLayer = Lambda(self.SVD, output_shape=self.SVDShape)(
            [outputLayer, biasLayer["userBiasLayer"], biasLayer["itemBiasLayer"], ratingsBiasLayer])

        return biasInputLayer, outputBiasLayer

    def fit(self, ratingMatrix):
        epochs = self.params["epochs"]
        batchSize = self.params["batchSize"]
        userCount = self.params["userCount"]
        itemCount = self.params["itemCount"]
        withBias = self.params["withBias"]
        inputLayer = self.inputLayer
        embeddingLayer = self.embeddingLayer

        numpy.random.shuffle(ratingMatrix)

        userMatrix = ratingMatrix[:, 0].reshape(-1, 1).astype(int)
        itemMatrix = ratingMatrix[:, 1].reshape(-1, 1).astype(int)
        biasMatrix = numpy.ones((ratingMatrix.shape[0], 1))  # for bias
        labelMatrix = ratingMatrix[:, 2].reshape(-1, 1)

        # EarlyStopping:  Interrupt training when validation performance has stopped improving.
        print("---Start to fit---")
        if withBias:
            history = self.model.fit([userMatrix, itemMatrix, biasMatrix], labelMatrix, epochs=epochs, batch_size=batchSize,
                                     validation_split=.1, callbacks=[EarlyStopping(mode="min")])
        else:
            history = self.model.fit([userMatrix, itemMatrix], labelMatrix, epochs=epochs, batch_size=batchSize,
                                     validation_split=.1, callbacks=[EarlyStopping(mode="min")])

        return history

    def recall(self, y_true, y_pred):
        y_true = K.ones_like(y_true) 
        true_positives = K.sum(K.round(K.clip(y_true * y_pred, 0, 1)))
        all_positives = K.sum(K.round(K.clip(y_true, 0, 1)))
        
        recall = true_positives / (all_positives + K.epsilon())
        return recall

    def precision(self, y_true, y_pred):
        y_true = K.ones_like(y_true) 
        true_positives = K.sum(K.round(K.clip(y_true * y_pred, 0, 1)))
        
        predicted_positives = K.sum(K.round(K.clip(y_pred, 0, 1)))
        precision = true_positives / (predicted_positives + K.epsilon())
        return precision

    def f1_score(self, y_true, y_pred):
        precision = self.precision(y_true, y_pred)
        recall = self.recall(y_true, y_pred)
        return 2*((precision*recall)/(precision+recall+K.epsilon()))
        
    def SVD(self, matrixList):
        dotMatrix, userBiasMatrix, itemBiasMatrix, ratingsBiasMatrix = matrixList
        return dotMatrix + userBiasMatrix + itemBiasMatrix + ratingsBiasMatrix

    def SVDShape(self, matrixList):
        dotMatrix, userBiasMatrix, itemBiasMatrix, ratingsBiasMatrix = matrixList
        return userBiasMatrix[0], 1

    def getRMSE(self, labelMatrix, predictionMatrix):
        #  Mean ( (Ratings - Predictions)^2 ) ^ 1 / 2
        return K.sqrt(K.mean(K.square(labelMatrix - predictionMatrix)))

    def getDotProduct(self, matrixList):
        userEmbeddingMatrix, itemEmbeddingMatrix = matrixList
        return K.batch_dot(userEmbeddingMatrix, itemEmbeddingMatrix, axes=1)

    def getDotProductShape(self, matrixList):
        userEmbeddingMatrix, itemEmbeddingMatrix = matrixList
        return userEmbeddingMatrix[0], 1
