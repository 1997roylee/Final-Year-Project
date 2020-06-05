import pandas as pd
import numpy as np
import argparse
import random


def parser():
    parser = argparse.ArgumentParser(description='Randomly Generate Rating')

    parser.add_argument(
        '--users',
        default=100,
        help='provide an integer (default: 100)'
    )
    return parser.parse_args()


def create_pandas():
    return pd.DataFrame(columns=['user_id', 'course_id', 'rating'])


def generate(numUsers=100, numCourses=100):
    import operator
    ratingList = [0,  0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 0]
    ratingDataFrame = create_pandas()
    for i in range(numCourses):
        size = random.randint(0, int(numUsers))
        ids = random.sample(range(numUsers), size)
        ratings = random.sample(ratingList * size, size)
        course_ids = [i] * size
        rows = {
            "user_id": ids,
            "course_id": course_ids,
            "rating": ratings

        }

        ratingDataFrame = pd.concat([ratingDataFrame, pd.DataFrame(
            rows, columns=['user_id', 'course_id', 'rating'])])

        # j = 0
        # for id in ids:
        #     row = {
        #         "user_id": id,
        #         "course_id": i,
        #         "rating": id[1]
        #     }
        #     #
        #     j = j + 1
        print(i)

    return ratingDataFrame


def main():
    args = parser()

    courseDataFrame = pd.read_csv("./dataset/courses.csv")

    maxNumCourses = courseDataFrame.shape[0]
    maxNumRatings = courseDataFrame["numProductRatings"].max()
    generate(numUsers=int(args.users), numCourses=maxNumCourses).to_csv(
        "./dataset/ratings-large.csv", index=False)


if __name__ == "__main__":
    main()
