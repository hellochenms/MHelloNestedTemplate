//
//  FriendsNode.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Node.h"

@interface FriendsNode : Node
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic, copy) void (^onTapUnfoldBlock)(void);
@end
