module Gloss_Functions.GlossData where
import LI12223 ( Jogo(..), Jogador(Jogador), Coordenadas, Mapa(..), Obstaculo(Arvore, Tronco, Carro, Nenhum), Terreno(Relva, Rio, Estrada) )
import Graphics.Gloss ( Picture, Display(FullScreen) )

data OpcoesMenu = JOGAR
            | SOBRE
            | SAIR

data PaginaAtual = OPCOES OpcoesMenu
          | JOGO
          | PAUSA
          | DERROTA

-- type Estado = (Jogo, Texturas, tamanhoJanela, PaginaAtual, PontuaçãoAtual, Pontuações, LarguraDoMapa)
type Estado = (Jogo, Texturas, (Int, Int), PaginaAtual, Int , [Int], Int)
type Texturas = [Picture]

tamanhoChunk :: Float
tamanhoChunk = 100

getInitialX :: Int -> Float
getInitialX larguraMapa = - (fromIntegral larguraMapa * tamanhoChunk) / 2 +  (tamanhoChunk / 2)

getInitialY :: Int -> Float
getInitialY alturaJanela = (fromIntegral alturaJanela / 2) - (tamanhoChunk / 2)

mapaInicial = Mapa 8 [(Estrada (-3), [Nenhum,Carro,Nenhum,Nenhum,Carro,Carro,Nenhum,Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]), (Rio 1, [Tronco,Nenhum,Nenhum,Tronco,Tronco,Nenhum,Nenhum,Nenhum]),(Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum]), (Estrada (-2) , [Nenhum,Carro,Nenhum,Nenhum,Carro,Carro,Nenhum,Nenhum]), (Estrada (-1) , [Nenhum,Carro,Nenhum,Nenhum,Carro,Carro,Nenhum,Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum]), (Relva , [Arvore,Arvore,Nenhum,Nenhum,Nenhum,Nenhum, Nenhum, Arvore]), (Relva , [Arvore,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Nenhum,Arvore])] 

estadoInicial :: Texturas -> (Int, Int) -> Estado
estadoInicial texturas tamanhoJanela = (Jogo (Jogador getPosInicial) mapaInicial, texturas, tamanhoJanela, OPCOES JOGAR , 0 , [] , 8 )
  where getPosInicial :: Coordenadas
        getPosInicial = getPosInicial_ mapaInicial
          where getPosInicial_ :: Mapa -> (Int, Int)
                getPosInicial_ (Mapa largura linhasMap@((_, linhaMapa) : _)) = (div (length linhaMapa) 2, length linhasMap - 4)

fr :: Int
fr = 1

dm :: Display
dm = FullScreen