//
//  SharpenViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/12.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "SharpenViewController.h"

@interface SharpenViewController ()

@end

@implementation SharpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    self.originImageView.image = [UIImage imageNamed:@"CICategorySharpen"];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    CIImage *ciimage = [CIImage imageWithCGImage:[UIImage imageNamed:@"CICategorySharpen"].CGImage];
    [filter setValue:ciimage forKey:@"inputImage"];
    if ([filterName isEqualToString:self.dataArray[0]]) {
        [filter setValue:@0.4f forKey:@"inputSharpness"];
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        [filter setValue:@2.5f forKey:@"inputRadius"];
        [filter setValue:@0.5f forKey:@"inputIntensity"];
    }
    return filter.outputImage;
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
