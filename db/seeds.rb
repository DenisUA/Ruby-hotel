User.create!(first_name: 'John',
             last_name: 'Wayne',
             email: 'johnwayne@example.com',
             password: '12345678',
             password_confirmation: '12345678',
             phone: '+380300000000',
             gender: true,
             birth_date: DateTime.new(1990,7, 1),
             admin: true)

User.create!(first_name: 'Diana',
            last_name: 'Prince',
            email: 'dianaprince@example.com',
            password: '12345678',
            password_confirmation: '12345678',
            phone: '+380300000001',
            gender: false,
            birth_date: DateTime.new(1000,3, 4),
            admin: false)

Apartment.create!(room_number: '101',
                 status: 0,
                 price: 100,
                 description: 'Certainly elsewhere my do allowance at.',
                 room_type: 0,
                 occupancy: 1)

Apartment.create!(room_number: '201',
                 status: 0,
                 price: 500,
                 description: 'Certainly elsewhere my do allowance at.',
                 room_type: 1,
                 occupancy: 2)

Apartment.create!(room_number: '301',
                 status: 0,
                 price: 1000,
                 description: 'Certainly elsewhere my do allowance at.',
                 room_type: 3,
                 occupancy: 2)

Apartment.create!(room_number: '401',
                 status: 0,
                 price: 1500,
                 description: 'Certainly elsewhere my do allowance at.',
                 room_type: 4,
                 occupancy: 2)
