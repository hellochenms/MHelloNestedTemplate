//
//  FriendsCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "FriendsCell.h"
#import "FriendsNode.h"

@implementation FriendsCell
+ (Class)primitiveNodeClass {
    return [FriendsNode class];
}

@end
