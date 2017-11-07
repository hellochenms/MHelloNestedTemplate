//
//  Node.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News+Layout.h"
#import "Layout.h"

@interface Node : UIView
@property (nonatomic) News *news;
+ (double)heightForNews:(News *)news;
- (void)configWithNews:(News *)news;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

+ (__kindof Layout *)primitiveGenerateLayout;
- (void)primitiveConfigWithNews:(News *)news;
@end
