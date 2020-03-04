#!/usr/bin/env bash

# MEDIAN FILTER
InputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/series1_tilescan4_channel3_cropped_sp300_300_ep600_600.tif"
OutputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/median.mha"
#InputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/series1_tilescan4_channel3_cropped_sp200_0_ep800_600.tif"
#OutputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/median.mha"
radius=4

echo "Running median filter (r=$radius) on $InputFileName"
./medianFilter/bin/medianFilter $InputFileName $OutputFileName $radius

# PLANARITY FILTER
InputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/median.mha"
OutputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/plane.mha"
HessianFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/hessian.mha"
#InputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/median.mha"
#OutputFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/plane.mha"
#HessianFileName="/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/hessian.mha"
SigmaMin=2
SigmaMax=5
NumSigmaSteps=10

echo "Running planarity filter (min,max,step=$SigmaMin,$SigmaMax,$NumSigmaSteps) on $InputFileName"
./planarityFilter/bin/planarityFilter $InputFileName $OutputFileName $HessianFileName $SigmaMin $SigmaMax $NumSigmaSteps

# WATERSHED FILTER
InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/median.mha'
OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/watershed.mha'
#InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/median.mha'
#OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/watershed.mha'
threshold=0
level=0.2

echo "Running watershed filter (threshold,level=$threshold,$level) on $InputFileName"
./watershedFilter/bin/watershedFilter $InputFileName $OutputFileName $threshold $level
