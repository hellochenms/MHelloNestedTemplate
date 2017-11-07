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

- (Layout *)layout {
    return objc_getAssociatedObject(self, kLayoutKey);
}

- (void)mh_cleanLayout {
    self.layout = nil;
}

@end
