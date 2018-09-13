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
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
        NSString *info = @"12937466464";
        NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
        [filter setValue:data forKey:@"inputMessage"];
    if ([filterName isEqualToString:@""]) {
         [filter setValue:@10 forKey:@"inputQuietSpace"];
    }else if ([filterName isEqualToString:@""]){
         [filter setValue:@"M" forKey:@"inputCorrectionLevel"];
    }
    CIImage *result = filter.outputImage;
    return result;
    
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
