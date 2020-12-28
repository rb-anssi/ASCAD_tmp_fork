#!/bin/sh

#### Testing ATMEGA_AES_v1/ATM_AES_v1_fixed_key/
# First download and extract the database if it has not been downloaded
cd ATMEGA_AES_v1/ATM_AES_v1_fixed_key/ && wget https://www.data.gouv.fr/s/resources/ascad/20180530-163000/ASCAD_data.zip && rm -rf ASCAD_data && unzip ASCAD_data.zip && cd -
# Test the database extraction
python ASCAD_generate.py ATMEGA_AES_v1/ATM_AES_v1_fixed_key/example_generate_params
# Test the model
echo -ne '\n' | python ASCAD_test_models.py ATMEGA_AES_v1/ATM_AES_v1_fixed_key/example_test_models_params
# Train the model but early stop since we do not have a GPU here!
(timeout 60 python ASCAD_train_models.py ATMEGA_AES_v1/ATM_AES_v1_fixed_key/example_train_models_params; exit 0)
