//
//  ViewController.m
//  SuperHeropedia
//
//  Created by MIKE LAND on 10/13/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "SuperHeroController.h"

@interface SuperHeroController () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *superHeroes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SuperHeroController

- (void)viewDidLoad {
    [super viewDidLoad];


    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *supermanDictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Superman", @"name", @"Krypton", @"home", nil];
    NSLog(@"%@", [supermanDictionary objectForKey:@"name"]);
    NSLog(@"%@", [supermanDictionary objectForKey:@"home"]);
//    self.superHeroes = [NSArray arrayWithObjects:supermanDictionary, supermanDictionary, nil];
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        NSError *jsonError = nil;
        self.superHeroes = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        [self.tableView reloadData];
        NSLog(@"Connection Error: %@", connectionError);
        NSLog(@"JSON Error: %@", jsonError);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *superHero = [self.superHeroes objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    cell.textLabel.text = [superHero objectForKey:@"name"];
    cell.detailTextLabel.text = [superHero objectForKey:@"description"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.superHeroes.count;
}

@end
