//
//  WeiboArticleViewController.m
//  WeiBo
//
//  Created by 益平廖 on 16/4/20.
//  Copyright © 2016年 Liaoyp. All rights reserved.
//

#import "WeiboArticleViewController.h"
#import "Article.h"
#import "TextContentViewCell.h"
#import "ImageContentViewCell.h"

#define KKWIDTH self.view.frame.size.width
#define KKHEIGHT self.view.frame.size.height

NSString *const WeiboArticleContentCellIdentifier = @"textContent";
NSString *const WeiboArticleImageCellIdentifier = @"imageContent";


@interface WeiboArticleViewController ()<TextContentViewCellDelegate>
{
    UITextView      *_articletitleTextView;
    NSMutableArray  *_dataSource;
}
@end

@implementation WeiboArticleViewController

#pragma - private

- (void)cancleClicked:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

- (void)addArticleClicked:(id)sender
{
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancleClicked:)];
    
    self.title = @"写文章";
    
    _dataSource = [NSMutableArray arrayWithCapacity:10];
    
    
//    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    [self.tableView registerClass:[TextContentViewCell class] forCellReuseIdentifier:WeiboArticleContentCellIdentifier];
    [self.tableView registerClass:[ImageContentViewCell class] forCellReuseIdentifier:WeiboArticleImageCellIdentifier];

    UIView *tableHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KKWIDTH, 200)];
    tableHeadView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableHeaderView = tableHeadView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect rect = CGRectInset(tableHeadView.frame, 40, 10);
    rect.size.height = tableHeadView.frame.size.height * 3.0 / 5.0;
    button.frame = rect;
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"添加封面" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addArticleClicked:) forControlEvents:UIControlEventTouchUpInside];
    [tableHeadView addSubview:button];
 
    
    _articletitleTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, button.frame.origin.y + button.frame.size.height + 15, KKWIDTH - 20, 40)];
    _articletitleTextView.text = @"标题";
    _articletitleTextView.backgroundColor = [UIColor lightTextColor];
    [tableHeadView addSubview:_articletitleTextView];

    Article *text = [Article new];
    text.type = LYPArticleTextView;
    text.content = @"填写内容";
    [_dataSource addObject:text];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Article *artice = _dataSource[indexPath.row];
    if (artice.cellHeight < 44) {
        return 44;
    }
    return artice.cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Article *artice = _dataSource[indexPath.row];
    switch (artice.type) {
        case LYPArticleTextView:
        {
            TextContentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WeiboArticleContentCellIdentifier forIndexPath:indexPath];
            cell.deleagte = self;
            cell.indexPath = indexPath;
            cell.article = artice;
            return cell;
            break;
        }
        default:
            break;
    }
    return nil;
}



- (void)textContentViewReloadWithIndexPath:(NSIndexPath *)indexpath
{
    [self.tableView reloadData];
}
- (void)textContentViewNextClickWithIndexPath:(NSIndexPath *)indexpath
{
    Article *text = [Article new];
    text.type = LYPArticleTextView;
    text.content = @"new";
    [_dataSource addObject:text];
    [self.tableView reloadData];
    
    TextContentViewCell *oldCell = [self.tableView cellForRowAtIndexPath:indexpath];
//    [oldCell.textView nextResponder];
    
    TextContentViewCell *cell  = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_dataSource.count -1 inSection:0]];
    [cell becomeFirstResponder];
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
