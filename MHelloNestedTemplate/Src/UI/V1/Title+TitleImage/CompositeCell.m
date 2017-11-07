//
//  CompositeCell.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "CompositeCell.h"
#import "HeaderFooterCompositeNode.h"
#import "HeaderCompositeNode.h"

@implementation CompositeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.node = [HeaderCompositeNode new];
        [self.contentView addSubview:self.node];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [(HeaderCompositeNode *)self.node setHighlighted:highlighted animated:animated];
}

@end
