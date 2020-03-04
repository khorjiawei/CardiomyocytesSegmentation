#include <iostream>
#include <string>
#include "itkImageFileReader.h"
#include "itkImageFileWriter.h"
#include "itkHessianToObjectnessMeasureImageFilter.h"
#include "itkMultiScaleHessianBasedMeasureImageFilter.h"
#include "itkRescaleIntensityImageFilter.h"

int main(int argc, char * argv[])
{
    if (argc < 4)
    {
        std::cerr << "Usage: " << std::endl;
        std::cerr << argv[0];
        std::cerr << " <InputFileName> <OutputFileName> <HessianOutputFileName>";
        std::cerr << " [SigmaMinimum] [SigmaMaximum]";
        std::cerr << " [NumberOfSigmaSteps]";
        std::cerr << std::endl;
        return EXIT_FAILURE;
    }

    const char * inputFileName = argv[1];
    const char * outputFileName = argv[2];
    const char * hessianOutputFileName = argv[3];
    double       sigmaMinimum = 2;
    if (argc > 4)
    {
        sigmaMinimum = std::stod(argv[4]);
    }
    double sigmaMaximum = 5;
    if (argc > 5)
    {
        sigmaMaximum = std::stod(argv[5]);
    }
    unsigned int numberOfSigmaSteps = 10;
    if (argc > 6)
    {
        numberOfSigmaSteps = std::stoi(argv[6]);
    }

    constexpr unsigned int Dimension = 3;

    using PixelType = float;
    using ImageType = itk::Image<PixelType, Dimension>;

    using ReaderType = itk::ImageFileReader<ImageType>;
    ReaderType::Pointer reader = ReaderType::New();
    reader->SetFileName(inputFileName);

    using HessianPixelType = itk::SymmetricSecondRankTensor<double, Dimension>;
    using HessianImageType = itk::Image<HessianPixelType, Dimension>;
    using ObjectnessFilterType = itk::HessianToObjectnessMeasureImageFilter<HessianImageType, ImageType>;
    ObjectnessFilterType::Pointer objectnessFilter = ObjectnessFilterType::New();
    objectnessFilter->SetBrightObject(true);
    objectnessFilter->SetScaleObjectnessMeasure(false);
    objectnessFilter->SetAlpha(1.0);
    objectnessFilter->SetBeta(1.0);
    objectnessFilter->SetGamma(1.0);
    objectnessFilter->SetObjectDimension(2); //M=2 for 2D plate-like structures

    using MultiScaleEnhancementFilterType =
    itk::MultiScaleHessianBasedMeasureImageFilter<ImageType, HessianImageType, ImageType>;
    MultiScaleEnhancementFilterType::Pointer multiScaleEnhancementFilter = MultiScaleEnhancementFilterType::New();
    multiScaleEnhancementFilter->SetInput(reader->GetOutput());
    multiScaleEnhancementFilter->SetHessianToMeasureFilter(objectnessFilter);
    multiScaleEnhancementFilter->SetSigmaStepMethodToLogarithmic();
    multiScaleEnhancementFilter->SetSigmaMinimum(sigmaMinimum);
    multiScaleEnhancementFilter->SetSigmaMaximum(sigmaMaximum);
    multiScaleEnhancementFilter->SetNumberOfSigmaSteps(numberOfSigmaSteps);
    multiScaleEnhancementFilter->GenerateHessianOutputOn();


    using OutputImageType = itk::Image<unsigned char, Dimension>;
    using RescaleFilterType = itk::RescaleIntensityImageFilter<ImageType, OutputImageType>;
    RescaleFilterType::Pointer rescaleFilter = RescaleFilterType::New();
    rescaleFilter->SetInput(multiScaleEnhancementFilter->GetOutput());

    //filtered image
    using WriterType = itk::ImageFileWriter<OutputImageType>;
    WriterType::Pointer writer = WriterType::New();
    writer->SetFileName(outputFileName);
    writer->SetInput(rescaleFilter->GetOutput());

    try
    {
        writer->Update();
    }
    catch (itk::ExceptionObject & error)
    {
        std::cerr << "Error: " << error << std::endl;
        return EXIT_FAILURE;
    }

    //hessian image
    using HessianWriterType = itk::ImageFileWriter<HessianImageType>;
    HessianWriterType::Pointer hessian_writer = HessianWriterType::New();
    hessian_writer->SetFileName(hessianOutputFileName);
    hessian_writer->SetInput(multiScaleEnhancementFilter->GetHessianOutput());

    try
    {
        hessian_writer->Update();
    }
    catch (itk::ExceptionObject & error)
    {
        std::cerr << "Error: " << error << std::endl;
        return EXIT_FAILURE;
    }


    return EXIT_SUCCESS;
}