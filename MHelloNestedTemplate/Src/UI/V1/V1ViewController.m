//
//  V1ViewController.m
//  MHelloNestedTemplate
//
//  Created by Chen,Meisong on 2017/11/6.
//  Copyright © 2017年 hellochenms. All rights reserved.
//

#import "V1ViewController.h"
#import "News.h"
#import "TempDataGenerator.h"
#import "Cell.h"
#import "TitleCell.h"
#import "TitleImageCell.h"
#import "TitleAndTitleImageCell.h"

@interface V1ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray<News *> *newses;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation V1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.newses objectAtIndex:indexPath.row];
    Class cellClass = [self cellClassForNews:news];
    NSString *identifier = NSStringFromClass(cellClass);
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell configWithNews:news];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.newses objectAtIndex:indexPath.row];
    Class cellClass = [self cellClassForNews:news];
    
    double height = [cellClass heightForNews:news];
    NSLog(@"【chenms】height:%.1f  %s", height, __func__);
    
    return height;
}

- (Class)cellClassForNews:(News *)news {
    switch ([news layoutType]) {
        case NLayoutTypeTitle:
            return [TitleCell class];
            break;
        case NLayoutTypeTitleImage:
            return [TitleImageCell class];
            break;
        case NLayoutTypeComposite:
            return [TitleAndTitleImageCell class];
            break;
        default:
            return [TitleCell class];
            break;
    }
}

#pragma mark - Getter
- (NSArray<News*> *)newses {
    if(!_newses){
        _newses = [TempDataGenerator newses];
    }

    return _newses;
}
@end
