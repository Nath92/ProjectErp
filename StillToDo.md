# ProjectErp

## Entities
Bartek -> po obiadku
1.Client
  Relations
  - List<'Baskets'> (OneToMany)

2.Basket
  Relations
  - clientId (ManyToOne)

## ToDo
1. Search, modify, delete (tabel with asc|dsc on columns)
2. Panel for creating orders

##Front-End
1. Validations
2. List for provinces
3. Left-panel JS FIX + FIX links

## Would be nice to complete
1. Login panel (session)
2. Adding log info to orders (which user placed order)
3. Getting item price based on gold value
4. Session basket
5. Generating history of orders for specific client
6. Creating charts with sails for (month/quarter/year/specific period)
