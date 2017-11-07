//
//  CompositeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeLayout.h"
#import "LayoutMapping.h"

@implementation CompositeLayout
- (void)calcForNews:(News *)news {
    __block double height = 0;
    [self primitiveCalcHeaderForNews:news];
    height += CGRectGetHeight(self.headerFrame);
    
    [news.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull news, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!news.layout) {
            Layout *layout = [[LayoutMapping layoutClassForNews:news] new];
            [layout calcForNews:news];
            news.layout = layout;
        }
        height += news.layout.height;
    }];

    [self primitiveCalcFooterForNews:news originY:height];
    height += CGRectGetHeight(self.footerFrame);
    
    self.height = height;
}

- (void)primitiveCalcHeaderForNews:(News *)news {
}
- (void)primitiveCalcFooterForNews:(News *)news originY:(double)originY {
}

@end
