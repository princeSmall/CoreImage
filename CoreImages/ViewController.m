//
//  ViewController.m
//  CoreImages
//
//  Created by le tong on 2018/9/6.
//  Copyright © 2018年 le tong. All rights reserved.
//

#import "ViewController.h"
#import "CoreImageModel.h"
#import "BaseViewController.h"
#import "BlurViewController.h"
#import "ColorAdjustmentViewController.h"
#import "ColorEffectViewController.h"
#import "CompositeOperationViewController.h"
#import "DistortionEffectViewController.h"
#import "GeneratorViewController.h"
#import "GeometryAdjustmentViewController.h"
#import "GradientViewController.h"
#import "HalftoneEffectViewController.h"
#import "ReductionViewController.h"
#import "SharpenViewController.h"
#import "StylizeViewController.h"
#import "TileEffectViewController.h"
#import "TransitionViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    BOOL isfold;
}
@property(nonatomic ,strong)UITableView *tableView;
@property(nonatomic ,strong)CoreImageModel *model;
@property (nonatomic,strong)NSMutableDictionary * foldDictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.foldDictionary = [NSMutableDictionary dictionary];
    self.title = @"Filtes";
    for (int i = 0 ; i < self.model.mainArray.count; i ++) {
        [self.foldDictionary setValue:@1 forKey:[NSString stringWithFormat:@"%d",i]];
    }
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
- (CoreImageModel *)model{
    if (!_model) {
        _model = [[CoreImageModel alloc]init];
    }
    return _model;
}

