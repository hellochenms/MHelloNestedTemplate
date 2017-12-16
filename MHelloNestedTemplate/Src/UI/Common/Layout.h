//
//  Layout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface Layout : NSObject
@property (nonatomic) double height;
@property (nonatomic) CGRect constraintFrame;
- (void)calcForNews:(News *)news;
@end
