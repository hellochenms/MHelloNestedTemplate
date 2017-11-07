//
//  TitleCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleCell.h"
#import "TitleNode.h"

@implementation TitleCell
- (Class)primitiveNodeClass {
    return [TitleNode class];
}

@end
