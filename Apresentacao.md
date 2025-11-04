# Comportamentos de Compra

Este projeto analisa o comportamento de compra com base em um conjunto de dados que fornece insights detalhados sobre o comportamento do consumidor e padrões de compra em diversos grupos demográficos, locais e categorias de produtos.  
Os dados contêm **3.900 registros de clientes** com **18 atributos** que descrevem detalhes de compra, hábitos de consumo e preferências.  

O objetivo é identificar padrões de consumo, segmentar clientes e compreender fatores que influenciam decisões de compra, utilizando o **Power BI** como ferramenta principal de visualização e análise.

O conjunto de dados trouxe informações como:

* **Dados demográficos do cliente** (idade, sexo, localização)
* **Detalhes do produto** (item comprado, categoria, tamanho, cor, estação)
* **Informações de compra** (valor gasto em USD, método de pagamento, tipo de envio)
* **Comportamento de compra** (frequência de compras, compras anteriores, status da assinatura, uso de descontos, códigos promocionais)
* **Comentários do cliente** (avaliações de avaliações)

## Limpeza dos Dados

O conjunto de dados foi inicialmente tratado no **MySQL**, onde foram realizadas etapas de **limpeza, verificação de dados nulos** e **contagem de categorias** em cada coluna.  
Durante essa fase, também foi criada a nova coluna **Age_Group**, responsável por agrupar os clientes em **faixas etárias**, facilitando as análises posteriores no Power BI.

### Código SQL utilizado

```sql
UPDATE comportamentos_de_compra
SET Age_Group = CASE 
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 30 THEN '26-30'
    WHEN Age BETWEEN 31 AND 35 THEN '31-35'
    WHEN Age BETWEEN 36 AND 40 THEN '36-40'
    WHEN Age BETWEEN 41 AND 45 THEN '41-45'
    WHEN Age BETWEEN 46 AND 50 THEN '46-50'
    WHEN Age BETWEEN 51 AND 55 THEN '51-55'
    WHEN Age BETWEEN 56 AND 60 THEN '56-60'
    WHEN Age BETWEEN 61 AND 65 THEN '61-65'
    ELSE '66+' 
END;
```

Após a criação da coluna e a verificação de consistência dos dados, o conjunto foi importado para o Power BI, onde foram desenvolvidas as primeiras visualizações. Para isso foram criadas medidas com contagem de clientes por faixa etária com o seguinte código DAX:

### Código DAX utilizado para contagem de clientes por faixa etária

```
Contagem de Age_Group para 18-25 = 
CALCULATE(
    COUNTA('vw_clientes_limpos'[Age_Group]),
    'vw_clientes_limpos'[Age_Group] IN { "18-25" }
)
```

Com as medidas criadas, iniciou-se a elaboração dos visuais de cartões que apresentam o total de clientes por faixa etária, permitindo compreender rapidamente a distribuição do público analisado.

## Visualizar do Painel

Abaixo está a primeira visualização desenvolvida no Power BI.
Ela apresenta cartões segmentados por faixa etária dos clientes, além de gráficos de percentual de gênero , status de assinatura e total de vendas por tamanho de produto .

<div align="center">

<img src="imagens\imagem1.png.png" alt="Dashboard Power BI – Comportamentos de Compra" width="800px" style="border-radius:10px; box-shadow:0px 0px 10px rgba(0,0,0,0.15);" />

<p><i>Figura 1 – Visual principal do Dashboard Power BI com segmentação por faixa etária, gênero, status de assinatura e vendas por tamanho.</i></p>

</div>

Iniciando a análise, tem-se o visual do Power BI apresentando informações que permitem compreender o perfil demográfico e comportamental dos consumidores , facilitando a identificação de padrões iniciais de compras e preferências.

### Cartões

Os **cartões do dashboard** apresentam o **total de clientes distribuídos por faixa etária**.  
Observa-se que a **faixa de 18 a 25 anos** concentra o **maior número de clientes**, totalizando **571 pessoas**.  
É importante destacar que essa é também a **faixa etária com maior amplitude (8 anos)**, o que pode ter contribuído para o número mais elevado de registros.

