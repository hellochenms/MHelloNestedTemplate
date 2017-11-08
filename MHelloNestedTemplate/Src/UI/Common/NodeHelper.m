//
//  NodeHelper.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/8.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NodeHelper.h"
#import "CompositeNode.h"

@implementation NodeHelper
+ (BOOL)isCompositeNode:(Node *)node {
    return [node isKindOfClass:[CompositeNode class]];
}

@end
