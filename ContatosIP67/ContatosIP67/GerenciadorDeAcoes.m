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
                                          destructiveButtonTitle:@"❗destructo"
                                               otherButtonTitles:@"🔱lig",@"🔰emaiu",@"📛çaitê",@"Map",nil];
    [opcoes showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //switch;
}
@end
