//
//  CompositeNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeNode.h"
#import "CompositeLayout.h"

@interface CompositeNode()
@end

@implementation CompositeNode
+ (Layout *)primitiveGenerateLayout {
    return [CompositeLayout new];
}

- (void)primitiveWillConfigWithNews:(News *)news {
    [news mh_cleanLayoutRecursive];
}

- (void)primitiveConfigBodyContainerForNews:(News *)news {
    // clear
    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [node removeFromSuperview];
    }];
    [self.subNodes removeAllObjects];
    
    // create
    if (!self.helper) {
        return;
    }
    double width = [UIScreen mainScreen].bounds.size.width;
    __block double y = 0;
    [news.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull subNews, NSUInteger idx, BOOL * _Nonnull stop) {
        Node *subNode = [[self.helper nodeClassForNews:subNews] new];
        if (self.decorateSubNodeBlock) {
            self.decorateSubNodeBlock(self, subNode);
        }
        [subNode configWithNews:subNews];
        subNode.frame = CGRectMake(0, y, width, subNews.layout.height);
        y += subNews.layout.height;
        [self.bodyContainer addSubview:subNode];
        [self.subNodes addObject:subNode];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];

    CGPoint point = [[touches anyObject] locationInView:self];
    Node *node = (Node *)[self hitTest:point withEvent:event];
    if ([self.subNodes containsObject:node]) {
        [node setHighlighted:YES animated:NO];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];

    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [node setHighlighted:NO animated:NO];
    }];
    
    if (self.didSelectedBlock) {
        CGPoint point = [[touches anyObject] locationInView:self];
        UIView *node = (Node *)[self hitTest:point withEvent:event];
        while (node && ![node isKindOfClass:[Node class]]) {
            node = [node superview];
        }
        
        if (node && [self.subNodes containsObject:(Node *)node]) {
            self.didSelectedBlock(((Node *)node).news);
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];

    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [node setHighlighted:NO animated:NO];
    }];
}

#pragma mark - Getter
- (NSMutableArray<Node *> *)subNodes {
    if(!_subNodes){
        _subNodes = [NSMutableArray<Node *> array];
    }
    
    return _subNodes;
}

@end
