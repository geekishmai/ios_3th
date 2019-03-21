//
//  ViewController.m
//  test1
//
//  Created by mai on 2019/3/16.
//  Copyright © 2019年 mai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableview= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    
    [self.view addSubview:_tableview];
    
}
- (NSInteger)	:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=@"cell";
    UITableViewCell* strCell=[_tableview dequeueReusableCellWithIdentifier:str];
    if(strCell==nil){
        strCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    NSString* contain=[NSString stringWithFormat:@"第%d行,第%d组",indexPath.row,indexPath.section];
    strCell.textLabel.text=contain;
    return strCell;
}




@end
