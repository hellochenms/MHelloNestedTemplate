//
//  HeaderFooterCompositeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/7.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "HeaderFooterCompositeLayout.h"

@implementation HeaderFooterCompositeLayout
- (void)primitiveCalcFooterForNews:(News *)news originY:(double)originY {
    double width = [UIScreen mainScreen].bounds.size.width;
    double height = 40;

    self.footerFrame = CGRectMake(0, originY, width, height);
    
    double margin = 10;
    self.footerButtonFrame = CGRectMake(margin, margin, width - margin * 2, height - margin * 2);
}

@end
