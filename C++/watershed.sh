#!/usr/bin/env bash

# WATERSHED FILTER
InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/median.mha'
OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/watershed.mha'
#InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/median.mha'
#OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/watershed.mha'
threshold=0
level=0.2

echo "Running watershed filter (threshold,level=$threshold,$level) on $InputFileName"
./watershedFilter/bin/watershedFilter $InputFileName $OutputFileName $threshold $level
