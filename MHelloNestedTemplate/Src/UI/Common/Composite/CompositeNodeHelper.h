//
//  CompositeNodeHelper.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/12/16.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface CompositeNodeHelper : NSObject
- (Class)nodeClassForNews:(News *)news;
- (Class)layoutClassForNews:(News *)news;
@end
