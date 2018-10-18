//
//  GeometryAdjustmentViewController.m
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "GeometryAdjustmentViewController.h"

@interface GeometryAdjustmentViewController ()

@end

@implementation GeometryAdjustmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_2x",filterName]];
    self.originImageView.image = image;
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    if ([filterName isEqualToString:self.dataArray[0]]) {
        CGAffineTransform xform = CGAffineTransformMake(1.0, 0.5, 0.5, 1.0, 0, 0);
        [filter setValue:[NSValue valueWithBytes:&xform
                                          objCType:@encode(CGAffineTransform)]
                    forKey:@"inputTransform"];
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 100, 100)];
        [filter setValue:vector forKey:@"inputRectangle"];
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        [filter setValue:@1.0 forKey:@"inputScale"];
        [filter setValue:@1.0 forKey:@"inputAspectRatio"];
    }else if ([filterName isEqualToString:self.dataArray[3]] || [filterName isEqualToString:self.dataArray[4]] ){
        CIVector *inputTopLeft = [[CIVector alloc]initWithCGPoint:CGPointMake(118, 484)];
        CIVector *inputTopRight = [[CIVector alloc]initWithCGPoint:CGPointMake(646, 507)];
        CIVector *inputBottomRight = [[CIVector alloc]initWithCGPoint:CGPointMake(548, 140)];
        CIVector *inputBottomLeft = [[CIVector alloc]initWithCGPoint:CGPointMake(155, 153)];
        [filter setValue:inputTopLeft forKey:@"inputTopLeft"];
        [filter setValue:inputTopRight forKey:@"inputTopRight"];
        [filter setValue:inputBottomRight forKey:@"inputBottomRight"];
        [filter setValue:inputBottomLeft forKey:@"inputBottomLeft"];
    }else if ([filterName isEqualToString:self.dataArray[5]]){
        
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 300, 300)];
        [filter setValue:vector forKey:@"inputExtent"];
        CIVector *inputTopLeft = [[CIVector alloc]initWithCGPoint:CGPointMake(118, 484)];
        CIVector *inputTopRight = [[CIVector alloc]initWithCGPoint:CGPointMake(646, 507)];
        CIVector *inputBottomRight = [[CIVector alloc]initWithCGPoint:CGPointMake(548, 140)];
        CIVector *inputBottomLeft = [[CIVector alloc]initWithCGPoint:CGPointMake(155, 153)];
        [filter setValue:inputTopLeft forKey:@"inputTopLeft"];
        [filter setValue:inputTopRight forKey:@"inputTopRight"];
        [filter setValue:inputBottomRight forKey:@"inputBottomRight"];
        [filter setValue:inputBottomLeft forKey:@"inputBottomLeft"];
    }else if ([filterName isEqualToString:self.dataArray[6]]){
        [filter setValue:@180 forKey:@"inputAngle"];
    }
   
    [filter setValue:ciImage forKey:@"inputImage"];
    
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
