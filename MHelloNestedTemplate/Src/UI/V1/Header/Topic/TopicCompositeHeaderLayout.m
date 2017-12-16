//
//  TopicCompositeHeaderLayout.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TopicCompositeHeaderLayout.h"

@implementation TopicCompositeHeaderLayout
- (void)calcForNews:(News *)news {
    double width = [UIScreen mainScreen].bounds.size.width;
    
    self.height = 60;
    
    double margin = 10;
    self.headerTitleFrame = CGRectMake(margin, margin, width - margin * 2, self.height - margin * 2);
}

@end
