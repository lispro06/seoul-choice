//
//  WebViewController.h
//  choice
//
//  Created by Pak YeongSik on 12. 4. 22..
//  Copyright (c) 2012년 cap. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RSSEntry;
@interface WebViewController : UIViewController{
    UIWebView *_webView;
    RSSEntry *_entry;
}
@property (retain) IBOutlet UIWebView *webView;
@property (retain) RSSEntry *entry;

@end