Em seguida, as faixas de **46 a 50 anos** e **56 a 60 anos** apresentam a **mesma contagem total de 382 clientes cada**, configurando-se juntas como o **segundo maior grupo** em número de consumidores.  
Logo após, vêm os clientes de **26 a 30 anos (378 clientes)**, seguidos pelas faixas de **51 a 55 anos (371 clientes)**, **41 a 45 anos (368 clientes)** e **61 a 65 anos (368 clientes)** — mostrando uma distribuição relativamente equilibrada entre essas idades intermediárias.

As faixas de **31 a 35 anos (364 clientes)** e **36 a 40 anos (361 clientes)** mantêm uma leve redução, enquanto o grupo de **66 a 70 anos** apresenta o **menor volume de compradores**, com **355 clientes**.

De forma geral, nota-se uma **maior concentração de clientes nas idades jovens e intermediárias**, com uma **tendência de queda gradual** nas faixas etárias mais elevadas.

### Percentual de Gênero

O **primeiro gráfico** apresenta a **distribuição percentual de clientes por gênero**, revelando que **68% dos compradores são homens** e **32% são mulheres**.  

Essa diferença indica uma **maior predominância do público masculino** entre os consumidores, sugerindo a oportunidade de **analisar as preferências desse grupo** para aprimorar a experiência de compra e potencializar as vendas.  

Ao mesmo tempo, o dado também destaca a importância de **investigar possíveis barreiras** que estejam impactando a participação feminina, de forma a **desenvolver estratégias mais inclusivas** e **estimular o engajamento do público feminino** na plataforma.

### Status de Assinatura

O **gráfico de Status de Assinatura** revela que apenas **27% dos clientes possuem assinatura ativa**, enquanto **73% não são assinantes**.  

Esse resultado evidencia uma **oportunidade significativa de expansão do programa de assinaturas**. Para o grupo atual de assinantes, é essencial reforçar **ações de fidelização**, como a oferta de **benefícios exclusivos**, **programas de pontos**, **descontos progressivos** e **acesso antecipado a lançamentos**, garantindo a **manutenção do vínculo**.  

Por outro lado, a alta proporção de não assinantes indica a necessidade de **estratégias de conversão direcionadas**, como campanhas que **destaquem vantagens tangíveis da assinatura** (ex.: economia, conveniência, entrega rápida, benefícios personalizados).  

Além disso, recomenda-se a análise do **perfil de ex-assinantes** para identificar motivos de cancelamento — como preço, falta de uso ou benefícios pouco atrativos —, possibilitando a criação de **ações de reativação** mais eficazes.  

Em síntese, o indicador de assinatura é um ponto-chave para o **crescimento sustentável da base de clientes** e para **aumentar a previsibilidade da receita recorrente**.

### Total de Vendas por Tamanho

O **gráfico de Total de Vendas por Tamanho** evidencia uma clara **preferência dos consumidores pelo tamanho M (médio)**, que concentra **1.755 compras**, representando a maior fatia das vendas. Em seguida, aparecem os tamanhos **L (grande)** com **1.053 vendas**, **S (pequeno)** com **663**, e por fim o **SL (plus size)** com **429 compras**.  

Essa distribuição sugere que os **produtos de tamanho médio** atendem à maior parte do público-alvo, refletindo um **perfil de consumo predominantemente dentro da média de medidas padrão**. Entretanto, o volume considerável nas categorias **L e S** indica que há **diversidade corporal significativa** entre os clientes, o que reforça a importância de **manter um portfólio equilibrado de tamanhos**.  

