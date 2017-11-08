//
//  Cell.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import "Layout.h"
#import "Node.h"

@protocol CellProtocol;

@interface Cell : UITableViewCell
@property (nonatomic) __kindof Node *node;
@property (nonatomic, weak) id<CellProtocol> delegate;
+ (double)heightForNews:(News *)news;
- (void)configWithNews:(News *)news;

- (Class)primitiveNodeClass;
- (void)primitiveDecorateNode;
@end

@protocol CellProtocol<NSObject>
@optional
- (void)didSelectCompositeSubNews:(News *)news;
@end
