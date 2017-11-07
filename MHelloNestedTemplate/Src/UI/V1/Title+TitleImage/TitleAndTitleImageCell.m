//
//  CompositeCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "TitleAndTitleImageCell.h"
#import "HeaderFooterCompositeNode.h"
#import "HeaderCompositeNode.h"

@implementation TitleAndTitleImageCell
- (Class)primitiveNodeClass {
    return [HeaderFooterCompositeNode class];
}

@end
