//
//  TitleImageCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleImageCell.h"
#import "TitleImageNode.h"

@implementation TitleImageCell
- (Class)primitiveNodeClass {
    return [TitleImageNode class];
}

@end
