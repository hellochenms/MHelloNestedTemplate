//
//  CompositeNode.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Node.h"
#import "News.h"

@interface CompositeNode : Node
@property (nonatomic) NSMutableArray<Node *> *subNodes;
- (void)primitiveAddHeader;
- (void)primitiveLayoutHeaderForNews:(News *)news;
- (void)primitiveConfigHeaderWithNews:(News *)news;
- (void)primitiveAddFooter;
- (void)primitiveLayoutFooterForNews:(News *)news;
- (void)primitiveConfigFooterWithNews:(News *)news;
@property (nonatomic, copy) void (^didSelectedBlock)(News * news);
@end