- (void)foldBtn:(UIButton *)sender{
    NSString *key = [NSString stringWithFormat:@"%d",(int)sender.tag];
    BOOL fold =[[ self.foldDictionary objectForKey:key]boolValue];
    NSString * foldString = fold ? @"0" : @"1";
    [self.foldDictionary setValue:foldString forKey:key];
    NSMutableIndexSet *set = [NSMutableIndexSet indexSetWithIndex:(int)sender.tag];
    [self.tableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.mainArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    NSString * key = [NSString stringWithFormat:@"%ld",(long)section];
    BOOL fold = [[self.foldDictionary objectForKey:key]boolValue];
    
    switch (section) {
        case 0:
            count = fold ? 0 : self.model.blurArray.count;
            break;
        case 1:
            count = fold ? 0 : self.model.colorAdjustmentArray.count;
            break;
        case 2:
            count = fold ? 0 : self.model.colorEffextArray.count;
            break;
        case 3:
            count = fold ? 0 : self.model.compositeArray.count;
            break;
        case 4:
            count = fold ? 0 : self.model.distortionEffect.count;
            break;
        case 5:
            count = fold ? 0 : self.model.generatorArray.count;
            break;
        case 6:
            count = fold ? 0 : self.model.GeometryAdjustmentArray.count;
            break;
        case 7:
            count = fold ? 0 : self.model.gradientArray.count;
            break;
        case 8:
            count = fold ? 0 : self.model.HalftoneEffectArray.count;
            break;
        case 9:
            count = fold ? 0 : self.model.ReductionArray.count;
            break;
        case 10:
            count = fold ? 0 : self.model.SharpenArray.count;
            break;
        case 11:
            count = fold ? 0 : self.model.StylizeArray.count;
            break;
        case 12:
            count = fold ? 0 : self.model.TileEffectArray.count;
            break;
        case 13:
            count = fold ? 0 : self.model.TransitionArray.count;
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
    [headBtn setBackgroundColor:[UIColor whiteColor]];
    [headBtn setTitle:self.model.mainArray[section] forState:UIControlStateNormal];
    [headBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    headBtn.tag = section;
    [headBtn addTarget:self action:@selector(foldBtn:) forControlEvents:UIControlEventTouchUpInside];
    return headBtn;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellIndentifier"];
    NSString *str;
    NSInteger s = indexPath.section;
    NSInteger r = indexPath.row;
    switch (s) {
        case 0:
            str = self.model.blurArray[r];
            break;
        case 1:
            str = self.model.colorAdjustmentArray[r];
            break;
        case 2:
            str = self.model.colorEffextArray[r];
            break;
        case 3:
            str = self.model.compositeArray[r];
            break;
        case 4:
            str = self.model.distortionEffect[r];
            break;
        case 5:
            str = self.model.generatorArray[r];
            break;
        case 6:
            str = self.model.GeometryAdjustmentArray[r];
            break;
        case 7:
            str = self.model.gradientArray[r];
            break;
        case 8:
            str = self.model.HalftoneEffectArray[r];
            break;
        case 9:
            str = self.model.ReductionArray[r];
            break;
        case 10:
            str = self.model.SharpenArray[r];
            break;
        case 11:
            str = self.model.StylizeArray[r];
            break;
        case 12:
            str = self.model.TileEffectArray[r];
            break;
        case 13:
            str = self.model.TransitionArray[r];
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
        blurVC.filterName = self.model.blurArray[r];
        vc = blurVC;
    }else if (s == 1){
        ColorAdjustmentViewController *colorAdjustmentVC = [[ColorAdjustmentViewController alloc]init];
        colorAdjustmentVC.filterName = self.model.colorAdjustmentArray[r];
        vc = colorAdjustmentVC;
    }else if (s == 2){
        ColorEffectViewController *colorEffectVC = [[ColorEffectViewController alloc]init];
        colorEffectVC.filterName = self.model.colorEffextArray[r];
        vc = colorEffectVC;
    }else if (s == 3){
        CompositeOperationViewController *compositeOperation = [[CompositeOperationViewController alloc]init];
        compositeOperation.filterName = self.model.compositeArray[r];
        compositeOperation.dataArray = self.model.compositeArray;
        vc = compositeOperation;
    }else if (s == 4){
        DistortionEffectViewController *distortionEffect = [[DistortionEffectViewController alloc]init];
        distortionEffect.filterName = self.model.distortionEffect[r];
        distortionEffect.dataArray = self.model.distortionEffect;
        vc = distortionEffect;
    }else if (s == 5){
        GeneratorViewController *generatorVC = [[GeneratorViewController alloc]init];
        generatorVC.filterName = self.model.generatorArray[r];
        generatorVC.dataArray = self.model.generatorArray;
        vc = generatorVC;
    }else if (s == 6){
        GeometryAdjustmentViewController *geometryVC = [[GeometryAdjustmentViewController alloc]init];
        geometryVC.filterName = self.model.GeometryAdjustmentArray[r];
        geometryVC.dataArray = self.model.GeometryAdjustmentArray;
        vc = geometryVC;
    }else if (s == 7){
        GradientViewController *gradientVC = [[GradientViewController alloc]init];
        gradientVC.filterName = self.model.gradientArray[r];
        gradientVC.dataArray = self.model.gradientArray;
        vc = gradientVC;
    }else if (s == 8){
        HalftoneEffectViewController *halftoneEffectVC = [[HalftoneEffectViewController alloc]init];
        halftoneEffectVC.filterName = self.model.HalftoneEffectArray[r];
        halftoneEffectVC.dataArray = self.model.HalftoneEffectArray;
        vc = halftoneEffectVC;
    }else if (s == 9){
        ReductionViewController *reductionVC = [[ReductionViewController alloc]init];
        reductionVC.filterName = self.model.ReductionArray[r];
        reductionVC.dataArray = self.model.ReductionArray;
        vc = reductionVC;
    }else if (s == 10){
        SharpenViewController *sharpenVC = [[SharpenViewController alloc]init];
        sharpenVC.filterName = self.model.SharpenArray[r];
        sharpenVC.dataArray = self.model.SharpenArray;
        vc = sharpenVC;
    }else if (s == 11){
        StylizeViewController *stylizeVC = [[StylizeViewController alloc]init];
        stylizeVC.filterName = self.model.StylizeArray[r];
        stylizeVC.dataArray = self.model.StylizeArray;
        vc = stylizeVC;
    }else if (s == 12){
        TileEffectViewController *tileEffectVC = [[TileEffectViewController alloc]init];
        tileEffectVC.filterName = self.model.TileEffectArray[r];
        tileEffectVC.dataArray = self.model.TileEffectArray;
        vc = tileEffectVC;
    }else if (s == 13){
        TransitionViewController *transitionVC = [[TransitionViewController alloc]init];
        transitionVC.filterName = self.model.TransitionArray[r];
        transitionVC.dataArray = self.model.TransitionArray;
        vc = transitionVC;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
