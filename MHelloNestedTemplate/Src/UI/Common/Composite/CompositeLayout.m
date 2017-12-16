//
//  CompositeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeLayout.h"
#import "News+Layout.h"

@implementation CompositeLayout
- (void)primitiveCalcBodyForNews:(News *)news {
    __weak typeof(self) weakSelf = self;
    __block double height = 0;
    [news.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull news, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!news.layout) {
            NodeLayout *layout = [[self.helper layoutClassForNews:news] new];
            if (weakSelf.decorateSubLayoutBlock) {
                weakSelf.decorateSubLayoutBlock(layout);
            }
            [layout calcForNews:news];
            news.layout = layout;
        }
        height += news.layout.height;
    }];
    
    self.bodyHeight = height;
}

@end
