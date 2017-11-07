//
//  CompositeLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Layout.h"

@interface CompositeLayout : Layout
@property (nonatomic) CGRect headerFrame;
@property (nonatomic) CGRect footerFrame;
- (void)primitiveCalcHeaderForNews:(News *)news;
- (void)primitiveCalcFooterForNews:(News *)news originY:(double)originY;
@end
