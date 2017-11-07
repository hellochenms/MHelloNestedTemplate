//
//  Node.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Node.h"

@implementation Node
+ (double)heightForNews:(News *)news {
    [self tryCalcForNews:news];
    double height = news.layout.height;
    
    return height;
}

+ (void)tryCalcForNews:(News *)news {
    if (!news.layout) {
        Layout *layout = [self primitiveGenerateLayout];
        [layout calcForNews:news];
        news.layout = layout;
    }
}

+ (Layout *)primitiveGenerateLayout {
    return nil;
}


- (void)configWithNews:(News *)news {
    self.news = news;
    [[self class] tryCalcForNews:news];
    [self primitiveAddSubNodesForNews:news];
    [self primitiveConfigWithNews:news];
}

- (void)primitiveAddSubNodesForNews:(News *)news {
    
}

- (void)primitiveConfigWithNews:(News *)news {
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}

@end