O baixo número de compras na categoria **SL (plus size)** pode apontar para **duas possibilidades**: uma **demanda reprimida** — ou seja, clientes que desejam comprar, mas encontram **pouca oferta ou variedade de modelos** —, ou **baixa atratividade de design e disponibilidade** para esse público.  
Assim, recomenda-se **avaliar o estoque e o mix de produtos plus size**, bem como **campanhas segmentadas** voltadas a esse grupo, ampliando o alcance de mercado e promovendo **inclusão** na oferta.  

A **segunda página do dashboard** apresenta uma visão complementar da análise, destacando aspectos diretamente relacionados às **transações e comportamento de compra**.  
Nela, são exibidos **gráficos sobre o percentual de desconto aplicado**, **métodos de pagamento utilizados** e o **total de itens vendidos**, permitindo compreender de forma mais ampla **como os consumidores realizam suas compras**.

<div align="center">

<img src="imagens\imagem2.png.png" alt="Dashboard Power BI – Página 2: Descontos, Pagamentos e Itens Vendidos" width="800px" style="border-radius:10px; box-shadow:0px 0px 10px rgba(0,0,0,0.15);" />

<p><i>Figura 2 – Segunda página do Dashboard Power BI com gráficos de percentual de desconto aplicado, métodos de pagamento e total de itens vendidos.</i></p>

</div>

### Percentual de Desconto Aplicado

O gráfico demonstra que **43% dos clientes realizaram suas compras utilizando cupons de desconto ativos**, o que indica uma **alta sensibilidade a promoções** e o potencial impacto das **estratégias de incentivo ao consumo**.  
É provável que dentro desse grupo estejam incluídos os **27% de assinantes da plataforma**, que podem usufruir de **benefícios e descontos exclusivos**.  

Por outro lado, **57% dos consumidores concluíram suas compras sem utilizar nenhum tipo de desconto**, o que abre espaço para **estratégias de fidelização**.  
A empresa pode, por exemplo, **oferecer cupons personalizados ou benefícios progressivos** para estimular novas compras e **incentivar a adesão ao plano de assinatura**.  
Essa abordagem permite equilibrar o volume de vendas com políticas de desconto sustentáveis, mantendo a margem de lucro e ampliando a base de clientes fiéis.

### Percentual de Métodos de Pagamento

O gráfico de **métodos de pagamento** revela uma **distribuição equilibrada** entre as formas disponíveis, demonstrando que os clientes utilizam **diferentes alternativas de acordo com conveniência e preferência pessoal**.  
O **PayPal** aparece como o método mais utilizado, com **17,36%** das transações — reflexo de sua **segurança, praticidade e integração com plataformas digitais**. Logo em seguida estão o **cartão de crédito (17,21%)** e o **pagamento em dinheiro (17,18%)**, mostrando que, embora os meios digitais dominem, **formas tradicionais de pagamento ainda mantêm relevância significativa**.  

O **cartão de débito (16,31%)** surge como outra opção importante para compras à vista, enquanto o **Venmo (16,26%)** — aplicativo móvel pertencente ao próprio PayPal — demonstra **adesão crescente de consumidores habituados a soluções de pagamento por smartphone**.  
Por fim, a **transferência bancária (15,69%)** aparece como o método menos utilizado, possivelmente por exigir mais etapas e não oferecer a mesma agilidade dos demais meios.

De forma geral, observa-se que **a diferença entre os percentuais é pequena**, evidenciando que a plataforma **oferece boa diversidade de opções de pagamento**, atendendo a **diferentes perfis e níveis de digitalização dos clientes**.  
Essa pluralidade é um ponto positivo, pois **reduz barreiras na finalização da compra** e contribui para **melhorar a experiência do usuário e a taxa de conversão**.

### Total de Itens Vendidos

O gráfico de **Total de Itens Vendidos** evidencia uma **distribuição equilibrada entre diversas categorias de produtos**, mostrando que os clientes apresentam **hábitos de compra variados e um interesse amplo pelo portfólio da loja**.  

Os itens mais vendidos foram **blusas, joias e calças**, cada um com **171 vendas**, indicando que o público tem preferência tanto por **vestuário casual** quanto por **acessórios de maior valor agregado**. Logo em seguida aparecem **camisas (169)** e **vestidos (166)**, reforçando a predominância de produtos de **uso cotidiano e de moda versátil**.  

