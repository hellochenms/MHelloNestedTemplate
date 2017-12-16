//
//  Node.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Something.h"
#import "News+Layout.h"
#import "NodeLayout.h"
#import "Header.h"
#import "Footer.h"

@interface Node : Something
@property (nonatomic) NodeLayout *layout;
@property (nonatomic) Header *header;
@property (nonatomic, readonly) UIView *bodyContainer;
@property (nonatomic) Footer *footer;
@property (nonatomic) NSIndexPath *indexPath;
+ (double)heightForNews:(News *)news;
+ (double)heightForNews:(News *)news decorateLayoutBlock:(void(^)(NodeLayout *))decorateLayoutBlock;
- (void)primitiveAddBodyContainerSubViews:(UIView *)bodyContainer;
- (void)primitiveWillConfigWithNews:(News *)news;
- (void)primitiveConfigBodyContainerForNews:(News *)news;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

+ (__kindof NodeLayout *)primitiveGenerateLayout;
- (void)primitiveConfigWithNews:(News *)news;
@end
