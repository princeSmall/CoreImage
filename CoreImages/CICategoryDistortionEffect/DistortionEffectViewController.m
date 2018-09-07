//
//  DistortionEffectViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/7.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "DistortionEffectViewController.h"

@interface DistortionEffectViewController ()

@end

@implementation DistortionEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originImageView.image = [UIImage imageNamed:@"CIBumpDistortion.png"];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    
    UIImage *inputComposite = [UIImage imageNamed:@"CIBumpDistortion.png"];
    //创建一个滤镜
    CIFilter *filter =[CIFilter filterWithName:filterName];
    //设置滤镜的属性
    if ([filterName isEqualToString:self.dataArray[0]] ||[filterName isEqualToString:self.dataArray[10]]) {
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@300 forKey:@"inputRadius"];
        [filter setValue:@0.5 forKey:@"inputScale"];
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        inputComposite = [UIImage imageNamed:@"CIBumpDistortionLinear.png"];
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(300, 300)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@300 forKey:@"inputRadius"];
        [filter setValue:@0.5 forKey:@"inputScale"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:self.dataArray[2]] || [filterName isEqualToString:self.dataArray[8]]){
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@150 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[3]]){
        inputComposite = [UIImage imageNamed:@"CICircularWrap.png"];
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@150 forKey:@"inputRadius"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:self.dataArray[4]]){
 //        TODO
        inputComposite = [UIImage imageNamed:@"CIDroste.png"];
        CIVector *inputInsetPoint0 = [[CIVector alloc]initWithCGPoint:CGPointMake(200, 200)];
        CIVector *inputInsetPoint1 = [[CIVector alloc]initWithCGPoint:CGPointMake(400, 400)];
        [filter setValue:inputInsetPoint0 forKey:@"inputInsetPoint0"];
        [filter setValue:inputInsetPoint1 forKey:@"inputInsetPoint1"];
        [filter setValue:@1 forKey:@"inputStrands"];
        [filter setValue:@0.0 forKey:@"inputRotation"];
        [filter setValue:@1 forKey:@"inputPeriodicity"];
        [filter setValue:@1.0 forKey:@"inputZoom"];
    }else if ([filterName isEqualToString:self.dataArray[5]]){
        UIImage *inputDisplacementImage = [UIImage imageNamed:@"inputComposite.png"];
        [filter setValue:[CIImage imageWithCGImage:inputDisplacementImage.CGImage] forKey:@"inputDisplacementImage"];
        [filter setValue:@50 forKey:@"inputScale"];
    }else if ([filterName isEqualToString:self.dataArray[6]]){
       inputComposite = [UIImage imageNamed:@"CIGlassDistortion.png"];
        return nil;
    }
    else if ([filterName isEqualToString:self.dataArray[7]]){
        inputComposite = [UIImage imageNamed:@"CIGlassDistortion.png"];
        CIVector *inputInsetPoint0 = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        CIVector *inputInsetPoint1 = [[CIVector alloc]initWithCGPoint:CGPointMake(350, 150)];
        [filter setValue:inputInsetPoint0 forKey:@"inputPoint0"];
        [filter setValue:inputInsetPoint1 forKey:@"inputPoint1"];
        [filter setValue:@100 forKey:@"inputRadius"];
        [filter setValue:@1.7 forKey:@"inputRefraction"];
    }else if ([filterName isEqualToString:self.dataArray[9]]){
//        TODO
        inputComposite = [UIImage imageNamed:@"CIDroste.png"];
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.00 forKey:@"inputRadius"];
        [filter setValue:@0.00 forKey:@"inputRotation"];
    }else if ([filterName isEqualToString:self.dataArray[11]]){
         return  [CIImage imageWithCGImage:inputComposite.CGImage];
    }
    else if ([filterName isEqualToString:self.dataArray[12]]){
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@160.0 forKey:@"inputRadius"];
        [filter setValue:@80.0 forKey:@"inputWidth"];
        [filter setValue:@1.70 forKey:@"inputRefraction"];
    }else if ([filterName isEqualToString:self.dataArray[13]]){
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@300 forKey:@"inputRadius"];
        [filter setValue:@3.14 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:self.dataArray[14]]){
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@300 forKey:@"inputRadius"];
        [filter setValue:@56.55 forKey:@"inputAngle"];
    }
    self.originImageView.image = inputComposite;
    CIImage *inputCIImage = [CIImage imageWithCGImage:inputComposite.CGImage];
    [filter setValue:inputCIImage forKey:kCIInputImageKey];
    // 输出滤镜结果
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
