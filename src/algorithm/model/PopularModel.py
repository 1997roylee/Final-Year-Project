#!/usr/bin/env python2
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : April 20rd 2020
# --------------------------------------------------
import pandas as pd

class PopularModel(object):
    def __init__(self):
        self.course_label = "course_id"

    def fit(self, dataFrame):
        dataFrame = self._ready(dataFrame)
        min = dataFrame['count'].quantile(0.75)
        mean = dataFrame['sum'].mean()

        qualified = dataFrame[(dataFrame['count'] >= min) & (dataFrame['count'].notnull()) &
                                  (dataFrame['sum'].notnull()) & (dataFrame['sum'] >= mean)]
        return qualified.sort_values('weighted', ascending=False)

    def _get_weighted(self, min, avg, row):
        # Weighted Rating (WR) = (v/(v+m) * R) + (m/(v+m) * C)
        v = row['count']+1  # added +1 - Dan
        R = row['sum']
        return (v/(v+min) * R) + (min/(min+v) * avg)

    def _ready(self, dataFrame):
        self.dataFrame = dataFrame
        courseIds = self._get_unique_courses()
        ratingsMean = self._mean()
        ratingsSum = self._sum()
        raintgsCount = self._count()
        return self._create(courseIds, ratingsMean, ratingsSum, raintgsCount)
    
    def _mean(self):
        # Get Rating Mean
        return self.dataFrame['rating'].mean()

    def _get_unique_courses(self):
        return self.dataFrame[self.course_label].unique()

    def _sum(self):
        return self.dataFrame.groupby(
            self.course_label)['rating'].sum().sort_values(ascending=False)

    def _count(self):
        return self.dataFrame.groupby(
            self.course_label)['rating'].count().sort_values(ascending=False)

    def _create(self, course_ids, mean, sum, count):
        df_tmp = pd.DataFrame(data=course_ids, columns=[self.course_label])
        df_tmp['sum'] = df_tmp.apply(
            lambda df: sum[df[self.course_label]], axis=1)
        df_tmp['count'] = df_tmp.apply(
            lambda df: count[df[self.course_label]], axis=1)

        min = count.quantile(0.75)

        df_tmp['weighted'] = df_tmp.apply(
            lambda row: self._get_weighted(min=min, avg=mean, row=row), axis=1)

        return df_tmp