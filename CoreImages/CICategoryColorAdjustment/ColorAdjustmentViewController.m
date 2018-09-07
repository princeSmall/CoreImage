//
//  ColorAdjustmentViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/6.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ColorAdjustmentViewController.h"
#import <CoreImage/CoreImage.h>

@interface ColorAdjustmentViewController ()
@property (nonatomic ,strong)UIImageView *originImageView;
@property (nonatomic ,strong)UIImageView *imageView;
@end

@implementation ColorAdjustmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.originImageView];
    [self.view addSubview:self.imageView];
    self.originImageView.image = [UIImage imageNamed:@"image.jpg"];
    self.imageView.image =[UIImage imageWithCGImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CGImageRef)applyFilterChain:(NSString *)filterName{
    UIImage *originImage = [UIImage imageNamed:@"image.jpg"];
    CIImage *ciimage = [CIImage imageWithCGImage:originImage.CGImage];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:ciimage forKey:kCIInputImageKey];
    
    if ([filterName isEqualToString:@"CIColorClamp"]) {
        CIVector *minVector = [[CIVector alloc]initWithX:0 Y:0 Z:0 W:0];
        CIVector *maxVector = [[CIVector alloc]initWithX:0.6 Y:0.6 Z:1.0 W:1.0];
        [filter setValue:minVector forKey:@"inputMinComponents"];
        [filter setValue:maxVector forKey:@"inputMaxComponents"];
    }else if ([filterName isEqualToString:@"CIColorControls"]){
        [filter setValue:@1.0 forKey:@"inputSaturation"];
        [filter setValue:@0.5 forKey:@"inputBrightness"];
        [filter setValue:@1.0 forKey:@"inputContrast"];
    }else if ([filterName isEqualToString:@"CIColorMatrix"]){
        CIVector *inputRVector = [[CIVector alloc]initWithX:1 Y:0 Z:0 W:0];
         CIVector *inputGVector = [[CIVector alloc]initWithX:0 Y:1 Z:0 W:0];
         CIVector *inputBVector = [[CIVector alloc]initWithX:0 Y:0 Z:1 W:0];
         CIVector *inputAVector = [[CIVector alloc]initWithX:0 Y:0 Z:0 W:1];
         CIVector *inputBiasVector = [[CIVector alloc]initWithX:1 Y:0 Z:0 W:0];
        [filter setValue:inputRVector forKey:@"inputRVector"];
        [filter setValue:inputGVector forKey:@"inputGVector"];
        [filter setValue:inputBVector forKey:@"inputBVector"];
        [filter setValue:inputAVector forKey:@"inputAVector"];
        [filter setValue:inputBiasVector forKey:@"inputBiasVector"];
        
    }else if ([filterName isEqualToString:@"CIColorPolynomial"]){
        CIVector *inputRedCoefficients = [[CIVector alloc]initWithX:0  Y:0 Z:0 W:0.4];
        CIVector *inputGreenCoefficients = [[CIVector alloc]initWithX:0 Y:1 Z:0.5 W:0.8];
        CIVector *inputBlueCoefficients = [[CIVector alloc]initWithX:0 Y:0 Z:0.5 W:1];
        CIVector *inputAlphaCoefficients = [[CIVector alloc]initWithX:0 Y:1 Z:1 W:1];
        
        [filter setValue:inputRedCoefficients forKey:@"inputRedCoefficients"];
        [filter setValue:inputGreenCoefficients forKey:@"inputGreenCoefficients"];
        [filter setValue:inputBlueCoefficients forKey:@"inputBlueCoefficients"];
        [filter setValue:inputAlphaCoefficients forKey:@"inputAlphaCoefficients"];
        
    }else if ([filterName isEqualToString:@"CIExposureAdjust"]){
        [filter setValue:@0.5 forKey:@"inputEV"];
    }else if ([filterName isEqualToString:@"CIGammaAdjust"]){
         [filter setValue:@0.75 forKey:@"inputPower"];
    }else if ([filterName isEqualToString:@"CIHueAdjust"]){
        [filter setValue:@0.0 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:@"CITemperatureAndTint"]){
        CIVector *inputNeutral = [[CIVector alloc]initWithCGPoint:CGPointMake(6500, 0)];
         [filter setValue:inputNeutral forKey:@"inputNeutral"];
        CIVector *inputTargetNeutral = [[CIVector alloc]initWithCGPoint:CGPointMake(6500, 0)];
        [filter setValue:inputTargetNeutral forKey:@"inputTargetNeutral"];
    }else if ([filterName isEqualToString:@"CIToneCurve"]){
        CIVector *inputPoint0 = [[CIVector alloc]initWithCGPoint:CGPointMake(0, 0)];
        [filter setValue:inputPoint0 forKey:@"inputPoint0"];
        CIVector *inputPoint1 = [[CIVector alloc]initWithCGPoint:CGPointMake(0.25, 0.25)];
        [filter setValue:inputPoint1 forKey:@"inputPoint1"];
        CIVector *inputPoint2 = [[CIVector alloc]initWithCGPoint:CGPointMake(0.5, 0.5)];
        [filter setValue:inputPoint2 forKey:@"inputPoint2"];
        CIVector *inputPoint3 = [[CIVector alloc]initWithCGPoint:CGPointMake(0.75, 0.75)];
        [filter setValue:inputPoint3 forKey:@"inputPoint3"];
        CIVector *inputPoint4 = [[CIVector alloc]initWithCGPoint:CGPointMake(1, 1)];
        [filter setValue:inputPoint4 forKey:@"inputPoint4"];
    }else if ([filterName isEqualToString:@"CIVibrance"]){
        [filter setValue:@10 forKey:@"inputAmount"];
    }else if ([filterName isEqualToString:@"CIWhitePointAdjust"]){
        UIColor *color =[UIColor yellowColor];
        CIColor *cicolor =[CIColor colorWithCGColor:color.CGColor];
        [filter setValue:cicolor forKey:@"inputColor"];
    }
    
    CIImage *ciImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef outImage = [context createCGImage:ciImage fromRect:ciImage.extent];
    return outImage;
}
- (UIImageView *)originImageView{
    if (!_originImageView) {
        _originImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    }
    return _originImageView;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 200, 200)];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
