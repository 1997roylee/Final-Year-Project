# Readme

## Abstract

We now live in an era of information explosion, and online studying is becoming an essential part. We aim to build an e-learning system with a recommender system. Thus recommender systems are playing an important role in getting the user’s attention in recent years; Especially, recommender systems are successfully applied in many applications like Netflix and Amazon and primarily used in recommending a product or item in which users may be interested. 
We use hybrid techniques to implement the hybrid recommender system to extract the information and recommend courses. The hybrid recommender system is combining Matrix Factorisation, and Bayesian average algorithms can make a recommendation with ranking popularity and personalized items. 

### Requirements:

Postgresql, ruby, python, nodejs, tensorflow

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

Email: 1997roylee@gmail.com