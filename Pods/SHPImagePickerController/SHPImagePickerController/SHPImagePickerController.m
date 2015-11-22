//
//  SHPImagePickerController.m
//  
//
//  Created by 刘子洋 on 15/1/19.
//  Copyright (c) 2015年 刘子洋. All rights reserved.
//

#import "SHPImagePickerController.h"

typedef void(^SuccessBlock)(UIImage *image);

@interface SHPImagePickerController () <UIImagePickerControllerDelegate>

@property (strong, nonatomic) SuccessBlock successBlock;
@property (strong, nonatomic) UIImagePickerController *pickerController;
@property (assign, nonatomic) BOOL autoDismiss; //default: YES
@property (assign, nonatomic) BOOL allowEditing; //default: YES
@end

@implementation SHPImagePickerController

- (id)init{
    self = [super init];
    if (self){
    }
    return self;
}

+ (id)sharedPicker {
    static SHPImagePickerController *_sharedPicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPicker = [[self alloc] init];
    });
    return _sharedPicker;
}

+ (void)showImagePickerOfType:(SHPImagePickerType)type fromViewController:(UIViewController *)viewController success:(void (^)(UIImage *))success{
    [self showImagePickerOfType:type
             fromViewController:viewController
                        success:success
                    autoDismiss:YES];
}

+ (void)showImagePickerOfType:(SHPImagePickerType)type fromViewController:(UIViewController *)viewController success:(void (^)(UIImage *))success autoDismiss:(BOOL)autoDismiss{
    [self showImagePickerOfType:type
             fromViewController:viewController
                        success:success
                    autoDismiss:autoDismiss
                   allowEditing:YES];
}

+ (void)showImagePickerOfType:(SHPImagePickerType)type
           fromViewController:(UIViewController *)viewController
                      success:(void (^)(UIImage *))success
                  autoDismiss:(BOOL)autoDismiss
                 allowEditing:(BOOL)allowEditing{
    UIImagePickerControllerSourceType sourceType = (type == SHPImagePickerTypeCamera)? UIImagePickerControllerSourceTypeCamera:UIImagePickerControllerSourceTypePhotoLibrary;
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]){
        NSLog(@"Source Type not available");
        success(nil);
        return;
    }
    SHPImagePickerController *sharedHelper = [self sharedPicker];
    sharedHelper.successBlock = ^(UIImage *image){
        success(image);
    };
    sharedHelper.pickerController = [[UIImagePickerController alloc] init];
    [sharedHelper.pickerController setSourceType:sourceType];
    
    sharedHelper.autoDismiss = autoDismiss;
    [sharedHelper.pickerController setAllowsEditing:allowEditing];
    [sharedHelper.pickerController setDelegate:[self sharedPicker]];
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
