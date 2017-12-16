//
//  News+Layout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "News+Layout.h"
#import <objc/runtime.h>

@implementation News (Layout)
#pragma mark - Layout
static const void *kLayoutKey = &kLayoutKey;
- (void)setLayout:(Layout *)layout {
    objc_setAssociatedObject(self, kLayoutKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NodeLayout *)layout {
    return objc_getAssociatedObject(self, kLayoutKey);
}

//
static const void *kHeaderLayoutKey = &kHeaderLayoutKey;
- (void)setHeaderLayout:(Layout *)headerLayout {
    objc_setAssociatedObject(self, kHeaderLayoutKey, headerLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Layout *)headerLayout {
    return objc_getAssociatedObject(self, kHeaderLayoutKey);
}

//
static const void *kFooterLayoutKey = &kFooterLayoutKey;
- (void)setFooterLayout:(Layout *)layout {
    objc_setAssociatedObject(self, kFooterLayoutKey, layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (Layout *)footerLayout {
    return objc_getAssociatedObject(self, kFooterLayoutKey);
}

#pragma mark - Clean
- (void)mh_cleanLayout {
    self.layout = nil;
    self.headerLayout = nil;
    self.footerLayout = nil;
}


- (void)mh_cleanBodyLayout {
    self.layout = nil;
}

- (void)mh_cleanLayoutRecursive {
    self.layout = nil;
    self.headerLayout = nil;
    self.footerLayout = nil;
    
    [self.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull subNews, NSUInteger idx, BOOL * _Nonnull stop) {
        subNews.layout = nil;
        subNews.headerLayout = nil;
        subNews.footerLayout = nil;
        
    }];
}

@end
