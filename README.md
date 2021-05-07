# API LEAGUE OF LEGENDS - Champions :crossed_swords:
> API desenvolvida com Ruby on Rails para colecionar os personagens (cammpeões) do jogo League of legends, com funcões de criação de campeao, deletar campeão, editar campeão e verificar os campeões adquiridos dentro da coleção.

## TECNOLOGIAS
>postgresql

>Ruby

>Rails

>Faker-GEMS (seeds)

## ROUTES
# ADMIN:
```sh
GET /champions/admin/load_all_champions
```
Retorna todos os campeões cadastrados na coleção.

```sh
POST /champions/admin/create_champion
```
Registra um novo campeão na coleção

Formato JSON utilizado:
```json
{
    "name":caitlyn,
    "location":piltover,
    "masteries":seven
}
```

```sh
DELETE /champions/admin/delete_champion/:id
```
Remove o registro do campeão do id passado na url.

```sh
PATCH /champions/admin/update_champion/:id
```
Atualiza o registro do campeao referente ao id passado na url, com o formato JSON definido no POST.

# User
```sh
GET /champions/user/find_champion_by_name/:name
```
Encontra o campeão pelo nome passado na url.
```sh
POST /champions/user/adquirir_campeao
```
Obtem um Campeão, o memos erá adicionado a lista de adquiridos.
```sh
GET /champions/user/load_champions_adquiridos
```
Exibe a lista de campeões adquiridos.
```sh
GET /champions/user/load_champion_adquirido_by_name/:name
```
Busca os campeões pelo nome.
