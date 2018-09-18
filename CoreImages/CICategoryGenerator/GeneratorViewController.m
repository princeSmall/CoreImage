//
//  GeneratorViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/11.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "GeneratorViewController.h"

@interface GeneratorViewController ()

@end

@implementation GeneratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    
    if ([filterName isEqualToString:self.dataArray[0]]) {
        NSString *info = @"wx 1263512924";
        NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
        [filter setValue:data forKey:@"inputMessage"];
        [filter setValue:@10 forKey:@"inputQuietSpace"];
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        NSString *info = @"wx 1263512924";
        NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
        [filter setValue:data forKey:@"inputMessage"];
        [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        UIColor *color1 = [UIColor redColor];
        UIColor *color2 = [UIColor greenColor];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@80.0 forKey:@"inputWidth"];
        [filter setValue:@1.0 forKey:@"inputSharpness"];
        [filter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor0"];
        [filter setValue:[CIColor colorWithCGColor:color2.CGColor] forKey:@"inputColor1"];

    }
    CIImage *result = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:CGRectMake(0, 0, 300, 300)];
    CIImage *ciimage = [CIImage imageWithCGImage:cgImage];
    return filterName == self.dataArray[2] ?  ciimage : result;
    
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
