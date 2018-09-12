//
//  SAMeTableController.m
//  SweetAngel
//
//  Created by gongcz on 16/8/1.
//  Copyright © 2016年 GCZ. All rights reserved.
//

#import "SAMeTableController.h"
#import "UIImage+Blur.h"
#import <Accelerate/Accelerate.h>
#define STORYBOARD(storyboardName)          [UIStoryboard storyboardWithName:storyboardName bundle:nil]
#define IMAGE(name) [UIImage imageNamed:name]
static NSString *_verify;// 认证状态
@interface SAMeTableController ()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *nameConstraint;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *headClickView;

// 原背景图
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
// 模糊背景图
@property (weak, nonatomic) IBOutlet UIImageView *imageBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLab;
@property (weak, nonatomic) IBOutlet UILabel *angelNumLab;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labalArr;
@property (weak, nonatomic) IBOutlet UIImageView *attestationImage;  // 认证
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *authenticationLabelConstraint;
@property (weak, nonatomic) IBOutlet UILabel *authenticationLabel;
@property (strong, nonatomic) IBOutlet UILabel *hospitalNameLabel;//所在医院

@end

@implementation SAMeTableController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    id obj = [super initWithStyle:style];
    obj = obj;
    return [STORYBOARD(NSStringFromClass([self class])) instantiateInitialViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [netHelper_ interfaceClick:[[IMB_NetTask alloc]initWithCompleteHandler:^(id result, NSString *errMsg) {
//        
//    }] dot_type:@"27"];
    
    
    
//    for (UIView *view in self.he) {
//        UITapGestureRecognizer *tapClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewClick:)];
//        [view addGestureRecognizer:tapClick];
//    }
    
    // 已经认证之后 添加这两句代码，让用户名居中 *******************
//    self.authenticationLabelConstraint.constant = self.authenticationLabelConstraint.constant - 15;
//    self.authenticationLabel.hidden = YES;
    // *****************************************************
    
    
    // Do any additional setup after loading the view.
//    self.hidesBottomBarWhenPushed = YES;
    [self setBlurryImage:IMAGE(@"mine_bg.jpg")];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconImgClick)];
    [self.iconImg addGestureRecognizer:tap];
//    [self.iconImg cornerViewWithRadius:60.0/2];
    self.iconImg.layer.cornerRadius = 60.0/2;
    self.iconImg.layer.masksToBounds = YES;
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    NSDictionary * userInfoDic = [SARUserInfo gainUserInfo];
//    NSString *imgUrl = [userInfoDic objectForKey:@"img"];
//    [IMB_DownImageHelper downCommonImageWithURL:[NSURL URLWithString:imgUrl] imageView:self.iconImg placeHolder:HOLDAR_HEAD_CIRCLE];
//    self.nickNameLab.text = [userInfoDic objectForKey:@"name"];
//    if ([[userInfoDic objectForKey:@"hospital"] length] >0) {
//        self.hospitalNameLabel.text = [userInfoDic objectForKey:@"hospital"];
//    }
//    
//    self.angelNumLab.text = [NSString stringWithFormat:@"天使号：%@",userInfoDic[@"number"]];
//    if (![_verify isEqualToString:[userInfoDic objectForKey:@"verify"]] && _verify.length != 0 && [[userInfoDic objectForKey:@"verify"] integerValue] != 1) {
//        [self loadData];
//        return;
//    }
//    if ([[userInfoDic objectForKey:@"verify"] integerValue] == 1) {
//            self.nameConstraint.constant = 0;
////            self.authenticationLabelConstraint.constant = self.authenticationLabelConstraint.constant - 59;
//            self.authenticationLabel.hidden = YES;
//        self.attestationImage.image = [UIImage imageNamed:@"已认证"];
//    }else if ([[userInfoDic objectForKey:@"verify"] integerValue] == 2){
//        self.authenticationLabel.text = @"认证中";
//    }else if ([[userInfoDic objectForKey:@"verify"] integerValue] == 3){
//        self.authenticationLabel.text = @"认证失败";
//    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [Dialog dismissSVHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

-(void)loadData{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
//    self.angelNumLab.text = [NSString stringWithFormat:@"天使号：%@",[SARUserInfo gainUserInfo][@"number"]];
    
//    [Dialog showWithStatus:@"正在加载..." maskType:SVProgressHUDMaskTypeNone];
    
//    [netHelper_ userInfo:[[IMB_NetTask alloc] initWithCompleteHandler:^(id result, NSString *errMsg) {
//        if (REQUEST_SUCCESS_CODE == [[result objectForKey:@"code"] integerValue] && result != nil) {
////            [Dialog dismissSVHUD];
//            
//            NSString *imgUrl = result[@"data"][@"img"];
//            //            [self.iconImg sd_setImageWithURL: placeholderImage:nil];
//            [IMB_DownImageHelper downCommonImageWithURL:[NSURL URLWithString:imgUrl] imageView:self.iconImg placeHolder:HOLDAR_HEAD_CIRCLE];
//            self.nickNameLab.text = result[@"data"][@"name"];
//            if ([result[@"data"][@"hospital"] length] > 0) {
//                self.hospitalNameLabel.text = result[@"data"][@"hospital"];
//            }
//            if ([[[SARUserInfo gainUserInfo] objectForKey:@"verify"] integerValue] != 1 && [result[@"data"][@"verify"] integerValue] == 1) {
//                self.nameConstraint.constant = 0;
//                self.authenticationLabel.hidden = YES;
//                self.attestationImage.image = [UIImage imageNamed:@"已认证"];
//            }else if([result[@"data"][@"verify"] integerValue] == 2){
//            self.authenticationLabel.text = @"认证中";
//            }else if([result[@"data"][@"verify"] integerValue] == 3){
//                self.authenticationLabel.text = @"认证失败";
//            }
//            [self.labalArr[0] setText:[NSString stringWithFormat:@"%@",result[@"data"][@"vip_counts"]]];
//            [self.labalArr[1] setText:[NSString stringWithFormat:@"%@",result[@"data"][@"friend_counts"]]];
//            [self.labalArr[2] setText:[NSString stringWithFormat:@"%@",result[@"data"][@"dynamic_counts"]]];
//            [self.labalArr[3] setText:[NSString stringWithFormat:@"%@",result[@"data"][@"question_counts"]]];
//            
//            _verify = result[@"data"][@"verify"];
//            [SARUserInfo updateValue:result[@"data"][@"balance"] forKey:@"balance"];
//            [SARUserInfo updateValue:result[@"data"][@"img"] forKey:@"img"];
//            [SARUserInfo updateValue:result[@"data"][@"name"] forKey:@"name"];
//            [SARUserInfo updateValue:result[@"data"][@"friend_counts"] forKey:@"friend_counts"];
//            [SARUserInfo updateValue:result[@"data"][@"dynamic_counts"] forKey:@"dynamic_counts"];
//            [SARUserInfo updateValue:result[@"data"][@"verify"] forKey:@"verify"];
//            [SARUserInfo updateValue:result[@"data"][@"question_counts"] forKey:@"question_counts"];
//            [SARUserInfo updateValue:result[@"data"][@"birth"] forKey:@"birth"];
//        }else{
//            [Dialog showFailWithStatus:errMsg];
//        }
//    }] uid:[SARUserInfo userId]];
}

-(void)iconImgClick{
//    if ([[[SARUserInfo gainUserInfo] objectForKey:@"verify"] integerValue] == 1) {
//            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"SAMeTableController" bundle:[NSBundle mainBundle]];
//            SAMyInfoController *vc = [sb instantiateViewControllerWithIdentifier:NSStringFromClass([SAMyInfoController class])];
//            [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        SAAttestationViewController *att = [[SAAttestationViewController alloc] init];
//        att.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:att animated:YES];
//    }
    
}

/**
 *  通过scrollview的滑动改变顶部view的大小和高斯效果
 *
 *  @param offset scrollview下滑的距离
 */
-(void)updateHeaderView:(CGPoint) offset {
    if (offset.y < -20) {
        CGRect frame = self.tableView.tableHeaderView.frame;
        CGRect rect = CGRectMake(0, 0, frame.size.width, 250);
        CGFloat delta = fabs(MIN(0.0f, offset.y));
        rect.origin.y -= delta;
        rect.size.height += delta;
//        self.tableView.tableHeaderView.frame = rect;
//        self.tableView.tableHeaderView.clipsToBounds = NO;
//        MakeHeightTo(self.imageView, rect.size.height);
//        MakeHeightTo(self.imageBackgroundView, rect.size.height);
//        MakeYTo(self.imageView, rect.origin)
        self.imageView.frame = rect;
        self.imageBackgroundView.frame = rect;
        CGFloat alpha = fabs((offset.y+20) / (2 * CGRectGetHeight(rect) / 3));
        self.imageView.alpha = alpha;
    }
//    NSLog(@"%.f",offset.y);
}


/**
 *  高斯图片
 *
 *  @param originalImage 需要高斯的图片
 */
- (void)setBlurryImage:(UIImage *)originalImage {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *blurredImage = [originalImage blurredImage:0.9];//[self blurryImage:originalImage withBlurLevel:0.9];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.alpha = 0.0;
            self.imageBackgroundView.image = blurredImage;
        });
    });
    
}

#pragma mark - UITableViewDataSource & delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"--------------%f",scrollView.contentOffset.y);
    [self updateHeaderView:scrollView.contentOffset];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
