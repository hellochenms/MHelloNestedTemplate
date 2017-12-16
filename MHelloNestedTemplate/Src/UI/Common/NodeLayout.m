//
//  NodeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NodeLayout.h"

@implementation NodeLayout
- (void)calcForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    
    //
    [self.headerLayout calcForNews:news];
    self.headerFrame = CGRectMake(0, 0, width, self.headerLayout.height);
    
    //
    [self primitiveCalcBodyForNews:news];
    self.bodyFrame = CGRectMake(0, CGRectGetMaxY(self.headerFrame), width, self.bodyHeight);
    
    //
    [self.footerLayout calcForNews:news];
    if (!CGRectIsEmpty(self.footerLayout.constraintFrame)) {
        self.footerFrame = self.footerLayout.constraintFrame;
    } else {
        self.footerFrame = CGRectMake(0, CGRectGetMaxY(self.bodyFrame), width, self.footerLayout.height);
    }

    self.height = CGRectGetHeight(self.headerFrame) + CGRectGetHeight(self.bodyFrame);
    if (CGRectIsEmpty(self.footerLayout.constraintFrame)) {
        self.height += CGRectGetHeight(self.footerFrame);
    }
}

- (void)primitiveCalcBodyForNews:(News *)news {}

@end
