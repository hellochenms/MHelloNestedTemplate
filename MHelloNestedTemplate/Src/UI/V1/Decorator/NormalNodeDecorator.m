//
//  NormalCellDecorator.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "NormalNodeDecorator.h"
#import "TitleNode.h"
#import "TitleLayout.h"
#import "TitleImageNode.h"
#import "TitleImageLayout.h"
#import "NormalFooter.h"
#import "NormalFooterLayout.h"
#import "FriendsNode.h"
#import "FriendsLayout.h"
#import "CompositeNode.h"
#import "CompositeLayout.h"
#import "NormalCompositeNodeHelper.h"
#import "TopicCompositeHeader.h"
#import "TopicCompositeHeaderLayout.h"
#import "TopicCompositeFooter.h"
#import "TopicCompositeFooterLayout.h"

@implementation NormalNodeDecorator
#pragma mark - Node
- (void)decorateNode:(__kindof Node *)node {
    if ([node isKindOfClass:[TitleNode class]]) {
        [self decorateTitleNode:node modifiedIndexPath:nil];
    } else if ([node isKindOfClass:[TitleImageNode class]]) {
        [self decorateTitleImageNode:node];
    } else if ([node isKindOfClass:[FriendsNode class]]) {
        [self decorateFriendsNode:node];
    } else if ([node isKindOfClass:[CompositeNode class]]) {
        // Node
        CompositeNode *theNode = node;
        __weak typeof(self) weakSelf = self;
        theNode.decorateSubNodeBlock = ^(__kindof Node *compositeNode, __kindof Node *subNode) {
            if ([subNode isKindOfClass:[TitleNode class]]) {
                [weakSelf decorateTitleNode:subNode modifiedIndexPath:compositeNode.indexPath];
            } else if ([subNode isKindOfClass:[TitleImageNode class]]) {
                [weakSelf decorateTitleImageNode:subNode];
            }
        };
        theNode.didSelectedBlock = ^(News *news) {
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(normalNodeDecorator:didSelectCompositeSubNews:)]) {
                [weakSelf.delegate normalNodeDecorator:weakSelf didSelectCompositeSubNews:news];
            }
        };
        // Helper
        theNode.helper = [NormalCompositeNodeHelper new];
        // Header
        theNode.header = [TopicCompositeHeader new];
        // Footer
        TopicCompositeFooter *footer = [TopicCompositeFooter new];
        footer.onTapFooterButtonBlock = ^(News *news){
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(normalNodeDecorator:didTapFooterButton:)]) {
                [weakSelf.delegate normalNodeDecorator:weakSelf didTapFooterButton:news];
            }
        };
        theNode.footer = footer;
    }
    
    [self decorateLayout:node.layout];
}

// TitleNode
- (void)decorateTitleNode:(TitleNode *)node modifiedIndexPath:(NSIndexPath *)modifiedIndexPath {
    __weak typeof(self) weakSelf = self;
    __weak TitleNode *weakNode = node;
    node.onTapUnfoldBlock = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(normalNodeDecorator:didTapUnfoldIndexPath:)]) {
            NSIndexPath *theIndexPath = (modifiedIndexPath ?: weakNode.indexPath);
            [weakSelf.delegate normalNodeDecorator:weakSelf didTapUnfoldIndexPath:theIndexPath];
        }
    };
    node.footer = [NormalFooter new];
}

// TitleImageNode
- (void)decorateTitleImageNode:(TitleImageNode *)node {
    node.footer = [NormalFooter new];
}

// Friends
- (void)decorateFriendsNode:(FriendsNode *)node {
    __weak typeof(self) weakSelf = self;
    __weak FriendsNode *weakNode = node;
    node.onTapUnfoldBlock = ^{
        if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(normalNodeDecorator:didTapUnfoldIndexPath:)]) {
            NSIndexPath *theIndexPath = weakNode.indexPath;
            [weakSelf.delegate normalNodeDecorator:weakSelf didTapUnfoldIndexPath:theIndexPath];
        }
    };
    node.footer = [NormalFooter new];
}

#pragma mark - Layout
- (void)decorateLayout:(__kindof NodeLayout *)layout {
    if ([layout isKindOfClass:[TitleLayout class]]) {
        [self decorateTitleLayout:layout];
    } else if ([layout isKindOfClass:[TitleImageLayout class]]) {
        [self decorateTitleImageLayout:layout];
    } else if ([layout isKindOfClass:[FriendsLayout class]]) {
        [self decorateFriendsLayout:layout];
    } else if ([layout isKindOfClass:[CompositeLayout class]]) {
        // Layout
        CompositeLayout *theLayout = layout;
        __weak typeof(self) weakSelf = self;
        theLayout.decorateSubLayoutBlock = ^( __kindof NodeLayout *subLayout) {
            if ([subLayout isKindOfClass:[TitleLayout class]]) {
                [weakSelf decorateTitleLayout:subLayout];
            } else if ([subLayout isKindOfClass:[TitleImageLayout class]]) {
                [weakSelf decorateTitleImageLayout:subLayout];
            } else if ([subLayout isKindOfClass:[FriendsLayout class]]) {
                [weakSelf decorateFriendsLayout:subLayout];
            }
        };
        // Helper
        theLayout.helper = [NormalCompositeNodeHelper new];
        // Header
        theLayout.headerLayout = [TopicCompositeHeaderLayout new];
        // Footer
        theLayout.footerLayout = [TopicCompositeFooterLayout new];
    }
}

- (void)decorateTitleLayout:(TitleLayout *)layout {
    layout.footerLayout = [NormalFooterLayout new];
}

- (void)decorateTitleImageLayout:(TitleImageLayout *)layout {
    layout.footerLayout = [NormalFooterLayout new];
}

- (void)decorateFriendsLayout:(FriendsLayout *)layout {
    layout.footerLayout = [NormalFooterLayout new];
}

@end
