//
//  NormalCellDecorator.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "NodeLayout.h"

@protocol NormalNodeDecoratorProtocol;

@interface NormalNodeDecorator : NSObject
@property (nonatomic, weak) id<NormalNodeDecoratorProtocol> delegate;
- (void)decorateNode:(__kindof Node *)node;
- (void)decorateLayout:(__kindof NodeLayout *)layout;
@end

@protocol NormalNodeDecoratorProtocol<NSObject>
@optional
- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didTapUnfoldIndexPath:(NSIndexPath *)indexPath;
- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didTapFooterButton:(News *)news;
- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didSelectCompositeSubNews:(News *)news;
@end
