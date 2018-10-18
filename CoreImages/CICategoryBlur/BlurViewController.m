//
//  BlurViewController.m
//  CoreImages
//
//  Created by iOS on 2018/9/6.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "BlurViewController.h"
@interface BlurViewController ()

@end

@implementation BlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.originImageView.image = [UIImage imageNamed:@"image.jpg"];
    self.imageView.image =[UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}

- (CIImage *)applyFilterChain:(NSString *)filterName{
    UIImage *originImage = [UIImage imageNamed:@"image.jpg"];
    CIImage *ciimage = [CIImage imageWithCGImage:originImage.CGImage];
    //创建一个滤镜
    CIFilter *filter =[CIFilter filterWithName:filterName];
    //设置滤镜的属性
    [filter setValue:ciimage forKey:kCIInputImageKey];
    
    if ([filterName isEqualToString:@"CIBoxBlur"] || [filterName isEqualToString:@"CIGaussianBlur"]) {
        [filter setValue:@10.0 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString: @"CIDiscBlur"]){
        [filter setValue:@8.0 forKey:kCIInputRadiusKey];
    }else if ([filterName isEqualToString:@"CIMaskedVariableBlur"]){
        
        UIImage *inputMask = [UIImage imageNamed:@"images.jpg"];
        CIImage *ciinputMask = [CIImage imageWithCGImage:inputMask.CGImage];
        [filter setValue:ciinputMask forKey:@"inputMask"];
        [filter setValue:@80.0 forKey:kCIInputRadiusKey];
        
    }else if ([filterName isEqualToString:@"CIMotionBlur"]){
        [filter setValue:@20.0 forKey:kCIInputRadiusKey];
        [filter setValue:@0.0 forKey:kCIInputAngleKey];
    }else if ([filterName isEqualToString:@"CINoiseReduction"]){
        [filter setValue:@0.40 forKey:kCIInputSharpnessKey];
        [filter setValue:@0.02 forKey:@"inputNoiseLevel"];
    }else if ([filterName isEqualToString:@"CIZoomBlur"]){
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:kCIInputCenterKey];
        [filter setValue:@20.0 forKey:@"inputAmount"];
    }
    CIImage *ciImage = filter.outputImage;
    return ciImage;
    
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
