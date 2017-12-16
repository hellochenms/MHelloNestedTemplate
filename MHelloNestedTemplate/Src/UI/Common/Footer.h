//
//  Footer.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/15.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "Something.h"
#import "Layout.h"

@interface Footer : Something
+ (Layout *)primitiveGenerateLayout;
- (void)primitiveConfigWithNews:(News *)news;
@end
