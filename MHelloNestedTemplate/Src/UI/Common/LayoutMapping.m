//
//  LayoutMapping.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "LayoutMapping.h"
#import "TitleLayout.h"
#import "TitleImageLayout.h"
#import "CompositeLayout.h"
#import "TitleNode.h"
#import "TitleImageNode.h"
#import "CompositeNode.h"

@implementation LayoutMapping
+ (Class)layoutClassForNews:(News *)news {
    switch ([news layoutType]) {
        case NLayoutTypeTitle:
            return [TitleLayout class];
            break;
        case NLayoutTypeTitleImage:
            return [TitleImageLayout class];
            break;
        case NLayoutTypeComposite:
            return [CompositeLayout class];
            break;
        default:
            return [TitleLayout class];
            break;
    }
}


+ (Class)nodeClassForNews:(News *)news {
    switch ([news layoutType]) {
        case NLayoutTypeTitle:
            return [TitleNode class];
            break;
        case NLayoutTypeTitleImage:
            return [TitleImageNode class];
            break;
        case NLayoutTypeComposite:
            return [CompositeNode class];
            break;
        default:
            return [TitleNode class];
            break;
    }
}

@end
