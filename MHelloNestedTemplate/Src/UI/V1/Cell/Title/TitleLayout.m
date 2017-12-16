//
//  TitleLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleLayout.h"
#import "NSString+M2Size.h"
#import "NormalFooterLayout.h"

@implementation TitleLayout
- (void)primitiveCalcBodyForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;

    NSInteger titleFoldHeight = (NSInteger)[news.title m2_heightForFont:[[self class] titleFont]
                                                               maxWidth:width
                                                           maxLineCount:[[self class] titleMaxLineCount]];
    
    NSInteger titleUnFoldHeight = (NSInteger)[news.title m2_heightForFont:[[self class] titleFont]
                                                                 maxWidth:width
                                                             maxLineCount:0];
    BOOL shouldFold = (titleFoldHeight < titleUnFoldHeight);
    double height = 0;
    if (shouldFold) {
        double maxLineCount = (news.isTitleUnFold ? 0 : [[self class] titleMaxLineCount]);
        height = [news.title m2_heightForFont:[[self class] titleFont]
                                     maxWidth:width
                                 maxLineCount:maxLineCount];
    } else {
        height = [news.title m2_heightForFont:[[self class] titleFont]
                                     maxWidth:width
                                 maxLineCount:0];
    }
    self.titleFrame = CGRectMake(0, 0, width, height);
    
    
    //
    if (shouldFold) {
        self.unFoldFrame = CGRectMake(0, CGRectGetMaxY(self.titleFrame) + 20, 200, 60);
    } else {
        self.unFoldFrame = CGRectZero;
    }
    
    //
    if (!CGRectIsEmpty(self.unFoldFrame)) {
        self.bodyHeight = CGRectGetMaxY(self.unFoldFrame);
    } else {
        self.bodyHeight = CGRectGetMaxY(self.titleFrame);
    }
}

+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:20];
}

+ (NSInteger)titleMaxLineCount {
    return 2;
}

@end
