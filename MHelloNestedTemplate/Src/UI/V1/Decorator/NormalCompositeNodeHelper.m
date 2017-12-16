//
//  NormalCompositeNodeHelper.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NormalCompositeNodeHelper.h"
#import "TitleNode.h"
#import "TitleLayout.h"
#import "TitleImageNode.h"
#import "TitleImageLayout.h"
#import "CompositeNode.h"
#import "CompositeLayout.h"

@implementation NormalCompositeNodeHelper
- (Class)nodeClassForNews:(News *)news {
    switch ([news layoutType]) {
        case NLayoutTypeTitle:
            return [TitleNode class];
            break;
        case NLayoutTypeTitleImage:
            return [TitleImageNode class];
            break;
        default:
            return [TitleNode class];
            break;
    }
}

- (Class)layoutClassForNews:(News *)news {
    switch ([news layoutType]) {
        case NLayoutTypeTitle:
            return [TitleLayout class];
            break;
        case NLayoutTypeTitleImage:
            return [TitleImageLayout class];
            break;
        default:
            return [TitleLayout class];
            break;
    }
}

@end
