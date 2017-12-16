//
//  Node.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Node.h"

@interface Node()
@property (nonatomic) UIView *bodyContainer;
@end

@implementation Node
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bodyContainer];
        [self primitiveAddBodyContainerSubViews:self.bodyContainer];
    }
    
    return self;
}

- (void)primitiveAddBodyContainerSubViews:(UIView *)bodyContainer {}

+ (double)heightForNews:(News *)news {
    return [self heightForNews:news decorateLayoutBlock:nil];
}

+ (double)heightForNews:(News *)news decorateLayoutBlock:(void(^)(NodeLayout *))decorateLayoutBlock {
    [self tryCalcForNews:news
                  layout:nil
     decorateLayoutBlock:decorateLayoutBlock];
    double height = news.layout.height;
    
    return height;
}

+ (void)tryCalcForNews:(News *)news
                layout:(NodeLayout *)layout
   decorateLayoutBlock:(void(^)(NodeLayout *))decorateLayoutBlock {
    if (!news.layout) {
        NodeLayout *theLayout = (layout ?: [self primitiveGenerateLayout]);
        if (decorateLayoutBlock) {
            decorateLayoutBlock(theLayout);
        }

        [theLayout calcForNews:news];
        news.layout = theLayout;
    }
}

+ (__kindof NodeLayout *)primitiveGenerateLayout {
    return nil;
}

- (void)configWithNews:(News *)news {
    self.news = news;
    [self primitiveWillConfigWithNews:news];
    [[self class] tryCalcForNews:news
                          layout:self.layout
             decorateLayoutBlock:nil];
    [self primitiveConfigWithNews:news];
}

- (void)primitiveWillConfigWithNews:(News *)news {}

- (void)primitiveConfigWithNews:(News *)news {
    NodeLayout *layout = news.layout;
    
    self.header.frame = layout.headerFrame;
    [self.header configWithNews:news];
    
    self.bodyContainer.frame = layout.bodyFrame;
    [self primitiveConfigBodyContainerForNews:news];
    
    self.footer.frame = layout.footerFrame;
    [self.footer configWithNews:news];
}

- (void)primitiveConfigBodyContainerForNews:(News *)news {}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {}


#pragma mark - Setter/Getter
- (void)setHeader:(Header *)header {
    [_header removeFromSuperview];
    _header = header;
    [self addSubview:_header];
}

- (void)setFooter:(Footer *)footer {
    [_footer removeFromSuperview];
    _footer = footer;
    [self addSubview:_footer];
}

- (UIView *)bodyContainer {
    if(!_bodyContainer) {
        _bodyContainer = [UIView new];
    }
    
    return _bodyContainer;
}

- (NodeLayout *)layout {
    if(!_layout){
        _layout = [[self class] primitiveGenerateLayout];
    }

    return _layout;
}

@end
