#include <iostream>
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkScalarToRGBPixelFunctor.h"
#include "itkUnaryFunctorImageFilter.h"
#include "itkMorphologicalWatershedFromMarkersImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"
#include "itkScalarToRGBColormapImageFilter.h"


int main(int argc, char * argv[])
{
    if (argc < 4)
    {
        std::cerr << "Missing parameters." << std::endl;
        std::cerr << "Usage: " << argv[0];
        std::cerr << " <InputFileName> <MarkerFileName> <OutputFileName>";
        std::cerr << ""<<std::endl;
        return EXIT_FAILURE;
    }


    constexpr unsigned int Dimension = 3;

    using InputImageType = itk::Image<float, Dimension>; //unsigned char, Dimension>;
    using MarkerImageType = itk::Image<unsigned long, Dimension>;
    using RGBPixelType = itk::RGBPixel<unsigned char>;
    using RGBImageType = itk::Image<RGBPixelType, Dimension>;
    using LabeledImageType = itk::Image<itk::IdentifierType, Dimension>;

    using FileReaderType = itk::ImageFileReader<InputImageType>;
    FileReaderType::Pointer reader = FileReaderType::New();
    reader->SetFileName(argv[1]);

    using MarkerFileReaderType = itk::ImageFileReader<MarkerImageType>;
    MarkerFileReaderType::Pointer reader_marker = MarkerFileReaderType::New();
    reader_marker->SetFileName(argv[2]);

    using WatershedFilterType = itk::MorphologicalWatershedFromMarkersImageFilter<InputImageType,LabeledImageType >;
    WatershedFilterType::Pointer watershed = WatershedFilterType::New();

    watershed->SetInput(reader->GetOutput());
    watershed->SetMarkerImage(reader_marker->GetOutput());
    watershed->Update();

    using RGBFilterType = itk::ScalarToRGBColormapImageFilter<LabeledImageType, RGBImageType>;
    RGBFilterType::Pointer colormapImageFilter = RGBFilterType::New();
    colormapImageFilter->SetColormap(itk::RGBColormapFilterEnumType::Jet);
    colormapImageFilter->SetInput(watershed->GetOutput());
    colormapImageFilter->Update();

    using FileWriterType = itk::ImageFileWriter<RGBImageType>;
    FileWriterType::Pointer writer = FileWriterType::New();
    writer->SetFileName(argv[3]);
    writer->SetInput(colormapImageFilter->GetOutput());
    writer->Update();






    return EXIT_SUCCESS;
}