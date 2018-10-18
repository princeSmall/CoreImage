



//
//  CoreImageModel.m
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "CoreImageModel.h"

@implementation CoreImageModel

- (NSArray *)blurArray{
    if (!_blurArray) {
        _blurArray = [NSArray arrayWithObjects:@"CIBoxBlur",@"CIDiscBlur",@"CIGaussianBlur",@"CIMaskedVariableBlur",@"CIMedianFilter",@"CIMotionBlur",@"CINoiseReduction",@"CIZoomBlur", nil];
    }
    return _blurArray;
}
- (NSArray *)colorAdjustmentArray{
    if (!_colorAdjustmentArray) {
        _colorAdjustmentArray = [NSArray arrayWithObjects:@"CIColorClamp",@"CIColorControls",@"CIColorMatrix",@"CIColorPolynomial",@"CIExposureAdjust",@"CIGammaAdjust",@"CIHueAdjust",@"CILinearToSRGBToneCurve",@"CISRGBToneCurveToLinear",@"CITemperatureAndTint",@"CIToneCurve",@"CIVibrance",@"CIWhitePointAdjust", nil];
    }
    return _colorAdjustmentArray;
}
- (NSArray *)colorEffextArray{
    if (!_colorEffextArray) {
        _colorEffextArray = [NSArray arrayWithObjects:@"CIColorCrossPolynomial",@"CIColorCube",@"CIColorCubeWithColorSpace",@"CIColorInvert",@"CIColorMap",@"CIColorMonochrome",@"CIColorPosterize",@"CIFalseColor",@"CIMaskToAlpha",@"CIMaximumComponent",@"CIMinimumComponent",@"CIPhotoEffectChrome",@"CIPhotoEffectFade",@"CIPhotoEffectInstant",@"CIPhotoEffectMono",@"CIPhotoEffectNoir",@"CIPhotoEffectProcess",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer",@"CISepiaTone",@"CIVignette",@"CIVignetteEffect", nil];
    }
    return _colorEffextArray;
}
- (NSArray *)compositeArray{
    if (!_compositeArray) {
        _compositeArray = [[NSArray alloc]initWithObjects:@"CIAdditionCompositing",@"CIColorBlendMode",@"CIColorBurnBlendMode",@"CIColorDodgeBlendMode",@"CIDarkenBlendMode",@"CIDifferenceBlendMode",@"CIDivideBlendMode",@"CIExclusionBlendMode",@"CIHardLightBlendMode",@"CIHueBlendMode",@"CILightenBlendMode",@"CILinearBurnBlendMode",@"CILinearDodgeBlendMode",@"CILuminosityBlendMode",@"CIMaximumCompositing",@"CIMinimumCompositing",@"CIMultiplyBlendMode",@"CIMultiplyCompositing",@"CIOverlayBlendMode",@"CIPinLightBlendMode",@"CISaturationBlendMode",@"CIScreenBlendMode",@"CISoftLightBlendMode",@"CISourceAtopCompositing",@"CISourceInCompositing",@"CISourceOutCompositing",@"CISourceOverCompositing",@"CISubtractBlendMode", nil];
    }
    return _compositeArray;
}
- (NSArray *)distortionEffect{
    if (!_distortionEffect) {
        _distortionEffect = [[NSArray alloc]initWithObjects:@"CIBumpDistortion",@"CIBumpDistortionLinear",@"CICircleSplashDistortion",@"CICircularWrap",@"CIDroste",@"CIDisplacementDistortion",@"CIGlassDistortion",@"CIGlassLozenge",@"CIHoleDistortion",@"CILightTunnel",@"CIPinchDistortion",@"CIStretchCrop",@"CITorusLensDistortion",@"CITwirlDistortion",@"CIVortexDistortion", nil];
    }
    return _distortionEffect;
}
- (NSArray *)generatorArray{
    if (!_generatorArray) {
        _generatorArray = [NSArray arrayWithObjects:@"CICode128BarcodeGenerator",@"CIQRCodeGenerator",@"CICheckerboardGenerator", nil];
    }
    return _generatorArray;
}
- (NSArray *)GeometryAdjustmentArray{
    if (!_GeometryAdjustmentArray) {
        _GeometryAdjustmentArray = [NSArray arrayWithObjects:@"CIAffineTransform",@"CICrop",@"CILanczosScaleTransform",@"CIPerspectiveCorrection",@"CIPerspectiveTransform",@"CIPerspectiveTransformWithExtent",@"CIStraightenFilter", nil];
    }
    return _GeometryAdjustmentArray;
}
- (NSArray *)gradientArray{
    if (!_gradientArray) {
        _gradientArray = [NSArray arrayWithObjects:@"CIGaussianGradient",@"CILinearGradient",@"CIRadialGradient",@"CISmoothLinearGradient", nil];
    }
    return _gradientArray;
}
- (NSArray *)HalftoneEffectArray{
    if (!_HalftoneEffectArray) {
        _HalftoneEffectArray = [NSArray arrayWithObjects:@"CICircularScreen",@"CICMYKHalftone",@"CIDotScreen",@"CIHatchedScreen",@"CILineScreen", nil];
    }
    return _HalftoneEffectArray;
}
- (NSArray *)ReductionArray{
    if (!_ReductionArray) {
        _ReductionArray = [NSArray arrayWithObjects:@"CIAreaAverage",@"CIAreaHistogram",@"CIRowAverage",@"CIColumnAverage",@"CIHistogramDisplayFilter",@"CIAreaMaximum",@"CIAreaMinimum",@"CIAreaMaximumAlpha",@"CIAreaMinimumAlpha", nil];
    }
    return _ReductionArray;
}
- (NSArray *)SharpenArray{
    if (!_SharpenArray) {
        _SharpenArray = [NSArray arrayWithObjects:@"CISharpenLuminance",@"CIUnsharpMask", nil];
    }
    return _SharpenArray;
}
- (NSArray *)StylizeArray{
    if (!_StylizeArray) {
        _StylizeArray = [NSArray arrayWithObjects:@"CIBlendWithAlphaMask",@"CIBlendWithMask",@"CIBloom",@"CIComicEffect",@"CIConvolution3X3",@"CIConvolution5X5",@"CIConvolution7X7",@"CIConvolution9Horizontal",@"CIConvolution9Vertical",@"CICrystallize",@"CIDepthOfField",@"CIEdges",@"CIEdgeWork",@"CIGloom",@"CIHeightFieldFromMask",@"CIHexagonalPixellate",@"CIHighlightShadowAdjust",@"CILineOverlay",@"CIPixellate",@"CIPointillize",@"CIShadedMaterial",@"CISpotColor",@"CISpotLight", nil];
    }
    return _StylizeArray;
}
- (NSArray *)TileEffectArray{
    if (!_TileEffectArray) {
        _TileEffectArray = [NSArray arrayWithObjects:@"CIAffineClamp",@"CIAffineTile",@"CIEightfoldReflectedTile",@"CIFourfoldReflectedTile", @"CIFourfoldRotatedTile",@"CIFourfoldTranslatedTile",@"CIGlideReflectedTile",@"CIKaleidoscope",@"CIOpTile",@"CIParallelogramTile",@"CIPerspectiveTile",@"CISixfoldReflectedTile",@"CISixfoldRotatedTile",@"CITriangleKaleidoscope",@"CITriangleTile",@"CITwelvefoldReflectedTile",nil];
    }
    return _TileEffectArray;
}
- (NSArray *)TransitionArray{
    if (!_TransitionArray) {
        _TransitionArray = [NSArray arrayWithObjects:@"CIAccordionFoldTransition",@"CIBarsSwipeTransition",@"CICopyMachineTransition",@"CIDisintegrateWithMaskTransition",@"CIDissolveTransition",@"CIFlashTransition",@"CIModTransition",@"CIPageCurlTransition",@"CIPageCurlWithShadowTransition",@"CIRippleTransition",@"CISwipeTransition",nil];
    }
    return _TransitionArray;
}
- (NSArray *)mainArray{
    if (!_mainArray) {
        _mainArray = [NSArray arrayWithObjects:@"CICategoryBlur",@"CICategoryColorAdjustment",@"CICategoryColorEffect",@"CICategoryCompositeOperation",@"CICategoryDistortionEffect",@"CICategoryGenerator",@"CICategoryGeometryAdjustment",@"CICategoryGradient",@"CICategoryHalftoneEffect",@"CICategoryReduction",@"CICategorySharpen",@"CICategoryStylize",@"CICategoryTileEffect",@"CICategoryTransition", nil];
    }
    return _mainArray;
}


















@end
