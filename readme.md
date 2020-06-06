# Course Recommender System 課程推薦系統

## Abstract

We now live in an era of information explosion, and online studying is becoming an essential part. We aim to build an e-learning system with a recommender system. Thus recommender systems are playing an important role in getting the user’s attention in recent years; Especially, recommender systems are successfully applied in many applications like Netflix and Amazon and primarily used in recommending a product or item in which users may be interested. 
We use hybrid techniques to implement the hybrid recommender system to extract the information and recommend courses. The hybrid recommender system is combining Matrix Factorisation, and Bayesian average algorithms can make a recommendation with ranking popularity and personalized items. 

我們現在生活在信息爆炸的時代，在線學習已成為必不可少的部分。 我們的目標是建立帶有推薦系統的電子學習系統。 因此，推薦系統近年來在引起用戶注意方面起著重要作用； 特別是，推薦系統已成功應用於許多應用程序中，例如Netflix和Amazon，並且主要用於推薦用戶可能感興趣的產品或項目。
我們使用混合技術來實現混合推薦系統以提取信息並推薦課程。 混合推薦系統結合了矩陣分解，貝葉斯平均算法可以根據受歡迎程度和個性化項目進行推薦。

### Requirements:

Postgresql, ruby, python, nodejs, tensorflow

### Postgresql

You have to import the data sql into Postgresql

```sh
cd data
psql -U root recourse-development < dbexport.pgsql
```

## API application

```ruby
cd src/backend
```

### Firstly you have to create and migrate database on Postgresql

```ruby
bundle i
rails db:create
rails db:migrate
```

### Run Application

```ruby
rails s
```

### Notice

To run the api application, please setup the ruby and rails environments. Guidline: https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm

___

## Recommender Algorithm

To train the model and predict the result.

```python
cd src/algorithm
```

### Run Matrix Factorization Model

```python
python3 HybirdRecommender.py -m "mf"
```

### Run Matrix Factorization Model With TensorFlow

```python
python3 HybirdRecommender.py -m "tmf"
```

### Run Popularity Model

```python
python3 HybirdRecommender.py -m "popularity"
```

### Notice

After you run matrix factorization model and popularity model, you have to run import.sh to import the data into server side

```sh
cd src
chmod +x import.sh
./import.sh
```

___

## Frontend (User Interface)

To provide a visualizattion

### Install library

```javascript
cd src/frontend
npm install
```

### run application

```javascript
npm run serve
```

### Notice

You have to install nodejs environment to run npm command.

___

##  Contact information 

Nam: Roy Lei
Email: 1997roylee@gmail.com