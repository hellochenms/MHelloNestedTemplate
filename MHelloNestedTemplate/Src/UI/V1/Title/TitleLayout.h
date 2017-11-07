//
//  TitleLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Layout.h"

@interface TitleLayout : Layout
@property (nonatomic) CGRect titleFrame;
+ (UIFont *)titleFont;
+ (NSInteger)titleMaxLineCount;
@end
