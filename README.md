# Star Wars Machine Learning

Just fun with machine learning using Star Wars images.

## Training Data

Training data is stored in the `training_data` folder

### To gather the training data:

**Gather urls for images to download**
-  `iex -S mix`
- `Crawly.Engine.start_spider(BabyYodaSpider)` to crawl for images

**Download images to training data folder**

- `mix download`

**Prepare images (resizes)**

- `mix prepare`

## Test Setup

To prepare the testing environment:

- `chmod +x ./test_setup.sh; ./test_setup.sh`

## Testing

`mix test`
