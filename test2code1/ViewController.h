//
//  ViewController.h
//  test2code1
//
//  Created by Student P_02 on 27/03/17.
//  Copyright © 2017 felix. All rights reserved.
//
//4.Create a tableview of recipes(snacks). Implement searching inside that. (NSPredicate).

#import <UIKit/UIKit.h>
//#import "myTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *recipeTable;
@property (strong, nonatomic) IBOutlet UITextField *searchText;

- (IBAction)searchAction:(id)sender;

@property NSArray *recipesArray;
@property NSArray *resultArray;

@end

