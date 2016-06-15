//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios6400 on 6/15/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Contato.h"
@import MessageUI;

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate,MFMailComposeViewControllerDelegate>
@property Contato *contato;
@property UIViewController* controller;
-(id)initWithContato:(Contato*)contato;
-(void)acoesDoController:(UIViewController*)controller;

@end
