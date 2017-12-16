//
//  TopicCompositeLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TopicCompositeFooterLayout.h"

@implementation TopicCompositeFooterLayout
- (void)calcForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    
    self.height = 60;
    
    self.footerButtonFrame = CGRectMake(20, 00, width - 20 * 2, self.height);
}
@end