Na faixa intermediária, destacam-se **suéteres (164)**, **jaquetas (163)** e **itens complementares** como **cintos, casacos e óculos de sol (161 cada)**, além de **sandálias (160)** e **meias (159)**, o que demonstra que **as compras não se concentram apenas em um tipo de produto, mas se estendem a diferentes estilos e necessidades**.  
Entre os itens menos vendidos estão **jeans (124)**, **mochilas (143)** e **luvas (140)**, sugerindo **menor demanda ou menor variedade de oferta nessas categorias**.

De forma geral, os resultados indicam que os clientes **mantêm uma grande diversidade em suas escolhas de compra**, o que pode refletir um **mix de produtos equilibrado e bem posicionado**.  
Esse comportamento diversificado reforça a importância de **manter estoques bem distribuídos entre as categorias**, garantindo que a plataforma continue atendendo às **preferências de diferentes perfis de consumidores**.

A **terceira página do dashboard** aprofunda a análise do **comportamento de compra dos clientes**, oferecendo uma visão detalhada sobre **frequência de compras, tipos de envio utilizados e histórico de compras anteriores**.  
Esses indicadores permitem compreender **com que regularidade os consumidores realizam novas aquisições**, além de identificar suas **preferências logísticas e padrões de fidelização**.  

Os visuais dessa seção incluem **tabelas e gráficos percentuais** que facilitam a comparação entre grupos de clientes, revelando **tendências de recompra**, **hábitos de consumo recorrente** e **métodos de entrega mais utilizados**.  
Essas informações são fundamentais para **ajustar estratégias de retenção, aprimorar o serviço de entrega** e **otimizar campanhas de recompra e assinatura**, fortalecendo o relacionamento com o cliente.

<div align="center">

<img src="imagens\imagem3.png.png" alt="Dashboard Power BI – Página 3: Frequência de compras, tipos de envio e histórico de compras anteriores" width="800px" style="border-radius:10px; box-shadow:0px 0px 10px rgba(0,0,0,0.15);" />

<p><i>Figura 3 – Terceira página do Dashboard Power BI com gráficos de percentual de frequência de compras, totais de tipos de envio e contagem de clientes por compras anteriores.</i></p>

</div>

### Percentual de Frequência de Compras

O **primeiro gráfico da terceira página** apresenta o **percentual de frequência de compras** dos clientes.  
Observa-se que a **maior frequência ocorre a cada 3 meses (14,97%)**, seguida das compras **anuais (14,67%)**.  

No grupo intermediário, com percentuais próximos aos mais frequentes, estão as compras **trimestrais (quarterly, 14,44%)**, **mensais (14,18%)** e **quinzenais (14,03%)**.  
As **menores frequências** correspondem às compras **quinzenais (fortnightly, 13,90%)** e **semanais (13,82%)**, indicando que **os clientes que compram com maior regularidade representam o menor grupo**.  

Apesar de pequenas inconsistências nas nomenclaturas e percentuais exibidos no gráfico, **a distribuição geral é bastante equilibrada**, sugerindo que o público realiza compras em **intervalos variados**, sem uma concentração significativa em apenas uma frequência.  
Essa informação é relevante para **planejar campanhas de marketing, promoções e estratégias de retenção**, de acordo com os diferentes padrões de compra.

### Totais de Tipos de Envio

O **segundo gráfico da terceira página** apresenta os **totais de tipos de envio utilizados pelos clientes**.  
Observa-se que o **frete grátis** é o mais utilizado, com **675 registros**, o que pode estar relacionado a **benefícios oferecidos a clientes assinantes** ou **promoções com cupons especiais**.  
Logo em seguida aparece o **envio padrão (standard)**, com **654 entregas**, indicando que, mesmo com opções pagas, muitos consumidores ainda optam por modalidades convencionais e acessíveis.  

