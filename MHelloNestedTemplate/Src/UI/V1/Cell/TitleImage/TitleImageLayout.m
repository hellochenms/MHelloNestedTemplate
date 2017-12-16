//
//  TitleImageLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleImageLayout.h"
#import "NSString+M2Size.h"

@implementation TitleImageLayout
- (void)primitiveCalcBodyForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    double between = 10;
    double imageWidth = 150;
    double imageHeight = ceil(imageWidth * 2 / 3);
    self.imageFrame = CGRectMake(0, 0, imageWidth, imageHeight);
    
    double titleX = CGRectGetWidth(self.imageFrame) + between;
    double titleWidth = width - CGRectGetMaxX(self.imageFrame);
    double titleHeight = [news.title m2_heightForFont:[[self class] titleFont]
                                        maxWidth:width
                                    maxLineCount:[[self class] titleMaxLineCount]];
    self.titleFrame = CGRectMake(titleX, 0, titleWidth, titleHeight);
    
    self.bodyHeight = MAX(CGRectGetMaxY(self.imageFrame), CGRectGetMaxY(self.titleFrame));
    
    //
    double footerX = CGRectGetMaxX(self.imageFrame);
    double footerY = CGRectGetMaxY(self.titleFrame);
    double footerWidth = width - footerX;
    double footerHeight = CGRectGetMaxY(self.imageFrame) - footerY;
    self.footerLayout.constraintFrame = CGRectMake(footerX, footerY, footerWidth, footerHeight);
}

#pragma mark - Tools
+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:20];
}

+ (NSInteger)titleMaxLineCount {
    return 2;
}


@end
