# rando

Random demo data generator

Faker inspired gem without bloat, a small library ideal for creating simple demo/seed data, an zero dependencies

Shout out to:

- [https://mockaroo.com/](https://mockaroo.com/) for sweet demo data.
- [https://github.com/caedmonjudd/betterlorem/tree/master/lib](https://github.com/caedmonjudd/betterlorem/tree/master/lib) where I took my lorem ipsum inspiration from.

### Usage

#### Name

Generate a full name (first and last): 'Tom Waits'

```ruby
Rando.name
```

#### First name

Generate a first name: 'Tom'

```ruby
Rando.firstname
```

#### Last name

Generate a last name: 'Waits'

```ruby
Rando.lastname
```

#### Lorem ipsum

Generate some random prose: "Tuum. Ego autem dico vobis diligite inimicos vestros, benefacite his qui oderunt vos, et orate."

- `count` defaults to roughly `2` sentences

```ruby
Rando.lorem_sentences(count = 2)
```

#### Email

Generate an email address from a string: "tom_waits@example.com"

- `name` is required
- `domain` defaults to `example.com`

```ruby
Rando.email_from_name(name, domain = 'example.com')
```

#### Phone number

Generate a phone number: "123-345-5678"

```ruby
Rando.phone_number
```

#### Street address

Generate a street address: "16632 Hamilton Drive"

```ruby
Rando.street_address
```

#### Address

Generate a full address with city and postal code: "16632 Hamilton Drive, Swan Hills, Alberta, E4B 4G2"

```ruby
Rando.address
```
