//
//  ContactListViewController.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContactListViewController.h"
#import "ContactFormViewController.h"

@implementation ContactListViewController
-(id)init{
    self = [super init];
    if(self){
        UIBarButtonItem* adiciona =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                      target:self
                                                      action:@selector(abreForm)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

-(void)abreForm {
    NSLog(@"Formularius Abriconos");
    /*/penca de comandos pra abrir um alert
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"⚡️Whoa there broh⚡️"
                                                                   message:@"🍻PAGINA EM CONSTRUCAO🍻"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"🎰OK,fazer o que né🎰?" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];*/
    UIStoryboard* board = [UIStoryboard storyboardWithName:@"Main"
                                                    bundle:nil];
    ContactFormViewController* form =[board instantiateViewControllerWithIdentifier:@"form-contato"];
    [self.navigationController pushViewController:form animated:YES];
}

@end
