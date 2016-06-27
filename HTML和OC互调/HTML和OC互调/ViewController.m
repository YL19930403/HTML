//
//  ViewController.m
//  HTML和OC互调
//
//  Created by 余亮 on 16/6/27.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///加载网页1
//    [self loadindex];
    
    ///加载网页2
    [self loadindex2];
    
    
}

- (void) loadindex{
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webV loadRequest:request];
}

- (void)  updateindex1{
    //删除
    NSString * str = @"var word = document.getElement('word');";
    NSString * str2 = @"word.remove()";
    [_webV stringByEvaluatingJavaScriptFromString:str ];
    [_webV stringByEvaluatingJavaScriptFromString:str2 ];
    
    //更改  “你好”  为  “你真的好吗”
    NSString * str3 = @"var change=document.getElementsByClassName('change')[0];"
    "change.innerHTML='你真的好吗';" ;
    [_webV stringByEvaluatingJavaScriptFromString:str3 ];
    
    //插入图片
    NSString * str4  = @"var img=document.createElement('img');"
    "img.src='IMG_4522.jpg';"
    "img.width = 160 ;"
    "img.height = 160 ;"
    "document.body.appendChild(img);" ;
    [_webV stringByEvaluatingJavaScriptFromString:str4 ];

    
}



- (void) loadindex2{
    NSURL * url = [[NSBundle mainBundle] URLForResource:@"index2" withExtension:@"html"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webV loadRequest:request];
}

- (void)  updateindex2{
    //删除index2.html 的footer
    NSString *str5 =@"document.getElementById('footer').remove();";
    [_webV stringByEvaluatingJavaScriptFromString:str5];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    ///修改网页1
//    [self updateindex1] ;
    
    ///修改网页2
    [self updateindex2] ;

}

@end


















