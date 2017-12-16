//
//  CompositeNode.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Node.h"
#import "News.h"
#import "CompositeNodeHelper.h"

@interface CompositeNode : Node
@property (nonatomic) NSMutableArray<Node *> *subNodes;
@property (nonatomic) CompositeNodeHelper *helper;
@property (nonatomic, copy) void(^decorateSubNodeBlock)(__kindof Node *compositeNode,  __kindof Node *subNode);
@property (nonatomic, copy) void (^didSelectedBlock)(News *news);
@end
