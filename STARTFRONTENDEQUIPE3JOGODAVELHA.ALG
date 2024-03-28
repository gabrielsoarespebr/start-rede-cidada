Algoritmo "StartFrontendEquipe3JogoDaVelha"
// Equipe: Gabriel, Isabella, Luciana, Sabrina, Vinicius
Var

 corTexto,corFundo,jogadorX,jogadorO,posicaoTexto: caractere
 placarX,placarO,indexLinha,indexColuna,posicao,jogadorAtualIndex: inteiro
 m: vetor[1..3,1..3] de caractere
 vitoria: logico
 sequenciaVitoria: vetor[1..8,1..3] de caractere
 jogadasX: vetor[1..5] de caractere
 jogadasO: vetor[1..5] de caractere
 opcaoTema: inteiro
 
 // Mudar tema
 procedimento MudarTema()
 inicio
        Escreval("----------------------------")
        Escreval("    PALETA DE COR ATUAL")
        Escreval("----------------------------")
        Escreval("Cor do texto: ",corTexto)
        Escreval("Cor do fundo: ",corFundo)
        Escreval("----------------------------")
        Escreval
        Escreval("----------------------------")
        Escreval("     TEMAS DISPONÍVEIS")
        Escreval("----------------------------")
        Escreval(" [1] Tema claro")
        Escreval(" [2] Tema escuro")
        Escreval("Escolha o tema: ")
        Leia(opcaoTema)
        
        Se (opcaoTema = 1) entao
           corTexto <- "Preto"
           corFundo <- "Branco"
        FimSe
        
        Se (opcaoTema = 2) entao
           corTexto <- "Branco"
           corFundo <- "Preto"
        FimSe
     
     MudaCor(corTexto,"Frente")
     MudaCor(corFundo,"Fundos")
     
     Menu()
 fimprocedimento
 
 // Cadastrar jogador
 procedimento CadastrarJogador()
 inicio
       Escreval("----------------------------")
       Escreval("    CADASTRO DE JOGADORES")
       Escreval("----------------------------")
       Escreva("Jogador X, insira seu nome: ")
       Leia(jogadorX)
       Escreva("Jogador O, insira seu nome: ")
       Leia(jogadorO)
 fimprocedimento
 
 // Placar
 procedimento Placar()
 var
    opcao: caractere
 inicio
       Escreval("----------------------------")
       Escreval("           PLACAR")
       Escreval("----------------------------")
       Escreval(jogadorX," (Jogador X):",placarX," vitorias")
       Escreval(jogadorO," (Jogador O):",placarO," vitorias")
       Escreval
       Escreva("Voltar ao menu? [S/N] ")
       Leia(opcao)
       
       Se ((opcao = "S") ou (opcao = "s")) entao
          Menu()
       Senao
          EncerrarJogo()
       FimSe
 fimprocedimento
 
 // Encerrar jogo
 procedimento EncerrarJogo()
 inicio
       Escreval("----------------------------")
       Escreval("       JOGO ENCERRADO")
       Escreval("----------------------------")
 fimprocedimento
 
 // Decidir primeiro jogador
 funcao DecidirPrimeiroJogador(): inteiro
 var
    numeroAleatorio: inteiro
 inicio
       numeroAleatorio <- randi(2) + 1
       retorne numeroAleatorio
 fimfuncao
 
 // Definir sequêcias de vitória
 procedimento DefinirSequenciasVitoria()
 inicio
        sequenciaVitoria[1,1] <- "1"
        sequenciaVitoria[1,2] <- "2"
        sequenciaVitoria[1,3] <- "3"

        sequenciaVitoria[2,1] <- "4"
        sequenciaVitoria[2,2] <- "5"
        sequenciaVitoria[2,3] <- "6"

        sequenciaVitoria[3,1] <- "7"
        sequenciaVitoria[3,2] <- "8"
        sequenciaVitoria[3,3] <- "9"

        sequenciaVitoria[4,1] <- "1"
        sequenciaVitoria[4,2] <- "4"
        sequenciaVitoria[4,3] <- "7"

        sequenciaVitoria[5,1] <- "2"
        sequenciaVitoria[5,2] <- "5"
        sequenciaVitoria[5,3] <- "8"

        sequenciaVitoria[6,1] <- "3"
        sequenciaVitoria[6,2] <- "6"
        sequenciaVitoria[6,3] <- "9"

        sequenciaVitoria[7,1] <- "1"
        sequenciaVitoria[7,2] <- "5"
        sequenciaVitoria[7,3] <- "9"

        sequenciaVitoria[8,1] <- "3"
        sequenciaVitoria[8,2] <- "5"
        sequenciaVitoria[8,3] <- "7"
 fimprocedimento
 
 // Vez de jogar
 funcao VezDeJogar(jogadorAtualIndex: inteiro): inteiro
 var
    index: inteiro
 inicio
       Se (jogadorAtualIndex = 0) entao
          index <- DecidirPrimeiroJogador()
       Senao
            Se (jogadorAtualIndex = 1) entao
               index <- 2
            Senao
               index <- 1
            FimSe
       FimSe

       retorne index
 fimfuncao
 
 // Decidir primeiro jogador
 procedimento AtualizarTabuleiro()
 inicio
       posicao <- 0

       Para indexLinha de 1 ate 3 faca
             Para indexColuna de 1 ate 3 faca
                  posicao <- posicao + 1
                  posicaoTexto <- NumpCarac(posicao)
                  m[indexLinha,indexColuna] <- posicaoTexto
             FimPara
        FimPara
 fimprocedimento
 
 // Tabuleiro
 procedimento Tabuleiro()
 var
    posicaoEscolhida,linha,coluna,i,j,k,qtdJogadasX,qtdJogadasO,qtdJogadasTotal,qtdAcertosX,qtdAcertosO: inteiro
    jogadorAtual,simboloAtual,opcao: caractere
 inicio
 
       Se (opcaoTema = 1) entao
          MudaCor("Preto","Frente")
        FimSe
        
       Se (opcaoTema = 2) entao
          MudaCor("Branco","Frente")
        FimSe
       
       Se ((jogadorX = "") ou (jogadorO = "")) entao
           CadastrarJogador()
       FimSe

       Repita
          LimpaTela
          
          jogadorAtualIndex <- VezDeJogar(jogadorAtualIndex)

          Se (jogadorAtualIndex = 1) entao
             jogadorAtual <- jogadorX
             simboloAtual <- "X"
          Senao
             jogadorAtual <- jogadorO
             simboloAtual <- "O"
          FimSe
          
          Escreval
          Escreval("+-----+-----+-----+")
          Escreval("|  ",m[1,1],"  |  ",m[1,2],"  |  ",m[1,3],"  |")
          Escreval("+-----+-----+-----+")
          Escreval("|  ",m[2,1],"  |  ",m[2,2],"  |  ",m[2,3],"  |")
          Escreval("+-----+-----+-----+")
          Escreval("|  ",m[3,1],"  |  ",m[3,2],"  |  ",m[3,3],"  |")
          Escreval("+-----+-----+-----+")
          Escreva("Jogador ",jogadorAtual,", escolha uma posição: ")
          Leia(posicaoEscolhida)
          
          Se (jogadorAtualIndex = 1) entao
             qtdJogadasX <- qtdJogadasX + 1
             jogadasX[qtdJogadasX] <- NumpCarac(posicaoEscolhida)
          Senao
             qtdJogadasO <- qtdJogadasO + 1
             jogadasO[qtdJogadasO] <- NumpCarac(posicaoEscolhida)
          FimSe

          Se ((posicaoEscolhida >= 1) e (posicaoEscolhida <= 3)) entao
             linha <- 1
             coluna <- posicaoEscolhida
          FimSe

          Se ((posicaoEscolhida >= 4) e (posicaoEscolhida <= 6)) entao
             linha <- 2
             coluna <- posicaoEscolhida - 3
          FimSe
          
          Se ((posicaoEscolhida >= 7) e (posicaoEscolhida <= 9)) entao
             linha <- 3
             coluna <- posicaoEscolhida - 6
          FimSe

          m[linha,coluna] <- simboloAtual
          
          Para i de 1 ate 8 faca
                qtdAcertosX <- 0

                Para j de 1 ate 3 faca
                     Para k de 1 ate 5 faca
                          Se (sequenciaVitoria[i,j] = jogadasX[k]) entao
                             qtdAcertosX <- qtdAcertosX + 1
                          FimSe
                     FimPara
                FimPara

                Se (qtdAcertosX = 3) entao
                   vitoria <- verdadeiro
                FimSe
          FimPara
          
          Para i de 1 ate 8 faca
                qtdAcertosO <- 0

                Para j de 1 ate 3 faca
                     Para k de 1 ate 5 faca
                          Se (sequenciaVitoria[i,j] = jogadasO[k]) entao
                             qtdAcertosO <- qtdAcertosO + 1
                          FimSe
                     FimPara
                FimPara

                Se (qtdAcertosO = 3) entao
                   vitoria <- verdadeiro
                FimSe
          FimPara
          
          qtdJogadasTotal <- qtdJogadasTotal + 1
       ate ((vitoria = verdadeiro) ou (qtdJogadasTotal = 9))

       LimpaTela
       
       Escreval
       Escreval("+-----+-----+-----+")
       Escreval("|  ",m[1,1],"  |  ",m[1,2],"  |  ",m[1,3],"  |")
       Escreval("+-----+-----+-----+")
       Escreval("|  ",m[2,1],"  |  ",m[2,2],"  |  ",m[2,3],"  |")
       Escreval("+-----+-----+-----+")
       Escreval("|  ",m[3,1],"  |  ",m[3,2],"  |  ",m[3,3],"  |")
       Escreval("+-----+-----+-----+")

       Se (vitoria = verdadeiro) entao
          MudaCor("Verde","Frente")
          
          Escreval("Jogador ",jogadorAtual," ganhou!")
          
          Se (jogadorAtual = jogadorX) entao
             placarX <- placarX + 1
          Senao
               placarO <- placarO + 1
          FimSe

          vitoria <- falso
       Senao
            Escreval("Empate!")
       FimSe
       
       AtualizarTabuleiro()
       
       qtdJogadasX <- 0
       qtdJogadasO <- 0
       qtdAcertosX <- 0
       qtdAcertosO <- 0
       
       Para i de 1 ate 5 faca
            jogadasX[i] <- ""
            jogadasO[i] <- ""
       FimPara
       
       Escreval("Jogar novamente? [S/N]")
       Leia(opcao)
       
       Se (opcao = "S") ou (opcao = "s") entao
          Tabuleiro()
       Senao
            Se (opcaoTema = 1) entao
               MudaCor("Preto","Frente")
                MudaCor("Branco","Fundos")
             FimSe

             Se (opcaoTema = 2) entao
                MudaCor("Branco","Frente")
                MudaCor("Preto","Fundos")
             FimSe

            Menu()
       FimSe
 fimprocedimento

 // Menu
 procedimento Menu()
 var
    opcao: inteiro
 inicio
       LimpaTela
       
       Enquanto ((opcao > 5) ou (opcao < 1)) faca
          Escreval("----------------------------")
          Escreval("START - FRONT END - EQUIPE 3")
          Escreval("       JOGO DA VELHA")
          Escreval("----------------------------")
          Escreval
          Escreval("----------------------------")
          Escreval("       MENU DE OPÇÕES")
          Escreval("----------------------------")
          Escreval(" [1] Jogar/Jogar novamente")
          Escreval(" [2] Ver o placar")
          Escreval(" [3] Mudar tema")
          Escreval(" [4] Cadastrar/Trocar nome de jogador")
          Escreval(" [5] Sair")
          Escreval("ESCOLHA A OPÇÃO: ")
          Leia(opcao)
          
          LimpaTela

          Escolha opcao
                  Caso 1
                       Tabuleiro()
                  Caso 2
                       Placar()
                  Caso 3
                       MudarTema()
                  Caso 4
                       CadastrarJogador()
                       Menu()
                  Caso 5
                       EncerrarJogo()
                  OutroCaso
                       Escreval
                       Escreval("# # # # # # # # # # # # # # #")
                       Escreval("#   ERRO: Opção inválida!   #")
                       Escreval("# # # # # # # # # # # # # # #")
                       Escreval
          FimEscolha
       FimEnquanto
 fimprocedimento

Inicio
        opcaoTema <- 2
        
        vitoria <- falso

        DefinirSequenciasVitoria()
        
        AtualizarTabuleiro()
        
        Menu()

Fimalgoritmo