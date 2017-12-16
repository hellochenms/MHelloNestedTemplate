//
//  Cell.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "Node.h"
#import "NodeLayout.h"

@interface Cell : UITableViewCell
@property (nonatomic, readonly) __kindof Node *node;
+ (double)heightForNews:(News *)news;
+ (double)heightForNews:(News *)news decorateLayoutBlock:(void(^)(NodeLayout *))decorateLayoutBlock;
+ (Class)primitiveNodeClass;
@end

