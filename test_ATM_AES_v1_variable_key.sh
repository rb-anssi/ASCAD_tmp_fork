#!/bin/sh

#### Testing ATMEGA_AES_v1/ATM_AES_v1_variable_key/
# First download elements
# Download the extracted databases
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ && mkdir -p ASCAD_data/ASCAD_databases && cd -
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ASCAD_data/ASCAD_databases && wget https://static.data.gouv.fr/resources/ascad-atmega-8515-variable-key/20190903-083349/ascad-variable.h5 && mv ascad-variable.h5 ASCAD.h5 && cd -
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ASCAD_data/ASCAD_databases && wget https://static.data.gouv.fr/resources/ascad-atmega-8515-variable-key/20190903-084119/ascad-variable-desync50.h5 && mv ascad-variable-desync50.h5 ASCAD_desync50.h5 && cd -
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ASCAD_data/ASCAD_databases && wget https://static.data.gouv.fr/resources/ascad-atmega-8515-variable-key/20190903-084306/ascad-variable-desync100.h5 && mv ascad-variable-desync100.h5 ASCAD_desync100.h5 && cd -
# Download the models
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ && mkdir -p ASCAD_data/ASCAD_trained_models && cd -
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ASCAD_data/ASCAD_trained_models/ && wget https://static.data.gouv.fr/resources/ascad-atmega-8515-variable-key/20190801-132322/cnn2-ascad-desync0.h5 && cd -
cd ATMEGA_AES_v1/ATM_AES_v1_variable_key/ASCAD_data/ASCAD_trained_models/ && wget https://static.data.gouv.fr/resources/ascad-atmega-8515-variable-key/20190801-132406/cnn2-ascad-desync50.h5 && cd -
# Test the models
echo -ne '\n' | python ASCAD_test_models.py ATMEGA_AES_v1/ATM_AES_v1_variable_key/example_test_models_params
# Train the models
(timeout 60 python ASCAD_train_models.py ATMEGA_AES_v1/ATM_AES_v1_variable_key/example_train_models_params; exit 0)

