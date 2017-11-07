//
//  Cell.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "Layout.h"
#import "Node.h"

@interface Cell : UITableViewCell
@property (nonatomic) __kindof Node *node;
+ (double)heightForNews:(News *)news;
- (void)configWithNews:(News *)news;
//
//+ (Layout *)primitiveGenerateLayout;
//- (void)primitiveConfigWithNews:(News *)news;
@end
