#include <iostream>
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkScalarToRGBPixelFunctor.h"
#include "itkUnaryFunctorImageFilter.h"
#include "itkVectorGradientAnisotropicDiffusionImageFilter.h"
#include "itkWatershedImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkScalarToRGBColormapImageFilter.h"
#include "itkGradientMagnitudeImageFilter.h"

// Run with:
// ./SegmentWithWatershedImageFilter inputImageFile outputImageFile threshold level
// e.g.
// ./SegmentWithWatershedImageFilter BrainProtonDensitySlice.png OutBrainWatershed.png 0.005 .5
// (A rule of thumb is to set the Threshold to be about 1 / 100 of the Level.)

int main(int argc, char * argv[])
{
    if (argc < 3)
    {
        std::cerr << "Missing parameters." << std::endl;
        std::cerr << "Usage: " << argv[0];
        std::cerr << " <InputFileName> <OutputFileName>";
        std::cerr << " [Threshold] [Level]"<<std::endl;
        return EXIT_FAILURE;
    }

    float threshold=0;  //absolute minimum height value used during preprocessing (increasing threshold results in segmentation with fewer regions)
    float level=0.2;  //depth of flooding of the image, 1.0 corresponds to flooding to a depth of 100% of the image


    if (argc > 3)
    {
        threshold = std::stod(argv[3]);
    }

    if (argc > 4)
    {
        level = std::stod(argv[4]);
    }

    constexpr unsigned int Dimension = 3;

    using InputImageType = itk::Image<float, Dimension>; //unsigned char, Dimension>;
    using FloatImageType = itk::Image<float, Dimension>;
    using RGBPixelType = itk::RGBPixel<unsigned char>;
    using RGBImageType = itk::Image<RGBPixelType, Dimension>;
    using LabeledImageType = itk::Image<itk::IdentifierType, Dimension>;

    using FileReaderType = itk::ImageFileReader<InputImageType>;
    FileReaderType::Pointer reader = FileReaderType::New();
    reader->SetFileName(argv[1]);



    std::cout<<"Watershed transform will be applied directly on the input image"<<std::endl;

    using WatershedFilterType = itk::WatershedImageFilter<InputImageType>;
    WatershedFilterType::Pointer watershed = WatershedFilterType::New();

    watershed->SetThreshold(threshold);
    watershed->SetLevel(level);
    watershed->SetInput(reader->GetOutput());
    watershed->Update();

    using RGBFilterType = itk::ScalarToRGBColormapImageFilter<LabeledImageType, RGBImageType>;
    RGBFilterType::Pointer colormapImageFilter = RGBFilterType::New();
    colormapImageFilter->SetColormap(itk::RGBColormapFilterEnumType::Jet);
    colormapImageFilter->SetInput(watershed->GetOutput());
    colormapImageFilter->Update();

    using FileWriterType = itk::ImageFileWriter<RGBImageType>;
    FileWriterType::Pointer writer = FileWriterType::New();
    writer->SetFileName(argv[2]);
    writer->SetInput(colormapImageFilter->GetOutput());
    writer->Update();


    //for basic segmentation
//    RGBFilterType::Pointer colormapImageFilterForBasicSeg = RGBFilterType::New();
//    colormapImageFilterForBasicSeg->SetColormap(itk::RGBColormapFilterEnumType::Jet);
//    colormapImageFilterForBasicSeg->SetInput(watershed->GetBasicSegmentation());
//    colormapImageFilterForBasicSeg->Update();
//
//    FileWriterType::Pointer writer_for_basic_seg = FileWriterType::New();
//    writer_for_basic_seg->SetFileName("basicSeg.mha");
//    writer_for_basic_seg->SetInput(colormapImageFilterForBasicSeg->GetOutput());
//    writer_for_basic_seg->Update();

    using SegmentTreeType = itk::watershed::SegmentTree<float>;
    SegmentTreeType::Pointer segment_tree=SegmentTreeType::New();
    segment_tree=watershed->GetSegmentTree();



    return EXIT_SUCCESS;
}