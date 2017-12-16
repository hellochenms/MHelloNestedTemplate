//
//  CompositeLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NodeLayout.h"
#import "CompositeNodeHelper.h"

@interface CompositeLayout : NodeLayout
@property (nonatomic) CompositeNodeHelper *helper;
@property (nonatomic, copy) void(^decorateSubLayoutBlock)(__kindof NodeLayout *subLayout);
@end
