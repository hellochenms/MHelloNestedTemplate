//
//  TitleLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NodeLayout.h"

@interface TitleLayout : NodeLayout
@property (nonatomic) CGRect titleFrame;
@property (nonatomic) CGRect unFoldFrame;
+ (UIFont *)titleFont;
+ (NSInteger)titleMaxLineCount;
@end
