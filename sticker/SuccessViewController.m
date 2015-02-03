//
//  SuccessViewController.m
//  sticker
//
//  Created by LiuZiyang on 15/2/3.
//  Copyright (c) 2015年 LiuZiyang. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.image;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveButtonPressed:(id)sender {
    UIImageWriteToSavedPhotosAlbum(self.image,
                                   self,
                                   @selector(image:didFinishSavingWithError:contextInfo:),
                                   nil);
}

- (void)               image: (UIImage *) image
    didFinishSavingWithError: (NSError *) error
                 contextInfo: (void *) contextInfo{
    if (!error){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"图片保存成功"
                                                        message:@"请前往相册查看"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"图片保存失败"
                                                        message:@"请检查是否已经授权访问相册"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
