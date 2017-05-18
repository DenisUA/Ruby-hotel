User.create!(first_name: 'John',
             last_name: 'Wayne',
             email: 'johnwayne@example.com',
             phone: '+380300000000',
             gender: true,
             birth_date: DateTime.new(1990, 7, 1),
             admin: true)

User.create(first_name: 'Diana',
            last_name: 'Prince',
            email: 'dianaprince@example.com',
            phone: '+380300000001',
            gender: false,
            birth_date: DateTime.new(1000, 3, 4),
            admin: false)
