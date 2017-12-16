//
//  NodeLayout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Layout.h"

@interface NodeLayout : Layout
@property (nonatomic) Layout *headerLayout;
@property (nonatomic) CGRect headerFrame;

@property (nonatomic) Layout *bodyLayout;
@property (nonatomic) double bodyHeight;
@property (nonatomic) CGRect bodyFrame;

@property (nonatomic) Layout *footerLayout;
@property (nonatomic) CGRect footerFrame;

- (void)primitiveCalcBodyForNews:(News *)news;
@end
