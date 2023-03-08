#!/bin/bash

echo "Adding posts data..."

mysql -h $database__connection__host -P 3306 -u $database__connection__user -p$database__connection__password $database__connection__database < ./posts.sql

echo "Posts added successfully!"
