//
//  FriendsCell.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/12.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Cell.h"

@interface FriendsCell : Cell
@property (nonatomic, copy) void (^onTapUnfoldBlock)(FriendsCell *);
@end