No grupo intermediário, destacam-se a **retirada na loja (650)** e o **envio aéreo para o dia seguinte (next day air, 648)** — opções que representam **diferentes perfis de comportamento**: clientes que preferem **conveniência e agilidade**, e outros que buscam **rapidez imediata na entrega**.  
Os tipos **express (646)** e **envio em 2 dias (627)** foram os menos utilizados, embora a diferença percentual entre eles e os demais seja pequena.  

De forma geral, o gráfico revela um **equilíbrio na utilização dos tipos de envio**, o que reforça a **diversidade de opções disponíveis na plataforma**.  
Esse equilíbrio indica que os clientes **valorizam tanto a economia quanto a flexibilidade de escolha**, permitindo à empresa **ajustar suas políticas logísticas** para atender a diferentes perfis de consumo e preferências de entrega.

### Contagem de Clientes por Compras Anteriores

O **gráfico de contagem de clientes por compras anteriores** apresenta **variações constantes na quantidade de consumidores que retornam à plataforma para novas aquisições**.  
Observa-se que os valores **oscilam entre 58 e 97 clientes**, demonstrando **uma base de consumidores recorrentes**, porém com **comportamento de recompra irregular**.  

O **maior pico ocorre próximo a 30 compras anteriores**, com **97 clientes**, enquanto o **menor valor aparece em torno de 50 compras anteriores**, com **58 clientes**.  
Essa variação sugere que, embora exista **um grupo fiel de consumidores que realiza compras de forma recorrente**, há também **flutuações significativas** que podem estar associadas a fatores como **campanhas promocionais**, **sazonalidade** ou **mudanças nas condições de compra**.  

As **quedas acentuadas entre determinados pontos** evidenciam **possíveis perdas de clientes ao longo do tempo**, indicando a necessidade de **estratégias voltadas à retenção e fidelização**, como:  

* **Programas de benefícios e recompensas**;  
* **Descontos progressivos**;  
* **Comunicação personalizada e segmentada**.  

De forma geral, o gráfico mostra **uma base de clientes com bom potencial de fidelização**, mas que ainda requer **ações consistentes para estabilizar e ampliar o número de consumidores recorrentes**.  


A **quarta e última página do dashboard** encerra a análise sobre o **comportamento de compra dos clientes**, apresentando uma visão consolidada dos **percentuais de compras por estação do ano**, **total de compra por categoria** e **distribuição geográfica das compras**.  

Esses indicadores possibilitam compreender **como as estações influenciam o comportamento de consumo**, **quais categorias de produtos se destacam nas preferências dos clientes** e **quais localidades concentram o maior volume de compras**, oferecendo **subsídios valiosos para estratégias de marketing sazonais** e **decisões de estoque mais assertivas**.  



<div align="center">

<img src="imagens\imagem4.png.png" alt="Dashboard Power BI – Página 4: Percentuais de compras por estação do ano, totais de compras por categoria e distribuição geográfica das compras" width="800px" style="border-radius:10px; box-shadow:0px 0px 10px rgba(0,0,0,0.15);" />

<p><i>Figura 4 – Quarta página do Dashboard Power BI com gráficos de percentual de compras por estação do ano, total de compra por categoria e distribuição geográfica das compras.</i></p>

</div>

### Percentual de Compras por Estação

O **gráfico percentual de compras por estação** evidencia **um equilíbrio notável na quantidade de compras ao longo das estações do ano**, com **percentuais bastante próximos entre si**.  
A **primavera** se destaca como o período de maior volume de compras, representando **25,62% do total**, seguida de **outono** com **25%**, **inverno** com **24,9%** e, por fim, **verão** com **24,49%**, apresentando a menor participação.  

Esses resultados indicam que os **clientes mantêm um comportamento de compra constante durante todo o ano**, sem fortes variações sazonais, o que representa **um ponto positivo para a plataforma**, pois demonstra **estabilidade nas vendas e engajamento contínuo do público consumidor**.  
