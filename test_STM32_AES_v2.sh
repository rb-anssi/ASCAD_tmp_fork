#!/bin/sh

#### Testing STM32_AES_v2/
# First download elements
# Download the extracted databases
cd STM32_AES_v2/ && mkdir -p ASCAD_data/ASCAD_databases && cd -
cd STM32_AES_v2/ASCAD_data/ASCAD_databases && wget https://files.data.gouv.fr/anssi/ascadv2/ascadv2-extracted.h5 && cd -
# Download the trained models
cd STM32_AES_v2/ && mkdir -p ASCAD_data/ASCAD_trained_models && cd -
cd STM32_AES_v2/ASCAD_data/ASCAD_trained_models && wget https://files.data.gouv.fr/anssi/ascadv2/ascadv2-multi-resnet-60epochs.h5 && cd -
cd STM32_AES_v2/ASCAD_data/ASCAD_trained_models && wget https://files.data.gouv.fr/anssi/ascadv2/ascadv2-multi-resnet-wo-permind-60epochs.h5 && cd -
# Test the trained models
echo -ne '\n' | python ASCAD_test_models.py STM32_AES_v2/example_test_models_params
echo -ne '\n' | python ASCAD_test_models.py STM32_AES_v2/example_test_models_without_permind_params
# Train the models
# NOTE: large timeout to allow for swap ...
(timeout 600 python ASCAD_train_models.py STM32_AES_v2/example_train_models_params; exit 0)
(timeout 600 python ASCAD_train_models.py STM32_AES_v2/example_train_models_without_permind_params; exit 0)
