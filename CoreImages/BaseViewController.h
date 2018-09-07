//
//  ImageViewController.h
//  CoreImages
//
//  Created by le tong on 2018/9/6.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic ,strong)NSString *filterName;
@property (nonatomic ,strong)NSArray *dataArray;
@property (nonatomic ,strong)UIImageView *originImageView;
@property (nonatomic ,strong)UIImageView *originImageView2;
@property (nonatomic ,strong)UIImageView *imageView;
- (CIImage *)applyFilterChain:(NSString *)filterName;
@end
