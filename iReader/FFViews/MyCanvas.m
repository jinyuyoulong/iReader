//
//  MyCanvas.m
//  iReader
//
//  Created by fans on 15/9/26.
//  Copyright (c) 2015年 FF. All rights reserved.
//

#import "MyCanvas.h"

@implementation MyCanvas


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor colorWithRed:101.0/255 green:61.0/255 blue:0 alpha:1.0]set];//设置文字颜色
    
    int iCols = 0;//文字显示的列数
    
    int iRows = 0;//文字显示的行数
    
    int iSpace = 0;//文字的空格数
    
    NSString *sTitle = self.title;
    
    int titleLen = (int)[sTitle length];
    
    for(int i = 0; i < titleLen; i++)
        
    {
        
        int iPosX = 1 - iCols * 1;//iPosX是屏幕上x轴的坐标、FONT_LINE_HEIGHT是行高
        
        int iPosY = 1 + iRows * 1 + iSpace * 1;//iPosY是屏幕上y轴的坐标、FONT_LINE_WIDTH是行宽、FONT_LINE_SPACE是空格大小
        
        CGPoint point = CGPointMake(iPosX, iPosY);
        
        NSString *sTemp = [sTitle substringWithRange:NSMakeRange(i, 1)];
        
        if([sTemp isEqualToString:@" "])//判断是否有空格
            
        {
            
            iSpace ++;
            
        }
        
        else if([sTemp isEqualToString:@"\n"])//判断是否换行
            
        {
            
            iRows = 0;
            
            iCols ++;
            
        }
        
        else{
            
//            [sTemp drawAtPoint:point withFont:];//将文字画在画布上指定的位置
            NSDictionary * dic = @{NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter-Bold" size:12.0]};
            [sTemp drawAtPoint:point withAttributes:dic];
            iRows ++;
            
        }
        
    }
    
    


}


@end
