//
//  StylizeViewController.m
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "StylizeViewController.h"


@interface StylizeViewController ()

@end

@implementation StylizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    
    self.originImageView2.image = nil;
    UIImage *originImage = [[UIImage alloc]init];
    originImage =[UIImage imageNamed:filterName];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    if ([filterName isEqualToString:self.dataArray[0]] || [filterName isEqualToString:self.dataArray[1]]) {
        UIImage *image = [UIImage imageNamed:@"CIBlendWithAlphaMask_2x-1"];
        CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
        UIImage *backgroundImage = [UIImage imageNamed:@"CIBlendWithAlphaMask"];
        CIImage *inputBackgroundImage = [CIImage imageWithCGImage:backgroundImage.CGImage];
        UIImage *maskImage =[UIImage imageNamed:@"CIBlendWithAlphaMask_2x-2"];
        CIImage *inputMaskImage = [CIImage imageWithCGImage:maskImage.CGImage];
        
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:inputBackgroundImage forKey:@"inputBackgroundImage"];
        [filter setValue:inputMaskImage forKey:@"inputMaskImage"];
        
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@10.0 forKey:@"inputRadius"];
        [filter setValue:@0.5 forKey:@"inputIntensity"];
        
    }else if ([filterName isEqualToString:self.dataArray[3]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
    }else if ([filterName isEqualToString:self.dataArray[4]] || [filterName isEqualToString:self.dataArray[7]]|| [filterName isEqualToString:self.dataArray[8]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[4]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CGFloat x[] = {0,0,0,0,1,0,0,0,0};
        CIVector *vector = [[CIVector alloc]initWithValues:x count:9];
        [filter setValue:vector forKey:@"inputWeights"];
        [filter setValue:@0.0 forKey:@"inputBias"];
    }else if ([filterName isEqualToString:self.dataArray[5]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[4]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CGFloat x[] = {0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0};
        CIVector *vector = [[CIVector alloc]initWithValues:x count:25];
        [filter setValue:vector forKey:@"inputWeights"];
        [filter setValue:@0.0 forKey:@"inputBias"];
        originImage = [UIImage imageNamed:self.dataArray[4]];
    }else if ([filterName isEqualToString:self.dataArray[6]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[4]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CGFloat x[] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,};
        CIVector *vector = [[CIVector alloc]initWithValues:x count:49];
        [filter setValue:vector forKey:@"inputWeights"];
        [filter setValue:@0.0 forKey:@"inputBias"];
        originImage = [UIImage imageNamed:self.dataArray[4]];
    }else if ([filterName isEqualToString:self.dataArray[9]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@20.0 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[10]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CIVector *inputPoint0 = [[CIVector alloc]initWithX:0 Y:0];
        [filter setValue:inputPoint0 forKey:@"inputPoint0"];
        CIVector *inputPoint1 = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputPoint1 forKey:@"inputPoint1"];
        [filter setValue:@10.0 forKey:@"inputSaturation"];
        [filter setValue:@10.0 forKey:@"inputUnsharpMaskRadius"];
        [filter setValue:@10.0 forKey:@"inputUnsharpMaskIntensity"];
        [filter setValue:@10.0 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[11]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[10]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@1.0 forKey:@"inputIntensity"];
        originImage = [UIImage imageNamed:self.dataArray[10]];
    }else if ([filterName isEqualToString:self.dataArray[12]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[10]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@3.0 forKey:@"inputRadius"];
        originImage = [UIImage imageNamed:self.dataArray[10]];
    }else if ([filterName isEqualToString:self.dataArray[13]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[10]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@10.0 forKey:@"inputRadius"];
        [filter setValue:@0.5 forKey:@"inputIntensity"];
        originImage = [UIImage imageNamed:self.dataArray[10]];
    }else if ([filterName isEqualToString:self.dataArray[14]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@10.0 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[15]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@8.0 forKey:@"inputScale"];
        CIVector *inputCenter = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputCenter forKey:@"inputCenter"];
    }else if ([filterName isEqualToString:self.dataArray[16]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:filterName].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@1.0 forKey:@"inputHighlightAmount"];
        [filter setValue:@1.0 forKey:@"inputShadowAmount"];
    }else if ([filterName isEqualToString:self.dataArray[17]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:self.dataArray[16]].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:@0.07 forKey:@"inputNRNoiseLevel"];
        [filter setValue:@0.71 forKey:@"inputNRSharpness"];
        [filter setValue:@1.0 forKey:@"inputEdgeIntensity"];
        [filter setValue:@0.2 forKey:@"inputThreshold"];
        [filter setValue:@50.0 forKey:@"inputContrast"];
        originImage = [UIImage imageNamed:self.dataArray[16]];
    }else if ([filterName isEqualToString:self.dataArray[18]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIBloom"].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CIVector *inputCenter = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputCenter forKey:@"inputCenter"];
        [filter setValue:@8.0 forKey:@"inputScale"];
        originImage = [UIImage imageNamed:@"CIBloom"];
    }else if ([filterName isEqualToString:self.dataArray[19]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIBloom"].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CIVector *inputCenter = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputCenter forKey:@"inputCenter"];
        [filter setValue:@20.0 forKey:@"inputRadius"];
        originImage = [UIImage imageNamed:@"CIBloom"];
    }else if ([filterName isEqualToString:self.dataArray[20]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIHeightFieldFromMask"].CGImage];
        CIImage *inputShadingImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIShadedMaterial"].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        [filter setValue:inputShadingImage forKey:@"inputShadingImage"];
        [filter setValue:@10.0 forKey:@"inputScale"];
        originImage = [UIImage imageNamed:@"CIHeightFieldFromMask"];
        self.originImageView2.image = [UIImage imageNamed:@"CIShadedMaterial"];
    }else if ([filterName isEqualToString:self.dataArray[21]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIComicEffect"].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        
        CIColor *inputCenterColor1 = [CIColor colorWithCGColor:[UIColor redColor].CGColor];
        CIColor *inputReplacementColor1 = [CIColor colorWithCGColor:[UIColor whiteColor].CGColor];
        [filter setValue:inputCenterColor1 forKey:@"inputCenterColor1"];
        [filter setValue:inputReplacementColor1 forKey:@"inputReplacementColor1"];
        [filter setValue:@0.22 forKey:@"inputCloseness1"];
        [filter setValue:@0.98 forKey:@"inputContrast1"];
        
        CIColor *inputCenterColor2 = [CIColor colorWithCGColor:[UIColor redColor].CGColor];
        CIColor *inputReplacementColor2 = [CIColor colorWithCGColor:[UIColor whiteColor].CGColor];
        [filter setValue:inputCenterColor2 forKey:@"inputCenterColor2"];
        [filter setValue:inputReplacementColor2 forKey:@"inputReplacementColor2"];
        [filter setValue:@0.15 forKey:@"inputCloseness2"];
        [filter setValue:@0.98 forKey:@"inputContrast2"];
        
        CIColor *inputCenterColor3 = [CIColor colorWithCGColor:[UIColor redColor].CGColor];
        CIColor *inputReplacementColor3 = [CIColor colorWithCGColor:[UIColor whiteColor].CGColor];
        [filter setValue:inputCenterColor3 forKey:@"inputCenterColor3"];
        [filter setValue:inputReplacementColor3 forKey:@"inputReplacementColor3"];
        [filter setValue:@0.50 forKey:@"inputCloseness3"];
        [filter setValue:@0.99 forKey:@"inputContrast3"];
        
        originImage = [UIImage imageNamed:@"CIComicEffect"];
    }else if ([filterName isEqualToString:self.dataArray[22]]){
        CIImage *inputImage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CIBloom"].CGImage];
        [filter setValue:inputImage forKey:@"inputImage"];
        CIVector *inputLightPosition = [[CIVector alloc]initWithX:400 Y:600 Z:150];
        CIVector *inputLightPointsAt = [[CIVector alloc]initWithX:200 Y:200 Z:0];
        [filter setValue:inputLightPosition forKey:@"inputLightPosition"];
        [filter setValue:inputLightPointsAt forKey:@"inputLightPointsAt"];
        [filter setValue:@3.00 forKey:@"inputBrightness"];
        [filter setValue:@0.10 forKey:@"inputConcentration"];
        [filter setValue:[CIColor colorWithCGColor:[UIColor grayColor].CGColor] forKey:@"inputColor"];
        originImage = [UIImage imageNamed:@"CIBloom"];
    }
    self.originImageView.image = originImage;
    CIImage *ciimage = filter.outputImage;
    return ciimage;
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
