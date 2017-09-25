# ProjectErp

## Entities
1.Client
  - id
  - name
  - nip
  - phone
  - email
  - description
  - active
  ---
  Relations
  - address (OneToMany)
  - List<'Orders'> (OneToMany)

2.Address
  - id
  - postalCode
  - city
  - province
  - street
  - houseNumber
  - localNumber
  ---
  Relations
  - client (ManyToOne)

3.Product
  - id
  - name
  - standard
  - availability
  - weight
  - currentPrice

4.Order
  - id
  - createdDate
  - shippingDate
  - paymentDate
  - totalPrice
  ---
  Relations
  - clientId (ManyToOne)
  - List<'OrderItem'> (OneToMany)

5.OrderItem
  - id
  - name
  - quantity
  - weight
  - price
  - productId
  ---
  Relations
  - orderId (ManyToOne)

## ToDo
1. Links to add entities
2. Search, modify, delete (tabel with asc|dsc on columns)
3. Panel for creating orders

## Would be nice to complete
1. Login panel (session)
2. Adding log info to orders (which user placed order)
3. Getting item price based on gold value
4. Session basket
5. Generating history of orders for specific client
6. Creating charts with sails for (month/quarter/year/specific period)
