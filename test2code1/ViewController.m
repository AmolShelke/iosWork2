//
//  ViewController.m
//  test2code1
//
//  Created by Student P_02 on 27/03/17.
//  Copyright © 2017 felix. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.searchText.delegate=self;
    self.recipesArray=[NSArray arrayWithObjects:@"Rabdi",@"Pav Bhaji",@"Garlic Bread", nil];
    self.resultArray=[[NSArray alloc]init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.resultArray.count<=0)
    {
        return self.recipesArray.count;
    }
    else
    {
        return self.resultArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (self.resultArray.count <=0)
    {
        
     cell.textLabel.text=
        [self.recipesArray objectAtIndex:indexPath.row];
    }
    else{
        
    cell.textLabel.text=
        [self.resultArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (IBAction)searchAction:(id)sender {
    
    UITextField *search=sender;
    if (self.searchText.text.length>0) {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF contains[c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.recipesArray filteredArrayUsingPredicate:searchPredicate];
        [self.recipeTable reloadData];
        NSLog(@"%@",self.resultArray);

    }
}
/*-(bool)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSString *search=textField.text;
    if (self.searchText.text.length>0)
    {
        
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains [c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.recipesArray filteredArrayUsingPredicate:searchPredicate];
        [self.recipeTable reloadData];
        NSLog(@"%@",self.resultArray);
    }
    return YES;
    
}
-(bool)textFieldShouldEndEditing:(UITextField *)textField
{
    NSString *search=textField.text;
    if (self.searchText.text.length>0)
    {
        
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains [c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.recipesArray filteredArrayUsingPredicate:searchPredicate];
        [self.recipeTable reloadData];
        NSLog(@"%@",self.resultArray);
    }
    return YES;
}*/
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *search=textField.text;
    if (self.searchText.text.length>0)
    {
        
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains [c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.recipesArray filteredArrayUsingPredicate:searchPredicate];
        [self.recipeTable reloadData];
        NSLog(@"%@",self.resultArray);
     }
    return YES;
}
@end
