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

Os **cartões do dashboard** apresentam o **total de clientes distribuídos por faixa etária**.  
Observa-se que a **faixa de 18 a 25 anos** concentra o **maior número de clientes**, totalizando **571 pessoas**.  
É importante destacar que essa é também a **faixa etária com maior amplitude (8 anos)**, o que pode ter contribuído para o número mais elevado de registros.

Em seguida, as faixas de **46 a 50 anos** e **56 a 60 anos** apresentam a **mesma contagem total de 382 clientes cada**, configurando-se juntas como o **segundo maior grupo** em número de consumidores.  
Logo após, vêm os clientes de **26 a 30 anos (378 clientes)**, seguidos pelas faixas de **51 a 55 anos (371 clientes)**, **41 a 45 anos (368 clientes)** e **61 a 65 anos (368 clientes)** — mostrando uma distribuição relativamente equilibrada entre essas idades intermediárias.

As faixas de **31 a 35 anos (364 clientes)** e **36 a 40 anos (361 clientes)** mantêm uma leve redução, enquanto o grupo de **66 a 70 anos** apresenta o **menor volume de compradores**, com **355 clientes**.

De forma geral, nota-se uma **maior concentração de clientes nas idades jovens e intermediárias**, com uma **tendência de queda gradual** nas faixas etárias mais elevadas.

O **primeiro gráfico** apresenta a **distribuição percentual de clientes por gênero**, revelando que **68% dos compradores são homens** e **32% são mulheres**.  

Essa diferença indica uma **maior predominância do público masculino** entre os consumidores, sugerindo a oportunidade de **analisar as preferências desse grupo** para aprimorar a experiência de compra e potencializar as vendas.  

Ao mesmo tempo, o dado também destaca a importância de **investigar possíveis barreiras** que estejam impactando a participação feminina, de forma a **desenvolver estratégias mais inclusivas** e **estimular o engajamento do público feminino** na plataforma.
