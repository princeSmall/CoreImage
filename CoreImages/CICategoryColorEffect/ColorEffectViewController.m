//
//  ColorEffectViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/7.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ColorEffectViewController.h"
@interface ColorEffectViewController ()
@property (nonatomic ,strong)NSArray *ciphotoArray;

@end

@implementation ColorEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *originImage = [UIImage imageNamed:@"image.jpg"];
    self.originImageView.image = originImage;
    self.imageView.image =  [UIImage imageWithCIImage:[self applyFilterChain:self.filterName]];
    
    // Do any additional setup after loading the view.
}

- (CIImage *)applyFilterChain:(NSString *)filterName{
    UIImage *originImage = [UIImage imageNamed:@"image.jpg"];
    CIImage *ciimage = [CIImage imageWithCGImage:originImage.CGImage];
    //创建一个滤镜
    CIFilter *filter =[CIFilter filterWithName:filterName];
    //设置滤镜的属性
    [filter setValue:ciimage forKey:kCIInputImageKey];
    if ([filterName isEqualToString:@"CIVignetteEffect"]) {
        CIVector *vector = [[CIVector alloc]initWithCGPoint:CGPointMake(150, 150)];
        [filter setValue:vector forKey:@"inputCenter"];
//       default 0
        [filter setValue:@0.00 forKey:@"inputRadius"];
//       default 0 - 1
        [filter setValue:@0.5 forKey:@"inputIntensity"];
    }else if ([filterName isEqualToString:@"CIVignette"]){
//       default 1.0
        [filter setValue:@1.00 forKey:@"inputRadius"];
//       default 0
        [filter setValue:@0.0 forKey:@"inputIntensity"];
    }else if ([filterName isEqualToString:@"CISepiaTone"]){
//       default 1
        [filter setValue:@1.0 forKey:@"inputIntensity"];
    }else if ([filterName isEqualToString:@"CIFalseColor"]){
        UIColor *color1 = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0];
        UIColor *color2 = [UIColor colorWithRed:0.0 green:1.0 blue:0 alpha:1.0];
        [filter setValue:[CIColor colorWithCGColor:color1.CGColor] forKey:@"inputColor0"];
        [filter setValue:[CIColor colorWithCGColor:color2.CGColor] forKey:@"inputColor1"];
    }else if ([filterName isEqualToString:@"CIColorPosterize"]){
        [filter setValue:@6.0 forKey:@"inputLevels"];
    }else if ([filterName isEqualToString:@"CIColorMonochrome"]){
//       default 1
        [filter setValue:@1.0 forKey:@"inputIntensity"];
        UIColor *color = [UIColor colorWithRed:0.0 green:1.0 blue:0 alpha:1.0];
        [filter setValue:[CIColor colorWithCGColor:color.CGColor] forKey:@"inputColor"];
    }else if ([filterName isEqualToString:@"CIColorMap"]){
        UIImage *image = [UIImage imageNamed:@"images.jpg"];
        [filter setValue:[CIImage imageWithCGImage:image.CGImage] forKey:@"inputGradientImage"];
    }else if ([filterName isEqualToString:@"CIColorCube"] ||[filterName isEqualToString:@"CIColorCubeWithColorSpace"] ){
        // Allocate memory
        const unsigned int size = 64;
        float *cubeData = (float *)malloc (size * size * size * sizeof (float) * 4);
        int cubeDataSize =  size * size * size * (sizeof(float)) * 4;
        float rgb[3], *c = cubeData;
        
        
        // Populate cube with a simple gradient going from 0 to 1
        for (int z = 0; z < size; z++){
            rgb[2] = ((double)z)/(size-1); // Blue value
            for (int y = 0; y < size; y++){
                rgb[1] = ((double)y)/(size-1); // Green value
                for (int x = 0; x < size; x ++){
                    rgb[0] = ((double)x)/(size-1); // Red value
                    float alpha =  1.0f;
                    // Calculate premultiplied alpha values for the cube
                    c[0] = 1 * alpha;
                    c[1] = rgb[0] * alpha;
                    c[2] = rgb[2] * alpha;
                    c[3] = alpha;
                    
                    c += 4; // advance our pointer into memory for the next color value
                }
            }
        }
        
        
        // Create memory with the cube data
        NSData *data = [NSData dataWithBytesNoCopy:cubeData
                                            length:cubeDataSize
                                      freeWhenDone:YES];
        
        [filter setValue:@(size) forKey:@"inputCubeDimension"];
        // Set data for cube
        [filter setValue:data forKey:@"inputCubeData"];
        if ([filterName isEqualToString:@"CIColorCubeWithColorSpace"] ) {
            CGColorSpaceRef spaceRef = CGColorSpaceCreateDeviceRGB ();
            [filter setValue:(__bridge id _Nullable)(spaceRef) forKey:@"inputColorSpace"];
            CGColorSpaceRelease(spaceRef);
        }
    }else if ([filterName isEqualToString:@"CIColorCrossPolynomial"]){
        float RedCoefficients[10] = {1,0,0,0,0,0,0,0,0,0};
        float GreenCoefficients[10] = {0,1,0,0,0,0,0,0,0,0};
        float BlueCoefficients[10] = {0,0,1,0,0,0,0,0,0,0};
        CIVector *inputRedCoefficients = [[CIVector alloc]initWithValues:(CGFloat*)RedCoefficients count:10];
        CIVector *inputGreenCoefficients = [[CIVector alloc]initWithValues:(CGFloat*)GreenCoefficients count:10];
        CIVector *inputBlueCoefficients = [[CIVector alloc]initWithValues:(CGFloat*)BlueCoefficients count:10];
        [filter setValue:inputRedCoefficients forKey:@"inputRedCoefficients"];
        [filter setValue:inputGreenCoefficients forKey:@"inputGreenCoefficients"];
        [filter setValue:inputBlueCoefficients forKey:@"inputBlueCoefficients"];
        
    }
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
