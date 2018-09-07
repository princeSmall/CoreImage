//
//  CompositeOperationViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/7.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "CompositeOperationViewController.h"

@interface CompositeOperationViewController ()

@end

@implementation CompositeOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originImageView.image = [UIImage imageNamed:@"inputComposite.png"];
    self.imageView.image = [UIImage imageNamed:@"backComposite.png"];
    self.originImageView2.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}
- (CIImage *)applyFilterChain:(NSString *)filterName{

    UIImage *inputComposite = [UIImage imageNamed:@"inputComposite.png"];
    CIImage *inputCIImage = [CIImage imageWithCGImage:inputComposite.CGImage];
    
    UIImage *backComposite = [UIImage imageNamed:@"backComposite.png"];
    CIImage *backCIImage = [CIImage imageWithCGImage:backComposite.CGImage];
    
    //创建一个滤镜
    CIFilter *filter =[CIFilter filterWithName:filterName];
    //设置滤镜的属性
    [filter setValue:inputCIImage forKey:kCIInputImageKey];
    [filter setValue:backCIImage forKey:kCIInputBackgroundImageKey];
    
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
