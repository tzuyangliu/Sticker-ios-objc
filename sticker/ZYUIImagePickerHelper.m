//
//  UWImagePickerHelper.m
//  uwu
//
//  Created by LiuZiyang on 15/1/19.
//  Copyright (c) 2015年 Yicheng Tech. All rights reserved.
//

#import "ZYUIImagePickerHelper.h"

typedef void(^SuccessBlock)(UIImage *image);

@interface ZYUIImagePickerHelper() <UIImagePickerControllerDelegate>

@property (strong, nonatomic) SuccessBlock successBlock;
@property (strong, nonatomic) UIImagePickerController *pickerController;
@property (assign, nonatomic) BOOL autoDismiss; //default: YES
@property (assign, nonatomic) BOOL allowEditing; //default: YES
@end

@implementation ZYUIImagePickerHelper

- (id)init{
    self = [super init];
    if (self){
        
    }
    return self;
}

+ (id)sharedHelper {
    static ZYUIImagePickerHelper *_sharedHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHelper = [[self alloc] init];
    });
    return _sharedHelper;
}

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type fromViewController:(UIViewController *)viewController success:(void (^)(UIImage *))success{
    [self showImagePickerOfType:type
             fromViewController:viewController
                        success:success
                    autoDismiss:YES];
}

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type fromViewController:(UIViewController *)viewController success:(void (^)(UIImage *))success autoDismiss:(BOOL)autoDismiss{
    [self showImagePickerOfType:type
             fromViewController:viewController
                        success:success
                    autoDismiss:autoDismiss
                   allowEditing:YES];
}

+ (void)showImagePickerOfType:(ZYUIImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss
                 allowEditing:(BOOL)allowEditing{
    ZYUIImagePickerHelper *sharedHelper = [self sharedHelper];
    sharedHelper.successBlock = ^(UIImage *image){
        success(image);
    };
    sharedHelper.pickerController = [[UIImagePickerController alloc] init];
    [sharedHelper.pickerController setSourceType:type == ZYUIImagePickerTypeCamera?UIImagePickerControllerSourceTypeCamera:UIImagePickerControllerSourceTypePhotoLibrary];
    sharedHelper.autoDismiss = autoDismiss;
    [sharedHelper.pickerController setAllowsEditing:allowEditing];
    [sharedHelper.pickerController setDelegate:[self sharedHelper]];
    [viewController presentViewController:sharedHelper.pickerController animated:YES completion:NULL];
}

#pragma mark - UIImagePicker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *theImage = nil;
    if ([picker allowsEditing]){
        theImage = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
        theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    self.successBlock(theImage);
    if (_autoDismiss){
        [self.pickerController dismissViewControllerAnimated:YES completion:NULL];
    }
    self.pickerController = nil;
}

@end
