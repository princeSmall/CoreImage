//
//  TileEffectViewController.m
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import "TileEffectViewController.h"

@interface TileEffectViewController ()

@end

@implementation TileEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originImageView.image = [UIImage imageNamed:@"CIAffineClamp"];
    self.imageView.image = [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    // Do any additional setup after loading the view.
}

/**
 形变transform
 对应的三维变换矩阵{ a , b , 0
                  c , d , 0
                  tx ,ty ,0
 }
 1、初始状态（1，0，0，1，0，0）
 2、平移（1，0，0，1，100，100）
 3、缩放（2，0，0，0.5，0，0）
 4、旋转（cos(M_PI * 0.5),sin(M_PI * 0.5),-sin(M_PI * 0.5),cos(M_PI * 0.5),0,0）

 @param filterName CICategory
 @return CIImage
 */
- (CIImage *)applyFilterChain:(NSString *)filterName{
    CIFilter *filter = [CIFilter filterWithName:filterName];
    if ([filterName isEqualToString:self.dataArray[0]]) {
        UIImage *image = [UIImage imageNamed:@"CIAffineClamp"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CGAffineTransform xform = CGAffineTransformMake(1.2, 0, 0, 1.2, 0, 0);
        [filter setValue:[NSValue valueWithBytes:&xform
                                        objCType:@encode(CGAffineTransform)]
                  forKey:@"inputTransform"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[1]]){
        UIImage *image = [UIImage imageNamed:@"CIAffineClamp"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CGAffineTransform xform = CGAffineTransformMake(0.2, 0, 0, 0.2, 0, 0);
        [filter setValue:[NSValue valueWithBytes:&xform
                                        objCType:@encode(CGAffineTransform)]
                  forKey:@"inputTransform"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[2]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[3]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
        [filter setValue:@1.57 forKey:@"inputAcuteAngle"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[4]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[5]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
        [filter setValue:@1.57 forKey:@"inputAcuteAngle"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[6]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[7]]){
        UIImage *image = [UIImage imageNamed:@"CIAffineClamp"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@6.0 forKey:@"inputCount"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[8]]){
        UIImage *image = [UIImage imageNamed:@"CIOpTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@65.0 forKey:@"inputWidth"];
         [filter setValue:@2.80 forKey:@"inputScale"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[9]]){
        UIImage *image = [UIImage imageNamed:@"CIAffineClamp"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
        [filter setValue:@1.57 forKey:@"inputAcuteAngle"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[10]]){
        UIImage *image = [UIImage imageNamed:@"CIPerspectiveTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *inputTopLeft = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputTopLeft forKey:@"inputTopLeft"];
        CIVector *inputTopRight = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputTopRight forKey:@"inputTopRight"];
        CIVector *inputBottomRight = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputBottomRight forKey:@"inputBottomRight"];
        CIVector *inputBottomLeft = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:inputBottomLeft forKey:@"inputBottomLeft"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[11]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[12]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[13]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputPoint"];
        [filter setValue:@700.0 forKey:@"inputSize"];
        [filter setValue:@-0.36 forKey:@"inputRotation"];
        [filter setValue:@0.85 forKey:@"inputDecay"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[14]]){
        UIImage *image = [UIImage imageNamed:@"CIAffineClamp"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }else if ([filterName isEqualToString:self.dataArray[15]]){
        UIImage *image = [UIImage imageNamed:@"CISixfoldReflectedTile"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputImage"];
        CIVector *vector = [[CIVector alloc]initWithX:150 Y:150];
        [filter setValue:vector forKey:@"inputCenter"];
        [filter setValue:@0.0 forKey:@"inputAngle"];
        [filter setValue:@100.0 forKey:@"inputWidth"];
         self.originImageView.image = image;
    }
    CIImage *ciimage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [context createCGImage:ciimage fromRect:CGRectMake(0, 0, 300, 300)];
    CIImage *outImage = [CIImage imageWithCGImage:imageRef];
    
    return outImage;
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
