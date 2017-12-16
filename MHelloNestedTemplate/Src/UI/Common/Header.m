//
//  Header.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Header.h"
#import "News+Layout.h"

@implementation Header
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    
    return self;
}

- (void)configWithNews:(News *)news {
    self.news = news;
    [[self class] tryCalcForNews:news];
    [self primitiveConfigWithNews:news];
}

+ (void)tryCalcForNews:(News *)news {
    if (!news.headerLayout) {
        Layout *layout = [self primitiveGenerateLayout];
        [layout calcForNews:news];
        news.headerLayout = layout;
    }
}

+ (Layout *)primitiveGenerateLayout {
    return nil;
}

- (void)primitiveConfigWithNews:(News *)news {}

@end
