//
//  News.h
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"

typedef NS_ENUM(NSUInteger, NLayoutType) {
    NLayoutTypeTitle,
    NLayoutTypeTitleImage,
    NLayoutTypeFriends,
    NLayoutTypeComposite,
};

@interface News : NSObject
@property (nonatomic) NSInteger nid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageURLString;
@property (nonatomic) NSArray<News *> *subNewses;
@property (nonatomic) NSArray<Image *> *images;
@property (nonatomic) BOOL isTitleUnFold;
- (NLayoutType)layoutType;
@end
