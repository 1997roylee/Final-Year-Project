#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# --------------------------------------------------
# Description: Matrix Factorization With Tensorflow
# --------------------------------------------------
# Author: Roy Lei <db62539@um.edu.mo>
# Created Date : April 31st 2020
# --------------------------------------------------
import requests
import pandas as pd
COURSERA_PATH = "https://lua9b20g37-2.algolianet.com/1/indexes/*/queries?x-algolia-agent=Algolia%20for%20vanilla%20JavaScript%20(lite)%203.30.0%3Breact-instantsearch%205.2.3%3BJS%20Helper%202.26.1&x-algolia-application-id=LUA9B20G37&x-algolia-api-key=dcc55281ffd7ba6f24c3a9b18288499b"

class Scraper(object):
    def __init__(self, path=""):
        self.path = path
        self.responses = {}

    def _get_headers(self):
        return {
            "Accept": "application/json",
            "Content-Type": "application/json"
        }

    def _get_payloads(self):
        return {
            "requests": [
                {
                    "indexName": "DO_NOT_DELETE_PLACEHOLDER_INDEX_NAME",
                    "params": "query=&page=0&highlightPreTag=%3Cais-highlight-0000000000%3E&highlightPostTag=%3C%2Fais-highlight-0000000000%3E&optionalFilters=query%3Aapi&facets=%5B%5D&tagFilters="
                },
                {
                    "indexName": "prod_all_products_term_optimization",
                    "params": "query=&hitsPerPage=100&page=0&highlightPreTag=%3Cais-highlight-0000000000%3E&highlightPostTag=%3C%2Fais-highlight-0000000000%3E&optionalFilters=query%3Aapi&ruleContexts=%5B%22en%22%5D&facets=%5B%5D&tagFilters="
                },
                {
                    "indexName": "test_suggestions",
                    "params": "query=&hitsPerPage=7&page=0&highlightPreTag=%3Cais-highlight-0000000000%3E&highlightPostTag=%3C%2Fais-highlight-0000000000%3E&optionalFilters=query%3Aapi&facets=%5B%5D&tagFilters="
                }
            ]
        }

    def _fliter(self, items):
        dataframe = self._create_pandas()

        for item in items:
            # print(item)
            row = dict()
            for column in self._get_columns():
                if column == "description":
                     row[column] = item["_snippetResult"]["description"]["value"]
                else:
                    row[column] = item[column]
            
            dataframe = dataframe.append(row, ignore_index=True)
        return dataframe

    def _get_columns(self):
        return [
            "name",
            "productDifficultyLevel",
            "enrollments",
            "language",
            "numProductRatings",
            "avgProductRating",
            "skills",
            "imageUrl",
            "description"
        ]
    
    def _create_pandas(self):
        return pd.DataFrame(columns=self._get_columns())

    def call(self):
        self.responses = requests.post(
            self.path, json=self._get_payloads(), headers=self._get_headers())
        return self.responses.json()

    def result(self):
        return self._fliter(self.responses.json()["results"][1]["hits"])

def main():
    scraper = Scraper(COURSERA_PATH)
    scraper.call()
    scraper.result().to_csv("./dataset/courses.csv", encoding='utf-8', index=False)

if __name__ == "__main__":
    main()