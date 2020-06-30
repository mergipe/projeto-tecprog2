# Contador de calorias e macronutrientes

Este projeto se baseia em aplicativos como MyFitnessPal, que auxilia o usuário
a contabilizar as calorias e macronutrientes consumidos diariamente.

O objetivo é permitir que o usuário adicione, edite e remova alimentos e use-os
para montar as refeições diárias. O total de calorias e macronutrientes
consumidos em um dia é atualizado de acordo com o que é registrado.


## Funcionalidades

- Adicionar, editar, remover e buscar alimentos
- Adicionar, editar, remover e ver as refeições realizadas em cada dia
- Adicionar, editar e remover registros de alimentos consumidos em uma dada
  refeição
- Os alimentos podem ser cadastrados com diferentes porções de referência, que
  servem de opção no momento de fazer um registro em uma refeição
- O usuário pode ver todos os alimentos cadastrados por outros usuários da
  plataforma
- Editar e acompanhar o andamento das metas diárias de consumo de
  macronutrientes
- Editar e-mail e senha da conta, e também cancelá-la


## Bibliotecas e ferramentas utilizadas

- Ruby 2.6.3
- Rails 6.0.3.1
- SQlite 3
- Bootstrap
- Devise
- Gema bootstrap_form: facilita a elaboração dos formulários
- Gema delocalize: possibilita o uso de vírgulas no lugar de pontos em números
- Gema validates_timeliness: validação de hora e data


## To do

### Visual
- melhorar o layout de alimentos/info
- melhorar o layout do Diário
- arrumar scroll da tabela de Alimentos
- arrumar tamanho da lista/tabela de Alimentos

### Outros
- deploy no Heroku
