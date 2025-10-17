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

## Preview do Dashboard  

Abaixo está a primeira visualização desenvolvida no Power BI.  
Ela apresenta **cartões segmentados por faixa etária** dos clientes, além de **gráficos de percentual de gênero**, **status de assinatura** e **total de vendas por tamanho de produto**.  

Iniciando a análise, tem-se o visual do Power BI apresentando informações que permitem compreender o **perfil demográfico e comportamental dos consumidores**, facilitando a identificação de padrões iniciais de compra e preferências.  


<div align="center">

<img src="imagens\imagem1.png.png" alt="Dashboard Power BI – Comportamentos de Compra" width="800px" style="border-radius:10px; box-shadow:0px 0px 10px rgba(0,0,0,0.15);" />

<p><i>Figura 1 – Visual principal do Dashboard Power BI com segmentação por faixa etária, gênero e vendas por tamanho.</i></p>

</div>

## Análise de Faixas Etárias dos Clientes

Nos **cartões do dashboard** é possível observar o número total de clientes para cada faixa etária.  
A divisão das faixas etárias foi realizada previamente no **MySQL**, assim como as visualizações iniciais e limpezas necessárias dos dados.

### Código SQL utilizado para criar a coluna `Age_Group`

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

    Após a adição da coluna e verificação dos dados, os registros foram importados para o Power BI para a elaboração dos visuais.
    Código DAX utilizado para contar clientes por faixa etária

    Contagem de Age_Group para 18-25 = 
CALCULATE(
	COUNTA('vw_clientes_limpos'[Age_Group]),
	'vw_clientes_limpos'[Age_Group] IN { "18-25" }
)

Com as medidas adicionadas, iniciou-se a elaboração do visual de cartões por faixa etária, conforme é possível visualizar na imagem acima.
Essa abordagem permite identificar rapidamente a distribuição de clientes por idade, oferecendo insights valiosos para análises subsequentes.