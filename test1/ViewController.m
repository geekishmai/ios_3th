//
//  ViewController.m
//  test1
//
//  Created by mai on 2019/3/16.
//  Copyright © 2019年 mai. All rights reserved.
//

#import "ViewController.h"
#import "newTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 在这里修改group/ plain样式
    _tableview= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    [self.view addSubview:_tableview];
    
    _arrayData= [[NSMutableArray alloc] init];
    for(int i=0;i<10;i++){
        NSString* tmpStr=[NSString stringWithFormat:@"A: %d",i];
        [_arrayData addObject:tmpStr];
    }
    //创建编辑按钮
    [self creatBtn];
//    NSLog(@"%s",[_arrayData objectAtIndex:2]);
    [_tableview reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrayData count];
}


//初始化cell数据核心代码
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=@"cell";
    //获得可复用的单元格
    UITableViewCell* strCell=[_tableview dequeueReusableCellWithIdentifier:str];
    if(strCell==nil){
        strCell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    NSString* contain=[NSString stringWithFormat:@"第%d行,第%d组",indexPath.row,indexPath.section];
    strCell.textLabel.text=[_arrayData objectAtIndex:indexPath.row];  //可以换成其他数据源,以数组的形式 contain
   
    return strCell;

}

//设置每行cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
//定义删除按钮
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
//滑动触发删除按钮动作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_arrayData removeObjectAtIndex:indexPath.row];
    [_tableview reloadData];
}


//选中单元格触发的动作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


-(void) creatBtn{
    _isEdit=NO;
    _btnEdit=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnDone=[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(pressDone)];
    _btnDelete=[[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    //添加buttonItem到nav
    self.navigationItem.rightBarButtonItem = _btnEdit;
}
-(void) pressEdit{
    _isEdit=YES;
    [_tableview setEditing:YES];
    self.navigationItem.leftBarButtonItem=_btnDelete;
    self.navigationItem.rightBarButtonItem=_btnDone;
}
-(void) pressDone{
    _isEdit=NO;
    [_tableview setEditing:NO];
    self.navigationItem.rightBarButtonItem=_btnEdit;
}




@end
