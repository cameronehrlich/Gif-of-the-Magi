    //
    //  GMViewController.m
    //  Gif of the Magi
    //
    //  Created by Cameron Ehrlich on 2/4/13.
    //  Copyright (c) 2013 Cameron Ehrlich. All rights reserved.
    //

#import "GMViewController.h"
#import "UIImage+animatedGIF.h"
#import "GMImage.h"

@implementation GMViewController{
    NSString *html;
    NSMutableArray *images;
    NSArray *jsonArray;
}

@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://www.graphative.com/gifs/pre.txt"];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    NSError *e = nil;
    jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error: &e];
    
    images = [[NSMutableArray alloc] init];

    for(NSDictionary *item in jsonArray) {
        GMImage *newImg = [[GMImage alloc] initWithDictionary:item];
        [images addObject:newImg];
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
     
//    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0 , 0, cell.contentView.frame.size.width,cell.contentView.frame.size.height)];
//    av.backgroundColor = [UIColor clearColor];
//    av.opaque = NO;
//    av.image = [(GMImage*)[images objectAtIndex:indexPath.row] image];
//    [av setContentMode:UIViewContentModeScaleAspectFit];
//    cell.backgroundView = av;
//
    GMImage *tmp = [images objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0 , 0, tmp.width, tmp.height)];
    [webView setScalesPageToFit:YES];
    [webView setUserInteractionEnabled:NO];
    [webView loadRequest:[NSURLRequest requestWithURL:[[images objectAtIndex:indexPath.row] url]]];
    [cell setBackgroundView:webView];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [images count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[images objectAtIndex:indexPath.row] height];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
            
    [[UIPasteboard generalPasteboard] setData:[NSData dataWithContentsOfURL:[[images objectAtIndex:indexPath.row] url]] forPasteboardType:@"com.compuserve.gif"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"copied" message:@"This gif has been copied to the clipboad!" delegate:self cancelButtonTitle:@"okay" otherButtonTitles:nil, nil];
    [alert show];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

@end
