//
//  LayoutMapping.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"
#import "Layout.h"
#import "Node.h"

@interface LayoutMapping : NSObject
+ (Class)layoutClassForNews:(News *)news;
+ (Class)nodeClassForNews:(News *)news;
@end
