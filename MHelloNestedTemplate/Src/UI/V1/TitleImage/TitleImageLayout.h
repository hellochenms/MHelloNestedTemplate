//
//  TitleImageLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Layout.h"

@interface TitleImageLayout : Layout
@property (nonatomic) CGRect titleFrame;
@property (nonatomic) CGRect imageFrame;
+ (UIFont *)titleFont;
+ (NSInteger)titleMaxLineCount;
@end
