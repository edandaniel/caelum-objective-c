//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactFormViewController : UIViewController
// * pode ir nos 3 lugares que da certo
@property IBOutlet UITextField *nome;
@property IBOutlet UITextField* tel;
@property IBOutlet UITextField * email;
@property IBOutlet UITextField* mail;
@property IBOutlet UITextField *site;
//importante ter senao o jow nao ve
- (IBAction)getFormData;

@end

