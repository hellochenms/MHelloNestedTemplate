//
//  FriendsLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "FriendsLayout.h"
#import "NSString+M2Size.h"

static double const kImageMaxSideLength = 260;

@implementation FriendsLayout
- (void)primitiveCalcBodyForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    //
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
    double imagesContainerX = 50;
    double imagesContainerY = CGRectGetMaxY((shouldFold ? self.unFoldFrame : self.titleFrame)) + 20;
    double imagesContainerWidth = width - 50 * 2;
    
    NSInteger imageCount = [news.images count];
    if (imageCount == 0) {
        self.imagesContainerFrame = CGRectZero;
    } else if(imageCount == 1) {
        Image *image = [news.images firstObject];
        double width = image.width;
        double height = image.height;
        if (width > 0 && height > 0) {
            // 宽型
            if (width >= height) {
                double factor = height / width;
                width = kImageMaxSideLength;
                height = width * factor;
            }
            // 高型
            else {
                double factor = width / height;
                height = kImageMaxSideLength;
                width = height * factor;
            }
        } else {
            // 降级
            width = kImageMaxSideLength;
            height = width * 2 / 3;
        }
        self.bigImageSize = CGSizeMake(width, height);
        
        self.imagesContainerFrame = CGRectMake(imagesContainerX, imagesContainerY, imagesContainerWidth, height);
    } else if(imageCount <= 4) {
//        double middleItemBetween = [[self class] middleItemBetween];
//        double middleItemWidth = floor((imagesContainerWidth - middleItemBetween) / 2);
        
        double smallItemBetween = [[self class] smallItemBetween];
        double middleItemWidth = floor((imagesContainerWidth - smallItemBetween * 2) / 3);
        double middleItemHeight = middleItemWidth;
        self.middleImageSize = CGSizeMake(middleItemWidth, middleItemHeight);
        
        NSInteger rowCount = (imageCount - 1) / 2 + 1;
        self.imagesContainerFrame = CGRectMake(imagesContainerX, imagesContainerY, imagesContainerWidth, (middleItemHeight + smallItemBetween) * rowCount - smallItemBetween);
    } else {
        double smallItemBetween = [[self class] smallItemBetween];
        double smallItemWidth = floor((imagesContainerWidth - smallItemBetween * 2) / 3);
        double smallItemHeight = smallItemWidth;
        self.smallImageSize = CGSizeMake(smallItemWidth, smallItemHeight);
        
        if (imageCount > 9) {
            imageCount = 9;
        }
        NSInteger rowCount = (imageCount - 1) / 3 + 1;
        self.imagesContainerFrame = CGRectMake(imagesContainerX, imagesContainerY, imagesContainerWidth, (smallItemHeight + smallItemBetween) * rowCount - smallItemBetween);
    }
    
    //
    if (CGRectIsEmpty(self.imagesContainerFrame)) {
        if (!CGRectIsEmpty(self.unFoldFrame)) {
            self.height = CGRectGetMaxY(self.unFoldFrame);
        } else {
            self.height = CGRectGetMaxY(self.titleFrame);
        }
    } else {
        self.bodyHeight = CGRectGetMaxY(self.imagesContainerFrame);
    }
    
}

+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:20];
}

+ (NSInteger)titleMaxLineCount {
    return 2;
}

+ (double)middleItemBetween {
    return 20;
}

+ (double)smallItemBetween {
    return 10;
}

@end
