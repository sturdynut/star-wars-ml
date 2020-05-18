#!/bin/bash

# Create training data folder
mkdir -p ./training_data

# Create images folder
mkdir -p ./training_data/images

# Create test file
rm ./training_data/test.txt
touch ./training_data/test.txt

# Add test data
cat <<EOF > ./training_data/test.txt
"https://static1.srcdn.com/wordpress/wp-content/uploads/2019/12/More-Baby-Yoda-Merch-Has-Finally-Been-Revealed.jpg"
"https://cdn1-www.superherohype.com/assets/uploads/gallery/sideshow-life-sized-baby-yoda/the-child_star-wars_gallery_5e3204bdad395.jpg"

EOF
