//
//  ViewController.h
//  test1
//
//  Created by mai on 2019/3/16.
//  Copyright © 2019年 mai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView* _tableview;
    NSMutableArray *_arrayData;
    UIBarButtonItem *_btnEdit;
    UIBarButtonItem* _btnDelete;
    UIBarButtonItem* _btnDone;
    bool _isEdit;
}

@end

