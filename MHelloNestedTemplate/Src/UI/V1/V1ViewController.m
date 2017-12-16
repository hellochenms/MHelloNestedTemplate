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
#import "CompositeCell.h"
#import "NodeHelper.h"
#import "CompositeLayout.h"
#import "FriendsCell.h"
#import "NormalNodeDecorator.h"

@interface V1ViewController ()<
UITableViewDataSource,
UITableViewDelegate,
NormalNodeDecoratorProtocol>
@property (nonatomic) NSArray<News *> *newses;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *scrollToSomewhereButton;
@property (nonatomic) NormalNodeDecorator *nodeDecorator;

@end

@implementation V1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.estimatedRowHeight = 0;
    self.scrollButton.hidden = YES;
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
        // 注入header/footer
        [self.nodeDecorator decorateNode:cell.node];
    }

    cell.node.indexPath = indexPath;
    [cell.node configWithNews:news];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.newses objectAtIndex:indexPath.row];
    Class cellClass = [self cellClassForNews:news];
    __weak typeof(self) weakSelf = self;
    double height = [cellClass heightForNews:news
                         decorateLayoutBlock:^(NodeLayout *layout) {
                             // 注入header/footer
                             [weakSelf.nodeDecorator decorateLayout:layout];
                         }];
    
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
        case NLayoutTypeFriends:
            return [FriendsCell class];
            break;
        case NLayoutTypeComposite:
            return [CompositeCell class];
            break;
        default:
            return [TitleCell class];
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = (Cell *)[tableView cellForRowAtIndexPath:indexPath];
    if ([NodeHelper isCompositeNode:cell.node]) {
        return;
    }
    
    News *news = [self.newses objectAtIndex:indexPath.row];
}

#pragma mark - Event
- (IBAction)onTapScrollToSomewhere:(id)sender {
    return;
    
    NSInteger nid = 501; //temp
    
    __block News *targeNews = nil;
    __block double offsetY = 0;
    [self.newses enumerateObjectsUsingBlock:^(News * _Nonnull news, NSUInteger idx, BOOL * _Nonnull stop) {
        if (news.nid == nid) {
            targeNews = news;
            CGRect frame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
            offsetY = CGRectGetMinY(frame);
            *stop = YES;
        } else if (news.subNewses && [news.subNewses count] > 0) {
            __block News *lastSubNews = nil;
            __block double y = CGRectGetHeight(((CompositeLayout *)news.layout).headerFrame);
            [news.subNewses enumerateObjectsUsingBlock:^(News * _Nonnull subNews, NSUInteger subIdx, BOOL * _Nonnull stop) {
                if (subNews.nid == nid) {
                    targeNews = subNews;
                    CGRect frame = [self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
                    offsetY = CGRectGetMinY(frame) + y;
                    *stop = YES;
                }
                lastSubNews = subNews;
                y += lastSubNews.layout.height;
            }];
            if (targeNews) {
                *stop = YES;
            }
        }
    }];
    
    if (offsetY > 0) {
        [self.tableView setContentOffset:CGPointMake(0, offsetY) animated:YES];
    }
}

#pragma mark - NormalNodeDecoratorProtocol
- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didTapUnfoldIndexPath:(NSIndexPath *)indexPath {
    if (!indexPath) {
        return;
    }
    
//    [self.tableView reloadData];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didTapFooterButton:(News *)news {
    NSLog(@"【chenms】news:%@  %s", news.title, __func__);
}

- (void)normalNodeDecorator:(NormalNodeDecorator *)decorator didSelectCompositeSubNews:(News *)news {
    NSLog(@"【chenms】news:%@  %s", news.title, __func__);
}

#pragma mark - Getter
- (NSArray<News*> *)newses {
    if(!_newses){
        _newses = [TempDataGenerator newses];
    }

    return _newses;
}

- (NormalNodeDecorator *)nodeDecorator {
    if(!_nodeDecorator){
        _nodeDecorator = [NormalNodeDecorator new];
        _nodeDecorator.delegate = self;
    }

    return _nodeDecorator;
}

@end
