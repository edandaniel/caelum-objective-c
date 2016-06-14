//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios6400 on 6/13/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject
@property NSMutableArray* contatos;
-(void)adiciona:(Contato*)contato;
+(ContatoDAO*)instancia;
-(Contato*)buscaContatoDaPosicao:(NSInteger) posicao;
@end
