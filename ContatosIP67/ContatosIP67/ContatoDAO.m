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
static ContatoDAO* instancia;
-(void)adiciona:(Contato*)contato{
    [self.contatos addObject:contato];
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
    if (!instancia) {
        instancia = [ContatoDAO new];
    }
    return instancia;
}
@end
