# ProjectErp

## Encje
1.Client
  - id
  - name
  - nip
  - phone
  - email
  - description
  - active
  ---
  Relacje
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
  Relacje
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
  Relacje
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
  - orderId (ManyToOne)

## Panele
1. Do tworzenia encji
2. Wyszukiwania, modyfikacji, usuwania (tabela z asc|dsc na kolumnach)
3. Panel tworzenia zamówień (sprzedaży)

## Byłoby miło
1. Panel do logowania użytkownika
2. Dodanie do order pozycji kto wystawił zamówienie
3. Wyliczanie ceny produktu na podstawie kursów walut
4. Koszyk dla sesji
5. Generowanie histori zamówień klientów
6. Tworzenie zestawień sprzedaży w skali (miesięcznej/kwartalnej/rocznej/tryb ręczny)
