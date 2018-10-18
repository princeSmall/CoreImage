//
//  CoreImageModel.h
//  CoreImages
//
//  Created by iOS on 2018/9/12.
//  Copyright © 2018年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreImageModel : NSObject
@property (nonatomic ,strong)NSArray *mainArray;
@property (nonatomic ,strong)NSArray *blurArray;
@property (nonatomic ,strong)NSArray *colorAdjustmentArray;
@property (nonatomic ,strong)NSArray *colorEffextArray;
@property (nonatomic ,strong)NSArray *compositeArray;
@property (nonatomic ,strong)NSArray *distortionEffect;
@property (nonatomic ,strong)NSArray *generatorArray;
@property (nonatomic ,strong)NSArray *GeometryAdjustmentArray;
@property (nonatomic ,strong)NSArray *gradientArray;
@property (nonatomic ,strong)NSArray *HalftoneEffectArray;
@property (nonatomic ,strong)NSArray *ReductionArray;
@property (nonatomic ,strong)NSArray *SharpenArray;
@property (nonatomic ,strong)NSArray *StylizeArray;
@property (nonatomic ,strong)NSArray *TileEffectArray;
@property (nonatomic ,strong)NSArray *TransitionArray;

@property (nonatomic ,assign) BOOL isFold;
@end
