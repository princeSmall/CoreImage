//
//  ImageViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/6.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreImage/CoreImage.h>

@interface BaseViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong)UIPickerView *imagePickerView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imagePickerView];
    [self.view addSubview:self.originImageView];
    [self.view addSubview:self.originImageView2];
    [self.view addSubview:self.imageView];
    // Do any additional setup after loading the view.
}

- (CIImage *)applyFilterChain:(NSString *)filterName{
    return nil;
}

- (UIImageView *)originImageView{
    if (!_originImageView) {
        _originImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - 200, 100, 200, 200)];
    }
    return _originImageView;
}
- (UIImageView *)originImageView2{
    if (!_originImageView2) {
        _originImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - 100, 100, 200, 200)];
    }
    return _originImageView2;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - 100, 300, 200, 200)];
    }
    return _imageView;
}


- (UIPickerView *)imagePickerView{
    if (!_imagePickerView) {
        _imagePickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 500, self.view.frame.size.width, 200)];
        _imagePickerView.delegate = self;
        _imagePickerView.dataSource = self;
        _imagePickerView.backgroundColor = [UIColor grayColor];
        _imagePickerView.alpha = 0.7;
    }
    return _imagePickerView;
}
- (NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSArray alloc]init];
    }
    return _dataArray;
}
// 返回多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
// 返回每列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.dataArray.count;
}
// 返回每行的标题
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.imageView.image =  [UIImage imageWithCIImage:[self applyFilterChain:self.dataArray[row]]] ;
}

- (CGSize)rowSizeForComponent:(NSInteger)component{
    return CGSizeMake(self.view.frame.size.width, 40);
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
