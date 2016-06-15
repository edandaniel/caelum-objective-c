//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios6400 on 6/15/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "GerenciadorDeAcoes.h"

@implementation GerenciadorDeAcoes
-(id)initWithContato:(Contato*)contato{
    self = [super init];
    if(self) self.contato = contato;
    return self;
}

-(void)acoesDoController:(UIViewController*)controller{
    self.controller = controller;
    UIActionSheet* opcoes = [[UIActionSheet alloc] initWithTitle:self.contato.nome
                                                        delegate:self
                                               cancelButtonTitle:@"🈸 cancel"
                                          destructiveButtonTitle:nil//@"❗destructo"
                                               otherButtonTitles:@"🔱lig",@"📛çaitê",@"🔰emaiu",@"🗾Map",nil];
    [opcoes showInView:controller.view];
}

  -(void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch(buttonIndex){
        case 0:
            [self ligar];
            break;
        case 1:
            [self surfar];
            break;
        case 2:
            [self email];
            break;
        case 3:
            [self gps];
            break;
        default:break;
    }
}
-(void)abreAppComUrl:(NSString*)url{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

-(void) ligar{
    UIDevice* device = [UIDevice currentDevice];
    if([device.model isEqualToString:@"iPhone"]){
        NSString* num= [NSString stringWithFormat:@"tel:%@",self.contato.tel] ;
        [self abreAppComUrl:num];
    }else{
        [[UIAlertView alloc] initWithTitle:@"WAOW"
                                   message:@"LIGACAO IMPOSSIVEL DE FAZER NESSE APARELHO PORQUE NAO E UM IPHONEZ"
                                  delegate:nil
                         cancelButtonTitle:@"okz"
                         otherButtonTitles:nil];
    }
}

-(void) surfar{
    NSString* url = self.contato.site;
    if(![url hasPrefix:@"http://"])
        url = [NSString stringWithFormat:@"http://%@",url];
    [self abreAppComUrl:url];
}

-(void) email{
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController* mail = [MFMailComposeViewController new];
        [mail setToRecipients:@[self.contato.email]];
        mail.mailComposeDelegate = self;
        [self.controller presentViewController:mail
                                      animated:YES
                                    completion:nil];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self.controller dismissViewControllerAnimated:YES
                                        completion:nil];
}
         
-(void) gps{
    NSString* url= [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@",self.contato.mail]
     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abreAppComUrl:url];
}

@end
