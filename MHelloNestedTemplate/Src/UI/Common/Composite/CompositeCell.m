//
//  CompositeCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeCell.h"
#import "CompositeNode.h"

@implementation CompositeCell
+ (Class)primitiveNodeClass {
    return [CompositeNode class];
}

@end
