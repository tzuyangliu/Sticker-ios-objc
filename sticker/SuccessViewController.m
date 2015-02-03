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
                                   nil,
                                   nil);
}

@end
