//
//  JBScrollCell.m
//  兼饼
//
//  Created by 键盘上的舞者 on 15/10/10.
//  Copyright © 2015年 键盘上的舞者. All rights reserved.
//

#import "JBScrollCell.h"
#import "JBScrollModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface JBScrollCell()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scroll;
@property(nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation JBScrollCell


-(void)setDataArray:(NSArray *)dataArray
{
    _dataArray=dataArray;
    for (int i=0; i<self.dataArray.count; i++) {
        //取模型
        JBScrollModel *data=self.dataArray[i];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=self.scroll.bounds;
        btn.tag=i;
        [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:data.imgurl] forState:UIControlStateNormal];
        [self.scroll addSubview:btn];
    }
    //调整测试图片的位置
    [self.scroll.subviews enumerateObjectsUsingBlock:^(__kindof UIButton * _Nonnull btn, NSUInteger idx, BOOL * _Nonnull stop) {
        btn.x=idx*btn.size.width;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];

    }];
    self.pageControl.currentPage=0;
    //分页数
    self.pageControl.numberOfPages=self.dataArray.count;
    //控件的尺寸
    CGSize size=[self.pageControl sizeForNumberOfPages:self.dataArray.count];
    self.pageControl.bounds=CGRectMake(0, 0, size.width, size.height);
    
    self.scroll.contentSize=CGSizeMake(self.dataArray.count*_scroll.bounds.size.width, 0);
}

-(void)btnClicked:(UIButton *)btn
{
    JBScrollModel *data=self.dataArray[btn.tag];
    if ([_delegate respondsToSelector:@selector(pageJump:pageUrl:)]) {
        [_delegate pageJump:self pageUrl:data.pageurl];
    }
}

-(void)start
{
    [self startTime];
}

//懒加载
-(UIScrollView *)scroll
{
    if (_scroll==nil) {
        _scroll=[[UIScrollView alloc] init];
    }
    return _scroll;
}
-(UIPageControl *)pageControl
{
    if(_pageControl==nil){
        _pageControl=[[UIPageControl alloc] init];
    }
    return _pageControl;
}

//这里面可以放UI布局
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //scroll的布局
        self.scroll.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 130);
        //scroll.backgroundColor=[UIColor redColor];
        self.scroll.showsHorizontalScrollIndicator=NO;
        self.scroll.showsVerticalScrollIndicator=NO;
        self.scroll.pagingEnabled=YES;
        //取消弹簧效果
        self.scroll.bounces=NO;
        self.scroll.delegate=self;
        self.scroll.backgroundColor=HWColor(0.32*255, 0.74*255, 0.54*255);
        //pageControl的布局
        
        self.pageControl.center=CGPointMake(self.center.x,110);
        //相关的属性
        self.pageControl.pageIndicatorTintColor=[UIColor redColor];
        self.pageControl.currentPageIndicatorTintColor=[UIColor blackColor];
        
        [self.contentView addSubview:self.scroll];
        [self.contentView addSubview:self.pageControl];
    }
    return self;
}


-(void) startTime
{
    self.timer=[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    //添加到运行循环
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void) valueChange:(UIPageControl *)page
{
    CGFloat x=page.currentPage*self.scroll.bounds.size.width;
    [_scroll setContentOffset:CGPointMake(x, 0) animated:YES];
}
//时钟所需要做的事情
-(void) updateTime
{
    int page=((int)(self.scroll.contentOffset.x/self.scroll.bounds.size.width)+1)%self.dataArray.count;
    self.pageControl.currentPage=page;
    [self valueChange:self.pageControl];
}
//拖拽的时候时钟停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}
//停止拖拽的时候时钟开始
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTime];
}

+(instancetype)initWithTableView:(UITableView *)tableview
{
    JBScrollCell *cell=[tableview dequeueReusableCellWithIdentifier:@"Ad_Cell"];
    if (cell==nil) {
        cell=[[JBScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Ad_Cell"];
    }
    return cell;
}

@end
