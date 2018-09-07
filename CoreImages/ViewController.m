//
//  ViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/6.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ViewController.h"
#import "BaseViewController.h"
#import "BlurViewController.h"
#import "ColorAdjustmentViewController.h"
#import "ColorEffectViewController.h"
#import "CompositeOperationViewController.h"
#import "DistortionEffectViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSArray *mainArray;

@property (nonatomic ,strong)NSArray *blurArray;
@property (nonatomic ,strong)NSArray *colorAdjustmentArray;
@property (nonatomic ,strong)NSArray *colorEffextArray;
@property (nonatomic ,strong)NSArray *compositeArray;
@property (nonatomic ,strong)NSArray *distortionEffect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (NSArray *)blurArray{
    if (!_blurArray) {
        _blurArray = [NSArray arrayWithObjects:@"CIBoxBlur",@"CIDiscBlur",@"CIGaussianBlur",@"CIMaskedVariableBlur",@"CIMedianFilter",@"CIMotionBlur",@"CINoiseReduction",@"CIZoomBlur", nil];
    }
    return _blurArray;
}
- (NSArray *)colorAdjustmentArray{
    if (!_colorAdjustmentArray) {
        _colorAdjustmentArray = [NSArray arrayWithObjects:@"CIColorClamp",@"CIColorControls",@"CIColorMatrix",@"CIColorPolynomial",@"CIExposureAdjust",@"CIGammaAdjust",@"CIHueAdjust",@"CILinearToSRGBToneCurve",@"CISRGBToneCurveToLinear",@"CITemperatureAndTint",@"CIToneCurve",@"CIVibrance",@"CIWhitePointAdjust", nil];
    }
    return _colorAdjustmentArray;
}
- (NSArray *)colorEffextArray{
    if (!_colorEffextArray) {
        _colorEffextArray = [NSArray arrayWithObjects:@"CIColorCrossPolynomial",@"CIColorCube",@"CIColorCubeWithColorSpace",@"CIColorInvert",@"CIColorMap",@"CIColorMonochrome",@"CIColorPosterize",@"CIFalseColor",@"CIMaskToAlpha",@"CIMaximumComponent",@"CIMinimumComponent",@"CIPhotoEffectChrome",@"CIPhotoEffectFade",@"CIPhotoEffectInstant",@"CIPhotoEffectMono",@"CIPhotoEffectNoir",@"CIPhotoEffectProcess",@"CIPhotoEffectTonal",@"CIPhotoEffectTransfer",@"CISepiaTone",@"CIVignette",@"CIVignetteEffect", nil];
    }
    return _colorEffextArray;
}
- (NSArray *)compositeArray{
    if (!_compositeArray) {
        _compositeArray = [[NSArray alloc]initWithObjects:@"CIAdditionCompositing",@"CIColorBlendMode",@"CIColorBurnBlendMode",@"CIColorDodgeBlendMode",@"CIDarkenBlendMode",@"CIDifferenceBlendMode",@"CIDivideBlendMode",@"CIExclusionBlendMode",@"CIHardLightBlendMode",@"CIHueBlendMode",@"CILightenBlendMode",@"CILinearBurnBlendMode",@"CILinearDodgeBlendMode",@"CILuminosityBlendMode",@"CIMaximumCompositing",@"CIMinimumCompositing",@"CIMultiplyBlendMode",@"CIMultiplyCompositing",@"CIOverlayBlendMode",@"CIPinLightBlendMode",@"CISaturationBlendMode",@"CIScreenBlendMode",@"CISoftLightBlendMode",@"CISourceAtopCompositing",@"CISourceInCompositing",@"CISourceOutCompositing",@"CISourceOverCompositing",@"CISubtractBlendMode", nil];
    }
    return _compositeArray;
}
- (NSArray *)distortionEffect{
    if (!_distortionEffect) {
        _distortionEffect = [[NSArray alloc]initWithObjects:@"CIBumpDistortion",@"CIBumpDistortionLinear",@"CICircleSplashDistortion",@"CICircularWrap",@"CIDroste",@"CIDisplacementDistortion",@"CIGlassDistortion",@"CIGlassLozenge",@"CIHoleDistortion",@"CILightTunnel",@"CIPinchDistortion",@"CIStretchCrop",@"CITorusLensDistortion",@"CITwirlDistortion",@"CIVortexDistortion", nil];
    }
    return _distortionEffect;
}
- (NSArray *)mainArray{
    if (!_mainArray) {
        _mainArray = [NSArray arrayWithObjects:@"CICategoryBlur",@"CICategoryColorAdjustment",@"CICategoryColorEffect",@"CICategoryCompositeOperation",@"CICategoryDistortionEffect", nil];
    }
    return _mainArray;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.mainArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    switch (section) {
        case 0:
            count = self.blurArray.count;
            break;
        case 1:
            count = self.colorAdjustmentArray.count;
            break;
            case 2:
            count = self.colorEffextArray.count;
            break;
            case 3:
            count = self.compositeArray.count;
            break;
            case 4:
            count = self.distortionEffect.count;
            break;
        default:
            break;
    }
    return count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *headBtn = [[UIButton alloc]initWithFrame:self.tableView.tableHeaderView.bounds];
    [headBtn setTitle:self.mainArray[section] forState:UIControlStateNormal];
    [headBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return headBtn;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIndentifier"];
    NSString *str;
    NSInteger s = indexPath.section;
    NSInteger r = indexPath.row;
    switch (s) {
        case 0:
            str = self.blurArray[r];
            break;
        case 1:
            str = self.colorAdjustmentArray[r];
            break;
            case 2:
            str = self.colorEffextArray[r];
            break;
            case 3:
            str = self.compositeArray[r];
            break;
            case 4:
            str = self.distortionEffect[r];
            break;
        default:
            break;
    }
    cell.textLabel.text = str;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vc;
    NSInteger s = indexPath.section;
    NSInteger r = indexPath.row;
    if (s == 0) {
        BlurViewController *blurVC = [[BlurViewController alloc]init];
        blurVC.filterName = self.blurArray[r];
        vc = blurVC;
    }else if (s == 1){
        ColorAdjustmentViewController *colorAdjustmentVC = [[ColorAdjustmentViewController alloc]init];
        colorAdjustmentVC.filterName = self.colorAdjustmentArray[r];
        vc = colorAdjustmentVC;
    }else if (s == 2){
        ColorEffectViewController *colorEffectVC = [[ColorEffectViewController alloc]init];
        colorEffectVC.filterName = self.colorEffextArray[r];
        vc = colorEffectVC;
    }else if (s == 3){
        CompositeOperationViewController *compositeOperation = [[CompositeOperationViewController alloc]init];
        compositeOperation.filterName = self.compositeArray[r];
        compositeOperation.dataArray = self.compositeArray;
        vc = compositeOperation;
    }else if (s == 4){
        DistortionEffectViewController *distortionEffect = [[DistortionEffectViewController alloc]init];
        distortionEffect.filterName = self.distortionEffect[r];
        distortionEffect.dataArray = self.distortionEffect;
        vc = distortionEffect;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
