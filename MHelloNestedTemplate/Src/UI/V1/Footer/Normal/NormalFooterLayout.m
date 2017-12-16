//
//  NormalFooterLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NormalFooterLayout.h"

@implementation NormalFooterLayout
- (void)calcForNews:(News *)news {
    double width = 0;
    double height = 0;
    if (!CGRectIsEmpty(self.constraintFrame)) {
        width = CGRectGetWidth(self.constraintFrame);
        height = CGRectGetHeight(self.constraintFrame);
    } else {
        width = [UIScreen mainScreen].bounds.size.width;
        height = 40;
    }
    
    self.timeFrame = CGRectMake(20, 0, width - 20 * 2, height);
    self.height = height;
}

@end
