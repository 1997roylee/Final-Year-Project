#!/bin/sh
echo "copying the dataset folder"
rm -r backend/app/assets/dataset
cp -r algorithm/dataset backend/app/assets
echo "done"