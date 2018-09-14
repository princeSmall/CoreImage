//
//  TransitionViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/12.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.originImageView.image =[UIImage imageNamed:@"CIAccordionFoldTransition"];
     self.originImageView2.image =[UIImage imageNamed:@"CIAccordionFoldTransition_2x"];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    UIImage *image = [[UIImage alloc]init];
    UIImage *targetImage = [[UIImage alloc]init];
    
    image= [UIImage imageNamed:@"CICategoryTransition"];
    targetImage = [UIImage imageNamed:@"CICategoryTransition1"];
    
    if ([filterName isEqualToString:self.dataArray[0]]) {
        [filter setValue:@0.0 forKey:@"inputBottomHeight"];
        [filter setValue:@25.0 forKey:@"inputNumberOfFolds"];
        [filter setValue:@0.5 forKey:@"inputFoldShadowAmount"];
        [filter setValue:@0.5 forKey:@"inputTime"];
        image= [UIImage imageNamed:@"CIAccordionFoldTransition"];
        targetImage = [UIImage imageNamed:@"CIAccordionFoldTransition_2x"];
        
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        [filter setValue:@3.14 forKey:@"inputAngle"];
        [filter setValue:@25.0 forKey:@"inputWidth"];
        [filter setValue:@10.0 forKey:@"inputBarOffset"];
        [filter setValue:@0.5 forKey:@"inputTime"];
        image= [UIImage imageNamed:@"CIAccordionFoldTransition"];
        targetImage = [UIImage imageNamed:@"CIAccordionFoldTransition_2x"];
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:vector forKey:@"inputExtent"];
        [filter setValue:[CIColor colorWithCGColor:[UIColor greenColor].CGColor] forKey:@"inputColor"];
        [filter setValue:@0.50 forKey:@"inputTime"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@200.0 forKey:@"inputWidth"];
        [filter setValue:@1.30 forKey:@"inputOpacity"];
    }else if ([filterName isEqualToString:self.dataArray[3]]){
        UIImage *maskImage =[UIImage imageNamed:@"CIDisintegrateWithMaskTransition"];
        [filter setValue:[CIImage imageWithCGImage:maskImage.CGImage] forKey:@"inputMaskImage"];
        [filter setValue:@0.50 forKey:@"inputTime"];
        [filter setValue:@8.00 forKey:@"inputShadowRadius"];
        [filter setValue:@0.50 forKey:@"inputShadowDensity"];
        CIVector *centerVector = [[CIVector alloc]initWithX:0 Y:-10];
        [filter setValue:centerVector forKey:@"inputShadowOffset"];
        
    }else if ([filterName isEqualToString:self.dataArray[4]]){
        [filter setValue:@0.40 forKey:@"inputTime"];
    }else if ([filterName isEqualToString:self.dataArray[5]]){
        CIVector *centerVector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:centerVector forKey:@"inputExtent"];
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:vector forKey:@"inputExtent"];
        [filter setValue:[CIColor colorWithCGColor:[UIColor whiteColor].CGColor] forKey:@"inputColor"];
        [filter setValue:@0.70 forKey:@"inputTime"];
        [filter setValue:@2.58 forKey:@"inputMaxStriationRadius"];
        [filter setValue:@0.50 forKey:@"inputStriationStrength"];
        [filter setValue:@1.38 forKey:@"inputStriationContrast"];
        [filter setValue:@0.85 forKey:@"inputFadeThreshold"];
    }else if ([filterName isEqualToString:self.dataArray[6]]){
        CIVector *centerVector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:centerVector forKey:@"inputCenter"];
        [filter setValue:@0.80 forKey:@"inputTime"];
        [filter setValue:@2.0 forKey:@"inputAngle"];
        [filter setValue:@150.0 forKey:@"inputRadius"];
        [filter setValue:@300 forKey:@"inputCompression"];
    }else if ([filterName isEqualToString:self.dataArray[7]]){
         UIImage *inputBacksideImage =[UIImage imageNamed:@"CIDisintegrateWithMaskTransition"];
         UIImage *inputShadingImage =[UIImage imageNamed:@"CIDisintegrateWithMaskTransition"];
        [filter setValue:[CIImage imageWithCGImage:inputBacksideImage.CGImage] forKey:@"inputBacksideImage"];
        [filter setValue:[CIImage imageWithCGImage:inputShadingImage.CGImage] forKey:@"inputShadingImage"];
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:vector forKey:@"inputExtent"];
        [filter setValue:@0.50 forKey:@"inputTime"];
        [filter setValue:@100.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[8]]){
        UIImage *inputBacksideImage =[UIImage imageNamed:@"CIDisintegrateWithMaskTransition"];
        [filter setValue:[CIImage imageWithCGImage:inputBacksideImage.CGImage] forKey:@"inputBacksideImage"];
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 0, 0)];
        [filter setValue:vector forKey:@"inputExtent"];
        [filter setValue:@0.50 forKey:@"inputTime"];
        [filter setValue:@3.14 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputRadius"];
        [filter setValue:@0.5 forKey:@"inputShadowSize"];
        [filter setValue:@0.70 forKey:@"inputShadowAmount"];
        CIVector *inputShadowExtent = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 0, 0)];
        [filter setValue:inputShadowExtent forKey:@"inputShadowExtent"];
    }else if ([filterName isEqualToString:self.dataArray[9]]){
        UIImage *inputShadingImage =[UIImage imageNamed:@"CIDisintegrateWithMaskTransition"];
        [filter setValue:[CIImage imageWithCGImage:inputShadingImage.CGImage] forKey:@"inputShadingImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.50 forKey:@"inputTime"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
        [filter setValue:@50.0 forKey:@"inputScale"];
        CIVector *inputExtent = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:inputExtent forKey:@"inputExtent"];
    }else if ([filterName isEqualToString:self.dataArray[10]]){
        CIVector *inputExtent = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:inputExtent forKey:@"inputExtent"];
        [filter setValue:[CIColor colorWithCGColor:[UIColor greenColor].CGColor] forKey:@"inputColor"];
        [filter setValue:@0.80 forKey:@"inputTime"];
        [filter setValue:@300.0 forKey:@"inputWidth"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@0.0 forKey:@"inputOpacity"];
       
    }
    
    self.originImageView.image = image;
    self.originImageView2.image = targetImage;
    [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
    [filter setValue:[CIImage imageWithCGImage:targetImage.CGImage] forKey:@"inputTargetImage"];
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
