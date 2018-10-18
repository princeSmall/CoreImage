//
//  GradientViewController.m
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "GradientViewController.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = [UIColor greenColor];
    [filter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor0"];
    [filter setValue:[CIColor colorWithCGColor:color2.CGColor] forKey:@"inputColor1"];
    if ([filterName isEqualToString:self.dataArray[0]]) {
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@280 forKey:@"inputRadius"];
    }else if ([filterName isEqualToString:self.dataArray[1]] || [filterName isEqualToString:self.dataArray[3]]){
        CIVector *vector1 = [[CIVector alloc]initWithX:0 Y:0];
        CIVector *vector2 = [[CIVector alloc]initWithX:200 Y:200];
        [filter setValue:vector1 forKey:@"inputPoint0"];
        [filter setValue:vector2 forKey:@"inputPoint1"];
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@5 forKey:@"inputRadius0"];
        [filter setValue:@100 forKey:@"inputRadius1"];
    }
    CIImage *ciimage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciimage fromRect:CGRectMake(0, 0, 200, 200)];
    CIImage *ciimages = [[CIImage alloc]initWithCGImage:cgImage];
    return ciimages;
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
