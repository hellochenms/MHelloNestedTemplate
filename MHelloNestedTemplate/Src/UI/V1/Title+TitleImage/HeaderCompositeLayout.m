//
//  HeaderCompositeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/7.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "HeaderCompositeLayout.h"

@implementation HeaderCompositeLayout
- (void)primitiveCalcHeaderForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    double height = 40;
    self.headerFrame = CGRectMake(0, 0, width, height);
    
    double margin = 10;
    self.headerTitleFrame = CGRectMake(margin, margin, width - margin * 2, height - margin * 2);
}
@end
