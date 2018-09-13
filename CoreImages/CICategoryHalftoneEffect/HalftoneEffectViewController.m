//
//  HalftoneEffectViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/12.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "HalftoneEffectViewController.h"

@interface HalftoneEffectViewController ()

@end

@implementation HalftoneEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originImageView.image = [UIImage imageNamed:self.filterName];
    self.originImageView2.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    UIImage *image = [UIImage imageNamed:self.dataArray[0]];
    CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
    [filter setValue:vector forKey:@"inputCenter"];
    [filter setValue:@20.0 forKey:@"inputWidth"];
    [filter setValue:@0.7 forKey:@"inputSharpness"];
    if ([filterName isEqualToString:self.dataArray[0]]) {
        
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        image = [UIImage imageNamed:self.dataArray[1]];
        [filter setValue:@0.00 forKey:@"inputAngle"];
         [filter setValue:@1.00 forKey:@"inputGCR"];
         [filter setValue:@0.50 forKey:@"inputUCR"];
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        image = [UIImage imageNamed:self.dataArray[1]];
        [filter setValue:@0.00 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:self.dataArray[3]]){
        [filter setValue:@5.00 forKey:@"inputAngle"];
    }else if ([filterName isEqualToString:self.dataArray[4]]){
        [filter setValue:@10.00 forKey:@"inputAngle"];
    }
    [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
    
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
