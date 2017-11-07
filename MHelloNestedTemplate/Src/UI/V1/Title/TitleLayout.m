//
//  TitleLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleLayout.h"
#import "NSString+M2Size.h"

@implementation TitleLayout
- (void)calcForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    
    double height = [news.title m2_heightForFont:[[self class] titleFont]
                                        maxWidth:width
                                    maxLineCount:[[self class] titleMaxLineCount]];
    self.titleFrame = CGRectMake(0, 0, width, height);
    
    self.height = height;
}

+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:20];
}

+ (NSInteger)titleMaxLineCount {
    return 2;
}

@end
