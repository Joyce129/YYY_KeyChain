//
//  ViewController.m
//  KeyChain
//
//  Created by Jean on 2018/12/5.
//  Copyright © 2018年 北京易盟天地信息技术股份有限公司. All rights reserved.
//

#import "ViewController.h"

#import "YYYKeyChainTool.h"

#import "UILabel+Extension.h"

@interface ViewController ()

@property(nonatomic,strong)UITextField *userNameTextField;

@property(nonatomic,strong)UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 30)];
    leftLabel.text = @"钥匙串存储数据";
    leftLabel.textAlignment = NSTextAlignmentCenter;
    leftLabel.textColor = [UIColor blackColor];
    leftLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:leftLabel];
    
    NSArray *leftArray = @[@"用户名",@"密码"];
    NSArray *placeArray = @[@"请输入用户名",@"请输入密码"];
    for (int i=0; i<2; i++)
    {
        UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200 + i * 50, 70, 35)];
        leftLabel.text = leftArray[i];
        leftLabel.textColor = [UIColor blackColor];
        leftLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:leftLabel];
        
        UITextField *inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 200 + i * 50, 200, 35)];
        inputTextField.tag = i + 1;
        inputTextField.borderStyle = UITextBorderStyleRoundedRect;
        inputTextField.placeholder = placeArray[i];
        inputTextField.font = [UIFont systemFontOfSize:14];
        inputTextField.textColor = [UIColor darkGrayColor];
        [self.view addSubview:inputTextField];
        if (i == 0)
        {
            self.userNameTextField = inputTextField;
        }
        else
        {
            self.passwordTextField = inputTextField;
        }
    }
    
    NSArray *titleArray = @[@"保存",@"读取",@"删除",@"清除"];
    for (int i=0; i<4; i++)
    {
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveBtn.frame = CGRectMake(30 + i * 80, 400, 50, 30);
        [saveBtn addTarget:self action:@selector(saveAction:) forControlEvents:UIControlEventTouchUpInside];
        [saveBtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [saveBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        saveBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:saveBtn];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

//保存
- (void)saveAction:(UIButton *)btn
{
    NSInteger userNameLength = self.userNameTextField.text.length;
    NSInteger passwordLength = self.passwordTextField.text.length;
    
    if (userNameLength == 0)
    {
        [self.userNameTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        return;
    }
    
    if (passwordLength == 0)
    {
        [self.passwordTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        return;
    }
    if ([btn.currentTitle isEqualToString:@"保存"])
    {
        [YYYKeyChainTool saveKeychainValue:self.userNameTextField.text key:@"userName"];
        [YYYKeyChainTool saveKeychainValue:self.passwordTextField.text key:@"password"];
        [UILabel showAlertInfoWithString:@"保存成功"];
    }
    else if ([btn.currentTitle isEqualToString:@"读取"])
    {
        self.userNameTextField.text = [YYYKeyChainTool readKeychainValue:@"userName"];
        self.passwordTextField.text = [YYYKeyChainTool readKeychainValue:@"password"];
        [UILabel showAlertInfoWithString:@"读取成功"];
    }
    else if ([btn.currentTitle isEqualToString:@"删除"])
    {
        [YYYKeyChainTool deleteKeychainValue:@"userName"];
        [YYYKeyChainTool deleteKeychainValue:@"password"];
        [UILabel showAlertInfoWithString:@"删除成功"];
    }
    else
    {
        self.userNameTextField.text = @"";
        self.passwordTextField.text = @"";
        [UILabel showAlertInfoWithString:@"清除成功"];
    }
    
}


@end
