# Star Wars Machine Learning 🤖

Just fun with machine learning using Star Wars images.

The goal of this project is to use transfer learning in order to train image classification models to identify Star Wars characters.  The first subject being Baby Yoda, of course.

"Image classification models have millions of parameters. Training them from scratch requires a lot of labeled training data and a lot of computing power. Transfer learning is a technique that shortcuts much of this by taking a piece of a model that has already been trained on a related task and reusing it in a new model." [source](https://colab.research.google.com/github/tensorflow/hub/blob/master/examples/colab/tf2_image_retraining.ipynb#scrollTo=L1otmJgmbahf)

## ✅ Prerequisites

- [Elixir](https://elixir-lang.org/)
- [TensorFlow](https://www.tensorflow.org/hub/installation)
  - `pip install "tensorflow~=2.0"`
  - `pip install --upgrade --ignore-installed setuptools`
  - `pip install --upgrade tensorflow-hub`
  - `pip install "tensorflow-hub[make_image_classifier]~=0.6"`

## 🌱 Setup

Run the init script to get setup:

- `./scripts/init.sh`

## 🔍 Gather Training Data

In order to transfer training to the new model, we need to gather images to feed it.  We will begin by crawling image search results for images of our target (e.g. "Baby Yoda").  Once we have these image urls, we will then download them.  Once downloaded, they need to be resized and centered to meet the requirements of the model we are re-training.

_Training data is stored in a local `./training_data` folder_

### To gather the training data:

**Gather urls for images to download**
-  `iex -S mix`
- `Crawly.Engine.start_spider(BabyYodaSpider)` to crawl for images

**Download images to training data folder**

- `mix download`

**Prepare images (resizes)**

- `mix prepare`

## 🏃‍♂️ Train the Model

- `./scripts/train.sh`

## Testing

To prepare the testing environment (one-time setup):

- `./scripts/test_setup.sh`

To run tests:

`mix test`

## Troubleshooting

### Can't run a .sh file?

- Add execute permission via `chmod +x ./scripts/[name of file].sh`
