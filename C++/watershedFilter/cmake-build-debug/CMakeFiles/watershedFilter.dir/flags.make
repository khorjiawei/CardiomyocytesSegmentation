# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# compile CXX with /usr/bin/c++
CXX_FLAGS =   -msse2 -g   -std=gnu++14

CXX_DEFINES = -DDEBUG -DITK_IO_FACTORY_REGISTER_MANAGER -D_GNU_SOURCE

CXX_INCLUDES = -I/home/jwk114/CardiomyocytesSegmentation/C++/watershedFilter/cmake-build-debug/ITKFactoryRegistration -I/home/jwk114/ITK-Source/ITK/Modules/Video/Filtering/include -I/home/jwk114/ITK-Source/ITK/Modules/Video/IO/include -I/home/jwk114/ITK-Source/ITK/Modules/Video/Core/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/SuperPixel/include -I/home/jwk114/ITK-Source/ITK/Modules/Nonunit/Review/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/RegistrationMethodsv4/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/Metricsv4/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/Optimizersv4/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/LevelSetsv4/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/libLBFGS/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/Watersheds/include -I/home/jwk114/ITK-Source/ITK/Modules/Bridge/VTK/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/SpatialFunction/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/RegionGrowing/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/QuadEdgeMeshFiltering/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/MarkovRandomFieldsClassifiers/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/LabelVoting/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/KLMRegionGrowing/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageNoise/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageFusion/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageFrequency/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TransformMatlab/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TransformInsightLegacy/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TransformHDF5/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TransformBase/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TransformFactory/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/Stimulate/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/SpatialObjects/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/XML/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/RAW/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MRC/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MINC/include -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/HDF5/src/itkhdf5 -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/HDF5/src/itkhdf5 -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MINC/src/libminc/volume_io/Include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MINC/src/libminc/libsrc2 -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MINC/src/libminc/libcommon -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MINC/src/libminc -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MINC -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/MINC -I/home/jwk114/ITK-Source/ITK/Modules/IO/LSM/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/JPEG2000/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/OpenJPEG/src/openjpeg -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/OpenJPEG/src/openjpeg -I/home/jwk114/ITK-Source/ITK/Modules/IO/HDF5/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/Siemens/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/GE/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/IPL/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/CSV/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/Bruker/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/BioRad/include -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/HDF5/src -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/HDF5/src -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/GPUThresholding/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/GPUSmoothing/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/GPUPDEDeformable/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/PDEDeformable/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/Common/include -I/home/jwk114/ITK-Source/ITK/Modules/Registration/GPUCommon/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/GPUImageFilterBase/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/GPUAnisotropicSmoothing/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/GPUFiniteDifference/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/GPUCommon/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/Mesh/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/Eigen/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/DisplacementField/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/DiffusionTensorImage/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Denoising/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/DeformableMesh/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Deconvolution/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/DICOMParser/src/DICOMParser -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/DICOMParser/src/DICOMParser -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Convolution/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/FFT/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Colormap/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/Classifiers/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/BiasCorrection/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/Polynomials/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/AntiAlias/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/LevelSets/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/SignedDistanceFunction/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/Optimizers/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageFeature/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageSources/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageGradient/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Smoothing/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageCompare/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/FastMarching/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/DistanceMap/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/NarrowBand/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/BinaryMathematicalMorphology/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/MathematicalMorphology/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/ConnectedComponents/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Thresholding/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/LabelMap/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageLabel/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageIntensity/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/Path/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageStatistics/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/SpatialObjects/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageCompose/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/TestKernel/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/VTK/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/TIFF/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/TIFF/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/TIFF/src/itktiff -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/TIFF/src -I/home/jwk114/ITK-Source/ITK/Modules/IO/PNG/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/PNG/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/PNG/src -I/home/jwk114/ITK-Source/ITK/Modules/IO/NRRD/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/NrrdIO/src/NrrdIO -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/NrrdIO/src/NrrdIO -I/home/jwk114/ITK-Source/ITK/Modules/IO/NIFTI/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/Meta/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/MetaIO/src/MetaIO/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/MetaIO/src/MetaIO/src -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshVTK/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshOFF/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshOBJ/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshGifti/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GIFTI/src/gifticlib -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshFreeSurfer/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshBYU/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/MeshBase/include -I/home/jwk114/ITK-Source/ITK/Modules/Segmentation/Voronoi/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/QuadEdgeMesh/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/Mesh/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/JPEG/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/JPEG/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/JPEG/src -I/home/jwk114/ITK-Source/ITK/Modules/IO/GIPL/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/GDCM/include -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/MessageExchangeDefinition -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/Common -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/GDCM/src/gdcm/Source/MediaStorageAndFileFormat -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/GDCM/src/gdcm/Source/Common -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/GDCM -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/ZLIB/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/ZLIB/src -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/Expat/src/expat -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/Expat/src/expat -I/home/jwk114/ITK-Source/ITK/Modules/IO/BMP/include -I/home/jwk114/ITK-Source/ITK/Modules/IO/ImageBase/include -I/home/jwk114/ITK-Source/ITK/bin/Modules/IO/ImageBase -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/AnisotropicSmoothing/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageGrid/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/ImageFunction/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/Transform/include -I/home/jwk114/ITK-Source/ITK/Modules/Numerics/Statistics/include -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/Netlib -I/home/jwk114/ITK-Source/ITK/Modules/Core/ImageAdaptors/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/CurvatureFlow/include -I/home/jwk114/ITK-Source/ITK/Modules/Filtering/ImageFilterBase/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/FiniteDifference/include -I/home/jwk114/ITK-Source/ITK/Modules/Core/Common/include -I/home/jwk114/ITK-Source/ITK/bin/Modules/Core/Common -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/VNL/src/vxl/core -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/VNL/src/vxl/vcl -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/VNL/src/vxl/v3p/netlib -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/VNL/src/vxl/core -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/KWIML/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/KWIML/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/Eigen3/src -I/home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/DoubleConversion/src/double-conversion -I/home/jwk114/ITK-Source/ITK/Modules/ThirdParty/DoubleConversion/src -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/src -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/NIFTI/src/nifti/znzlib -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/NIFTI/src/nifti/niftilib -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/VNL/src/vxl/vcl -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/VNL/src/vxl/v3p/netlib -isystem /home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/KWSys/src -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/Eigen3/src/itkeigen/.. -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/VNL/src/vxl/core/vnl/algo -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/VNL/src/vxl/core/vnl -isystem /home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/NIFTI/src/nifti/znzlib -isystem /home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/NIFTI/src/nifti/niftilib -isystem /home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src -isystem /home/jwk114/ITK-Source/ITK/Modules/ThirdParty/HDF5/src/itkhdf5/c++/src -isystem /home/jwk114/ITK-Source/ITK/bin/Modules/ThirdParty/HDF5/src/itkhdf5/src 
