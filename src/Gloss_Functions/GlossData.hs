module Gloss_Functions.GlossData where
import LI12223 ( Jogo(..), Jogador(Jogador), Coordenadas, Mapa(..), Obstaculo(Arvore, Tronco, Carro, Nenhum), Terreno(Relva, Rio, Estrada) )
import Graphics.Gloss ( Picture, Display(FullScreen) )

data OpcoesMenu = OPCAO_JOGAR
            | OPCAO_SOBRE
            | OPCAO_SAIR
            | OPCAO_SIM
            | OPCAO_NAO
            | OPCAO_CONTINUAR
            | OPCAO_MENU

data PaginaAtual = Menu OpcoesMenu
          | JOGO
          | DERROTA
          | SOBRE

-- type Estado = (Jogo, Texturas, tamanhoJanela, PaginaAtual, PontuaçãoAtual, Pontuações, LarguraDoMapa, frameAtual)
type Estado = (Jogo, Texturas, (Int, Int), PaginaAtual, Int , [Int], Int, Int)
type Texturas = [Picture]

tamanhoChunk :: Float
tamanhoChunk = 135

getInitialX :: Int -> Float
getInitialX larguraMapa = - (fromIntegral larguraMapa * tamanhoChunk) / 2 +  (tamanhoChunk / 2)

getInitialY :: Int -> Float
getInitialY alturaJanela = -(fromIntegral alturaJanela / 2) + (tamanhoChunk / 2)

mapaInicial = Mapa 8 [(Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]), (Estrada (-2) , [Nenhum,Carro,Nenhum,Nenhum,Carro,Carro,Nenhum,Nenhum]), (Estrada (1) , [Nenhum,Carro,Nenhum,Nenhum,Carro,Carro,Nenhum,Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum, Arvore])] 
--Nenhum Nenhum Carro Carro Carro 
estadoInicial :: Texturas -> (Int, Int) -> Estado
estadoInicial texturas tamanhoJanela = (Jogo (Jogador getPosInicial) mapaInicial, texturas, tamanhoJanela, Menu OPCAO_JOGAR , 0 , [] , 8, 0)
  where getPosInicial :: Coordenadas
        getPosInicial = (4,7)
          
                

fr :: Int
fr = 1

dm :: Display
dm = FullScreen