//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDAO.h"
#import "Contato.h"

@implementation ContatoDAO
static ContatoDAO* defaultDAOInstance = nil;

-(void)adiciona:(Contato*)contato{
    [self.contatos addObject:contato];
    //NSLog(@"Contatos:%@",self.contatos);
}

//pseudo singleton
-(id)init{
    self = [super init];
    if(self){
        _contatos = [NSMutableArray new];
    }
    return self;
}

+(ContatoDAO*)instancia{
    if (!defaultDAOInstance) {
        defaultDAOInstance = [ContatoDAO new];
    }
    return defaultDAOInstance;
}
-(Contato*)buscaContatoDaPosicao:(NSInteger) posicao{
    return self.contatos[posicao];
}
-(NSInteger)buscaPosicaoDoContato:(Contato*) contato{
    return [self.contatos indexOfObject:contato];
}

@end
