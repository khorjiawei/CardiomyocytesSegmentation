#!/usr/bin/env bash

# MORPHOLOGICAL WATERSHED FROM MARKERS FILTER
InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/medianPlusplaneCleanScaledClosedGapsThreshold5.tif'
MarkersFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/markers.tif'
OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp300_300_ep600_600/morphWatershed-fromMedianPlusplaneCleanScaledClosedGapsThreshold5.mha'
#InputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/median.mha'
#OutputFileName='/home/jwk114/CardiomyocytesSegmentation/Images/series1_tilescan4_channel3_cropped_sp200_0_ep800_600/morphWatershed.mha'
threshold=0
level=0.2

echo "Running morphological watershed from markers image filter"
./morphMarkerWatershedFilter/bin/morphMarkerWatershedFilter $InputFileName $MarkersFileName $OutputFileName
