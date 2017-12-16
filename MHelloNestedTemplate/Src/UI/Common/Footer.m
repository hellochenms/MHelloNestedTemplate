//
//  Footer.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Footer.h"
#import "News+Layout.h"

@implementation Footer
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    
    return self;
}

- (void)configWithNews:(News *)news {
    self.news = news;
    [[self class] tryCalcForNews:news];
    [self primitiveConfigWithNews:news];
}

+ (void)tryCalcForNews:(News *)news {
    if (!news.footerLayout) {
        Layout *layout = [self primitiveGenerateLayout];
        [layout calcForNews:news];
        news.footerLayout = layout;
    }
}

+ (Layout *)primitiveGenerateLayout {
    return nil;
}

- (void)primitiveConfigWithNews:(News *)news {}

@end
