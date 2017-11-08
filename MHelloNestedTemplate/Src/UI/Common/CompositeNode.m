//
//  CompositeNode.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeNode.h"
#import "CompositeLayout.h"
#import "LayoutMapping.h"

@interface CompositeNode()
@end

@implementation CompositeNode

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self primitiveAddHeader];
        [self primitiveAddFooter];
    }
    
    return self;
}

- (void)primitiveAddHeader {
    
}

- (void)primitiveAddFooter {
    
}

+ (Layout *)primitiveGenerateLayout {
    return [CompositeLayout new];
}

- (void)updateSubViewsForNews:(News *)news {
    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        [node removeFromSuperview];
    }];
    [self.subNodes removeAllObjects];
    
    double width = [UIScreen mainScreen].bounds.size.width;
    CompositeLayout *layout = self.news.layout;
    
    [self primitiveLayoutHeaderForNews:news];
    
    __block double y = CGRectGetHeight(layout.headerFrame);
    [news.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull subNews, NSUInteger idx, BOOL * _Nonnull stop) {
        Node *subNode = [[LayoutMapping nodeClassForNews:subNews] new];
        subNode.frame = CGRectMake(0, y, width, subNews.layout.height);
        y += subNews.layout.height;
        [self addSubview:subNode];
        [self.subNodes addObject:subNode];
    }];

    [self primitiveLayoutFooterForNews:news];
}

- (void)primitiveLayoutHeaderForNews:(News *)news {
    
}

- (void)primitiveLayoutFooterForNews:(News *)news {
    
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    double width = CGRectGetWidth(self.bounds);
//    CompositeLayout *layout = self.news.layout;
//
//    self.header.frame = layout.headerFrame;
//
//    __block double y = CGRectGetHeight(layout.headerFrame);
//    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
//        News *subNews = [self.news.subNewses objectAtIndex:idx];
//        node.frame = CGRectMake(0, y, width, subNews.layout.height);
//        y += subNews.layout.height;
//    }];
//
//    self.footer.frame = layout.footerFrame;
//}

- (void)primitiveConfigWithNews:(News *)news {
    [self updateSubViewsForNews:news];
    [self primitiveConfigHeaderWithNews:news];
    [self.subNodes enumerateObjectsUsingBlock:^(Node * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        News *subNews = [news.subNewses objectAtIndex:idx];
        [node configWithNews:subNews];
    }];
    [self primitiveConfigFooterWithNews:news];
}

- (void)primitiveConfigHeaderWithNews:(News *)news {}
- (void)primitiveConfigFooterWithNews:(News *)news {}

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
        Node *node = (Node *)[self hitTest:point withEvent:event];
        if ([self.subNodes containsObject:node]) {
            self.didSelectedBlock(node.news);
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
