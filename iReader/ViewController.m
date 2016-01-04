//
//  ViewController.m
//  iReader
//
//  Created by fans on 15/9/25.
//  Copyright (c) 2015年 FF. All rights reserved.
//

#import "ViewController.h"
#import "MyCanvas.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * text = @"有其区别。道家与道教的教义不仅不同，甚至相反。道家教人顺乎自然，而道教教人反乎自然。举例来说，照老子、庄子讲，生而有死是自然过程，人应当平静地顺着这个自然过程。但是道教的主要教义则是如何避免死亡的原理和方术，显然是反乎自然而行的。道教有征服自然的科学精神。对中国科学史有兴趣的人，可以从道士的著作中找到许多资料。\n作为哲学的佛学与作为宗教的佛教，也有区别。受过教育的中国人，对佛学比对佛教感兴趣得多。中国的丧祭，和尚和道士一齐参加，这是很常见的。中国人即使信奉宗教，也是有哲学意味的。\n现在许多西方人都知道，与别国人相比，中国人一向是最不关心宗教的。例如，德克·布德教授(DerkBodde)有篇文章，《中国文化[…]”\n\n摘录来自: fans. “未命名”。 iBooks. ";
    NSMutableAttributedString * attributeStr = [[NSMutableAttributedString alloc]initWithString:text];
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14],
                           NSVerticalGlyphFormAttributeName:@1,
                           NSForegroundColorAttributeName:[UIColor redColor]
                           };
    [attributeStr addAttributes:dic range:NSMakeRange(0, text.length)];
    self.mLabel.numberOfLines = 0;
    self.mLabel.attributedText = attributeStr;
    
    NSURL * baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString * path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"html"];
    NSString * html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:html  baseURL:baseURL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
