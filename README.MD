# RNu-D2

Os códigos desse repositório servem para extrair e limpar os dados da fatura atual do Nubank. As transações da fatura atual do Nubank, disponíveis na página inicial do Nubank, são transformado num CSV que pode ser utilizado para organizar o orçamento. No futuro, em vez de CSV, será possível conectar diretamente com API do [YNAB](https://www.youneedabudget.com/), permitindo atualizar o orçamento no YNAB com transações do Nubank de forma automática, sem precisar por os dados manualmente, como hoje. 

## Pra que isso?

O Nubank permite a extração de faturas passadas em CSV, mas os dados de faturas ainda não fechadas, do mês corrente, não podem ser exportadas da mesma forma. Como tal, a organização das transações do Nubank num orçamenton deve ser feita de forma completamente manual. 

Isso é especialmente tedioso no caso do aplicativo YNAB, que possui a filosofia "Roll with the punches": o orçamento é um plano vivo, que deve ser atualizado constamente e, portanto, as transações devem estar sempre atualizadas. Dessa forma, para ele funcionar, no caso do Nubank, o melhor é atualizar imediatamente ou poucos dias depois de se fazer uma transação, o que pode ser um entrave para a própria utilização do app.

Certamente há uma maneira melhor de fazer isso. 

O foco futuro desse código é permitir que esses dados possam:
1. Ser extraídos usando apenas R, sem a necessidade de extração manual com o Scrapper do Artoo.Js; 
2. Ser inserido no app de orçamento YNAB via API. 

O objetivo final, portanto, é conectar o Nubank ao YNAB na falta de uma API oficial do Nubank e de uma conexão oficial do YNAB com bancos fora dos Estados Unidos e Canadá. 

## O que tem nesse código agora?

No momento, o fluxo é o seguinte:

1. Entrar na conta pessoal do [Nubank](http://medialab.github.io/artoo/quick_start/);
1. Ativar o Artoo.Js usando o bookmarklet disponível no [site](http://medialab.github.io/artoo/quick_start/) deles;
1. No console do navegador, inserir e ativar o código disponível em javascript nesse repositório, salvando o arquivo CSV;
1. Por a tabela CSV na mesma pasta do projeto de R disponível nesse repositório;
1. Ativar o script dentro do projeto em R desse repositório; 

Há vários pontos para melhorar, mas é um primeiro passo que funciona. 

## Porque RNU-D2?

Como o projeto usa, inicialmente, a biblioteca [Artoo.js](http://medialab.github.io/artoo/), criou-se um trocadilho com R2-D2 (lido em inglês) e Nu de Nubank. 🙂
