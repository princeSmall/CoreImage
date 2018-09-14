//
//  ReductionViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/12.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ReductionViewController.h"

@interface ReductionViewController ()

@end

@implementation ReductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    self.originImageView.image = [UIImage imageNamed:@"CIHistogramDisplayFilter"];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    UIImage *image = [UIImage imageNamed:@"CIHistogramDisplayFilter"];
    [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
    if (![filterName isEqualToString:self.dataArray[4]]) {
        CIVector *vector = [[CIVector alloc]initWithCGRect:CGRectMake(0, 0, 576, 256)];
        [filter setValue:vector forKey:@"inputExtent"];
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        [filter setValue:@256 forKey:@"inputCount"];
        [filter setValue:@25.0 forKey:@"inputScale"];
    }else if ([filterName isEqualToString:self.dataArray[4]]){
        [filter setValue:@150 forKey:@"inputHeight"];
        [filter setValue:@1.0 forKey:@"inputHighLimit"];
        [filter setValue:@0.0 forKey:@"inputLowLimit"];
    }
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
