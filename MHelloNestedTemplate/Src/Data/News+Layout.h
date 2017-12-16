//
//  News+Layout.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "News.h"
#import "NodeLayout.h"

@interface News (Layout)
@property (nonatomic) __kindof NodeLayout *layout;
@property (nonatomic) __kindof Layout *headerLayout;
@property (nonatomic) __kindof Layout *footerLayout;
- (void)mh_cleanLayout;
- (void)mh_cleanBodyLayout;
- (void)mh_cleanLayoutRecursive;
@end
