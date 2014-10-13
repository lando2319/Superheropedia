//
//  ViewController.m
//  SuperHeropedia
//
//  Created by MIKE LAND on 10/13/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "SuperHeroController.h"

@interface SuperHeroController () <UITableViewDataSource, UITableViewDelegate>
@property NSDictionary *supermanDictionary;

@end

@implementation SuperHeroController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.supermanDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Superman", @"name", @"Krypton", @"home", nil];
    NSLog(@"%@", [self.supermanDictionary objectForKey:@"name"]);
    NSLog(@"%@", [self.supermanDictionary objectForKey:@"home"]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = [self.supermanDictionary objectForKey:@"name"];
    cell.detailTextLabel.text = [self.supermanDictionary objectForKey:@"home"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

@end
